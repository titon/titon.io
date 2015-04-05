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
        $content = $this->parseMarkdown($file);

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

    public function flattenToc(array $toc) {
        $flattened = [];

        foreach ($toc as $item) {
            if (empty($item['url'])) {
                continue;
            }

            $flattened[$item['url']] = $item;

            if (!empty($item['children'])) {
                $flattened = array_merge($flattened, $this->flattenToc($item['children']));
            }
        }

        return $flattened;
    }

    public function findChapter(array $toc, $url) {
        $tocGrouped = $this->flattenToc($toc['children']);
        $url = str_replace('\\', '/', dirname($url));

        if (isset($tocGrouped[$url])) {
            $chapter = $tocGrouped[$url];
        } else {
            $chapter = $toc;
        }

        return $chapter;
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

            if ($query !== null) {
                $paths = [$base . $query . '.md', $base . $query . '/index.md'];
            }

            foreach ($paths as $path) {
                if (is_file($path) && file_exists($path)) {
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
            $currentType = (int) $chapter['type'];
            $lastType = (int) end($typeStack);

            // Lower depth, go deeper
            if (!$lastType || $currentType > $lastType) {
                $chapterStack[] = $chapter;
                $typeStack[] = $currentType;

            // Same depth, append previous item and start new stack
            } else if ($currentType === $lastType) {
                $appendToLast($chapterStack, $typeStack);

                if ($i == $chapterCount) {
                    $chapterStack[count($typeStack) - 1]['children'][] = $chapter;
                } else {
                    $chapterStack[] = $chapter;
                    $typeStack[] = $currentType;
                }

            // Higher depth, close parent and start a new one
            } else if ($currentType < $lastType) {
                $appendToLast($chapterStack, $typeStack);
                $appendToLast($chapterStack, $typeStack);

                $chapterStack[] = $chapter;
                $typeStack[] = $currentType;
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

    public function parseMarkdown(File $file) {
        $parsedown = new Parsedown();
        $path = $file->path();

        // Parse the file
        $parsed = $parsedown->parse($file->read());

        // Replace .md in URLs
        $parsed = str_replace('.md', '', $parsed);

        // Wrap tables for responsiveness
        $parsed = str_replace('<table', '<div class="table-responsive"><table', $parsed);
        $parsed = str_replace('</table>', '</table></div>', $parsed);

        // Fix URLs on index pages
        if (basename($path) === 'index.md') {
            $folder = basename(dirname($path));
            $parsed = preg_replace_callback('/<a href="([-a-zA-Z0-9\/\.]+)">/', function($matches) use ($folder) {
                return sprintf('<a href="%s">', $folder . '/' . $matches[1]);
            }, $parsed);
        }

        // Break up into sections
        $parsed = explode("\n", $parsed);
        $parsedLength = count($parsed) - 1;
        $sections = [];
        $currentSection = '';
        $sectionHash = '';
        $title = '';

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
                if ($matches[1] == 1) {
                    $title = $matches[2];
                }

                if ($matches[1] == 2) {
                    $sections[$sectionHash] = $currentSection;
                }

                $sectionHash = $this->makeHash($matches[2]);
                $currentSection = $line;

                if (is_numeric($sectionHash)) {
                    $sectionHash = 'no-' . $sectionHash;
                }

            // Rewrite h3-h6 tags to have an ID
            } else {
                $hash = $this->makeHash($matches[2]);

                if (is_numeric($hash)) {
                    $hash = 'no-' . $hash;
                }

                $currentSection .= "\n" . sprintf('<h%s id="%s">%s</h%s>', $matches[1], $hash, $matches[2], $matches[3]);
            }
        }

        $paths = preg_split('/([a-z]+)-([0-9\.x]+)/', $path);

        return [
            'path' => str_replace('\\', '/', $paths[1]),
            'title' => $title,
            'sections' => $sections
        ];
    }

    public function makeHash($string) {
        return str_replace('.', '', Inflector::slug(str_replace('&amp;', 'and', trim($string))));
    }

}
