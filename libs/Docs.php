<?php

use Titon\Cache\Storage\FileSystemStorage;
use Titon\Cache\Traits\StorageAware;
use Titon\G11n\Utility\Inflector;
use Titon\Http\Exception\NotFoundException;
use Titon\Io\File;
use Titon\Io\Folder;
use Titon\Io\Reader\JsonReader;
use Titon\Mvc\Application;
use Titon\Mvc\Traits\AppAware;
use Titon\Utility\Path;

class Docs {
    use AppAware, StorageAware;

    public function __construct() {
        $this->setApplication(Application::getInstance());
        $this->setStorage(new FileSystemStorage(['directory' => TEMP_DIR . 'cache/docs/']));
    }

    public function buildVersions($version) {
        $version = substr($version, 0, 3);
        $versions = [$version];

        if (substr($version, -1) <= 0) {
            $versions[] = substr($version, 0, 1) . '.x';
        } else {
            while (substr($version, -1) >= 0) {
                $version -= 0.1;

                if (strlen($version) === 1) {
                    $versions[] = $version . '.x';
                    break;
                } else {
                    $versions[] = $version;
                }
            }
        }

        return $versions;
    }

    public function compileFile(File $file) {
        $key = md5($file->path());
        $content = $this->parseMarkdown($file->read());

        $this->getStorage()->set($key, $content, '+1 week');

        return $content;
    }

    public function compileFolder(Folder $folder) {
        foreach ($folder->read() as $file) {
            if ($file instanceof File) {
                $this->compileFile($file);
            } else {
                $this->compileFolder($file);
            }
        }

        return $this;
    }

    public function compileSources($source, $version) {
        return $this->compileFolder(new Folder($this->locateSource($source, $version)));
    }

    public function getSource($source, $version, $query) {
        $file = new File(Path::ds($this->locateSource($source, $version, $query)));

        if (!$file->exists()) {
            throw new NotFoundException('Docs Not Found');
        }

        $key = md5($file->path());

        if ($content = $this->getStorage()->get($key)) {
            return $content;
        }

        return $this->compileFile($file);
    }

    public function getToc($source, $version) {
        $locale = $this->getApplication()->get('g11n')->current()->getCode();
        $versions = $this->buildVersions($version);
        $path = '';

        foreach ($versions as $version) {
            $lookup = DOCS_DIR . sprintf('%s-%s/%s/toc.json', $source, $version, $locale);

            if (file_exists($lookup)) {
                $path = $lookup;
                break;
            }
        }

        if (!$path) {
            throw new NotFoundException('Table of Contents Not Found');
        }

        $file = new JsonReader(Path::ds($path));
        $key = md5($file->path());

        if ($content = $this->getStorage()->get($key)) {
            return $content;
        }

        $content = $file->read();

        $this->getStorage()->set($key, $content, '+1 week');

        return $content;
    }

    public function locateSource($source, $version, $query = null) {
        $locale = $this->getApplication()->get('g11n')->current()->getCode();
        $versions = $this->buildVersions($version);

        foreach ($versions as $version) {
            $base = DOCS_DIR . sprintf('%s-%s/%s/', $source, $version, $locale);
            $paths = [$base];

            if ($query) {
                $paths = [$base . $query . '.md', $base . $query . '/index.md'];
            }

            foreach ($paths as $path) {
                if (file_exists($path)) {
                    return $path;
                }
            }
        }

        throw new NotFoundException('Sources Not Found');
    }

    public function parseChapters(array $chapters) {
        $toc = [];
        $chapterCount = count($chapters) - 1;
        $chapterStack = [];
        $typeStack = [];
        $appendToLast = function(&$chapterStack, &$typeStack) {
            $lastChapter = array_pop($chapterStack);
            array_pop($typeStack);

            $chapterStack[count($typeStack) - 1]['children'][] = $lastChapter;
        };

        // Group by type
        foreach ($chapters as $i => $chapter) {

            // Lower depth, go deeper
            if (!$chapterStack || $chapter['type'] > end($typeStack)) {
                $chapterStack[] = $chapter;
                $typeStack[] = $chapter['type'];

            // Same depth, append previous item and start new stack
            } else if ($chapter['type'] == end($typeStack)) {
                $appendToLast($chapterStack, $typeStack);

                if ($i == $chapterCount) {
                    $chapterStack[count($typeStack) - 1]['children'][] = $chapter;
                } else {
                    $chapterStack[] = $chapter;
                    $typeStack[] = $chapter['type'];
                }

            // Higher depth, close parent
            } else if ($chapter['type'] < end($typeStack)) {
                $appendToLast($chapterStack, $typeStack);
            }
        }

        // Append remaining stack
        for ($i = count($chapterStack) - 1; $i >= 0; $i--) {
            if ($i === 0) {
                $toc = $chapterStack[0];
            } else {
                $appendToLast($chapterStack, $typeStack);
            }
        }

        return $toc;
    }

    public function parseMarkdown($content) {
        $parsedown = new Parsedown();

        // Parse the file
        $parsed = $parsedown->parse($content);

        // Replace .md in URLs
        $parsed = str_replace('.md', '', $parsed);

        // Break up into sections
        $parsed = explode("\n", $parsed);
        $parsedLength = count($parsed) - 1;
        $sections = [];
        $currentSection = '';
        $sectionHash = '';
        $toc = [];

        foreach ($parsed as $i => $line) {
            preg_match('/^<h([1-6])>(.*?)<\/h([1-6])>$/', $line, $matches);

            // Append to the current open section
            if (empty($matches)) {
                $currentSection .= "\n" . $line;

                if ($i >= $parsedLength) {
                    $sections[$sectionHash] = $currentSection;
                }

            // Break up the document into sections based on h2 tags
            } else if ($matches[1] == 1 || $matches[1] == 2) {
                if ($matches[1] == 2) {
                    $sections[$sectionHash] = $currentSection;
                }

                $sectionHash = Inflector::slug(trim($matches[2]));
                $currentSection = $line;

                $toc[] = [
                    'title' => $matches[2],
                    'url' => '#' . $sectionHash,
                    'type' => $matches[1],
                    'children' => []
                ];

            // Rewrite h3-h6 tags to have an ID
            } else {
                $hash = Inflector::slug(trim($matches[2]));
                $currentSection .= "\n" . sprintf('<h%s id="%s">%s</h%s>', $matches[1], $hash, $matches[2], $matches[3]);

                $toc[] = [
                    'title' => $matches[2],
                    'url' => '#' . $hash,
                    'type' => $matches[1],
                    'children' => []
                ];
            }
        }

        return [
            'toc' => $this->parseChapters($toc),
            'chapters' => $sections
        ];
    }

}