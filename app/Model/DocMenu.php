<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

namespace Titon\Model;

use League\Flysystem\Adapter\Local;
use League\Flysystem\Filesystem;
use Titon\Manager\DocManager;
use RuntimeException;
use SplQueue;

class DocMenu {

    /**
     * Table of contents parsed from the JSON source.
     *
     * @type array
     */
    protected $contents = [];

    /**
     * Type of project.
     *
     * @type string
     */
    protected $project;

    /**
     * Relative path to the source Markdown file.
     *
     * @var string
     */
    protected $sourcePath;

    /**
     * The source version folder used.
     *
     * @var string
     */
    protected $sourceVersion;

    /**
     * URL path provided for location.
     *
     * @var string
     */
    protected $urlPath;

    /**
     * Version found in the URL.
     *
     * @var string
     */
    protected $version;

    /**
     * @param string $project
     * @param string $version
     * @param string $path
     */
    public function __construct($project, $version, $path = '') {
        $this->urlPath = $path;
        $this->project = $project;
        $this->version = $version;
        $this->flysystem = new Filesystem(new Local(SRC_DIR . 'docs/' . $project . '/'));

        $this->locateSource();
        $this->compileMenu();
    }

    /**
     * Return a list of top level navigation items.
     *
     * @return array
     */
    public function getNavigation() {
        $nav = $icons = [];

        if ($this->project === 'toolkit') {
            $icons = ['fa-power-off', 'fa-code', 'fa-puzzle-piece', 'fa-shield', 'fa-bullhorn', 'fa-code-fork'];
        }

        foreach ($this->contents['children'] as $i => $item) {
            $nav[] = [
                'title' => $item['title'],
                'icon' => isset($icons[$i]) ? $icons[$i] : '',
                'url' => trim($item['url'], '/')
            ];
        }

        return $nav;
    }

    /**
     * Use breadth-first-search to find the parent navigation menu.
     *
     * @return array
     */
    public function getParentMenu() {
        $queue = new SplQueue();
        $path = $this->urlPath ? dirname('/' . $this->urlPath) : '/';

        // Add root
        $queue->enqueue($this->contents);

        // Process the queue
        while (!$queue->isEmpty()) {
            $node = $queue->dequeue();

            // Determine if the chapter is found
            if ($node['url'] === $path) {
                return $node;
            }

            // Loop through children
            if (!empty($node['children'])) {
                foreach ($node['children'] as $child) {
                    $queue->enqueue($child);
                }
            }
        }

        return [];
    }

    /**
     * Return the source path.
     *
     * @return string
     */
    public function getSourcePath() {
        return $this->sourcePath;
    }

    /**
     * Return the source version.
     *
     * @return string
     */
    public function getSourceVersion() {
        return $this->sourceVersion;
    }

    /**
     * Return the entire table of contents.
     *
     * @return array
     */
    public function getTableOfContents() {
        return $this->contents;
    }

    /**
     * Return the URL version.
     *
     * @return string
     */
    public function getVersion() {
        return $this->version;
    }

    /**
     * Locate, load, and parse the documentation JSON table of contents.
     *
     * @return void
     */
    protected function compileMenu() {
        $contents = json_decode($this->flysystem->read($this->getSourcePath()), true);

        $this->contents = $contents;
    }

    /**
     * Locate a source file by looping through a possible list of version path combinations.
     *
     * @return void
     */
    protected function locateSource() {
        foreach (DocManager::buildVersions($this->getVersion()) as $version) {
            $path = sprintf('%s/%s/toc.json', $version, APP_LOCALE);

            if ($this->flysystem->has($path)) {
                $this->sourcePath = $path;
                $this->sourceVersion = $version;

                return;
            }
        }

        throw new RuntimeException('Table of contents could not be located');
    }

}
