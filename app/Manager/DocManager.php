<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

namespace Titon\Manager;

use League\CommonMark\Block\Element\Header;
use League\CommonMark\DocParser;
use League\CommonMark\Environment;
use League\CommonMark\HtmlElement;
use League\CommonMark\HtmlRenderer;
use League\Flysystem\Adapter\Local;
use League\Flysystem\Filesystem;
use RuntimeException;

class DocManager {

    /**
     * @var \League\Flysystem\Filesystem
     */
    protected $flysystem;

    /**
     * Instantiate a new documentation manager for a project.
     *
     * @param string $project
     */
    public function __construct($project) {
        $this->flysystem = new Filesystem(new Local(SRC_DIR . 'docs/' . $project . '/'));
    }

    /**
     * Determine a valid version by looping through a list of possible versions in descending order.
     *
     * @param string $version
     * @return array
     */
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

    /**
     * Compile a file by reading its contents, extracting the title, sections, and finally convert to HTML.
     *
     * @param string $path
     * @return array
     */
    public function compileFile($path) {
        $environment = Environment::createCommonMarkEnvironment();
        $renderer = new HtmlRenderer($environment);
        $document = (new DocParser($environment))->parse($this->flysystem->read($path));
        $sections = [];
        $title = '';
        $sectionContent = '';
        $sectionHash = '';

        foreach ($document->getChildren() as $child) {

            // Start a new section at each header
            if ($child instanceof Header) {

                // Extract the title if first header
                if ($child->getLevel() === 1) {
                    $title = $child->getStringContent();
                    $sectionHash = $this->makeHash($title);

                // Start a new section if not first
                } else {
                    $sections[$sectionHash] = $sectionContent;
                    $sectionContent = '';
                    $sectionHash = $this->makeHash($child->getStringContent());
                }
            }

            // Render the individual child into different sections
            /** @var HtmlElement $renderedSection */
            $renderedSection = $renderer->renderBlock($child);

            // Add an ID to headers
            if ($child instanceof Header) {
                $renderedSection->setAttribute('id', $sectionHash);
            }

            $sectionContent .= (string) $renderedSection;
        }

        // Append last section
        $sections[$sectionHash] = $sectionContent;

        // Parse the Markdown even further
        foreach ($sections as $key => $section) {
            $sections[$key] = $this->parseMarkdown($section, $path);
        }

        return [
            'path' => $path,
            'title' => $title,
            'sections' => $sections
        ];
    }

    /**
     * Flatten the table of contents and index each item by it's URL.
     *
     * @param array $toc
     * @return array
     */
    public function flattenToc(array $toc) {
        $flattened = [];

        foreach ($toc as $item) {
            if (empty($item['url'])) {
                continue;
            }

            $flattened[trim($item['url'], '/')] = $item;

            if (!empty($item['children'])) {
                $flattened = array_merge($flattened, $this->flattenToc($item['children']));
            }
        }

        return $flattened;
    }

    /**
     * Find a list of chapters within the current section path.
     *
     * @param array $toc
     * @param string $path
     * @return array
     */
    public function findChapters(array $toc, $path) {
        $tocGrouped = $this->flattenToc($toc['children']);
        $path = str_replace('\\', '/', dirname($path));

        if (isset($tocGrouped[$path])) {
            $chapter = $tocGrouped[$path];
        } else {
            $chapter = $toc;
        }

        return $chapter;
    }

    /**
     * Locate, load, and convert a documentation Markdown file to HTML.
     *
     * @param string $version
     * @param string $path
     * @return string
     */
    public function getSource($version, $path) {
        $path = $this->locateSource($version, $path . '.md');

        return $this->compileFile($path);
    }

    /**
     * Locate, load, and parse the documentation JSON table of contents.
     *
     * @param string $version
     * @return array
     */
    public function getToc($version) {
        $path = $this->locateSource($version, 'toc.json');

        return json_decode($this->flysystem->read($path), true);
    }

    /**
     * Locate a source file by looping through a possible list of version path combinations.
     *
     * @param string $version
     * @param string [$target]
     * @return string
     */
    public function locateSource($version, $file = '') {
        $versions = $this->buildVersions($version);

        foreach ($versions as $version) {
            $base = sprintf('%s/%s/', $version, 'en');

            if ($file) {
                $paths = [$base . $file, $base . str_replace('.md', '', $file) . '/index.md'];
            } else {
                $paths = [$base];
            }

            foreach ($paths as $path) {
                if ($this->flysystem->has($path)) {
                    return $path;
                }
            }
        }

        throw new RuntimeException(sprintf('Documentation source [%s] could not be located', $file));
    }

    /**
     * Parse the Markdown even further by fixing specific situations.
     *
     * @param string $contents
     * @param string $path
     * @return string
     */
    public function parseMarkdown($contents, $path) {

        // Replace .md in URLs
        $contents = str_replace('.md', '', $contents);

        // Wrap tables for responsiveness
        $contents = str_replace('<table', '<div class="table-responsive"><table', $contents);
        $contents = str_replace('</table>', '</table></div>', $contents);

        // Fix URLs on index pages
        if (basename($path) === 'index.md') {
            $folder = basename(dirname($path));
            $contents = preg_replace_callback('/<a href="([-a-zA-Z0-9\/\.]+)">/', function($matches) use ($folder) {
                return sprintf('<a href="%s">', $folder . '/' . $matches[1]);
            }, $contents);
        }

        return $contents;
    }

    /**
     * Convert a header title into a hash.
     *
     * @param string $string
     * @return string
     */
    public function makeHash($string) {
        $hash = strtolower(str_replace('.', '', str_replace('&amp;', 'and', str_replace(' ', '-', str_replace('-', '_', trim($string))))));

        if (is_numeric($hash)) {
            $hash = 'no-' . $hash;
        }

        return $hash;
    }

}
