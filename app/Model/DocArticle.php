<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

namespace Titon\Model;

use League\CommonMark\Block\Element\Header;
use League\CommonMark\DocParser;
use League\CommonMark\Environment;
use League\CommonMark\HtmlElement;
use League\CommonMark\HtmlRenderer;
use League\Flysystem\Adapter\Local;
use League\Flysystem\Filesystem;
use Titon\Manager\DocManager;
use RuntimeException;

class DocArticle {

    /**
     * List of section titles indexed by a hash.
     *
     * @var array
     */
    protected $chapters = [];

    /**
     * @var \League\Flysystem\Filesystem
     */
    protected $flysystem;

    /**
     * Component or behavior plugin instance.
     *
     * @type \Titon\Model\Plugin
     */
    protected $plugin;

    /**
     * Type of project.
     *
     * @type string
     */
    protected $project;

    /**
     * List of section content as HTML.
     *
     * @var array
     */
    protected $sections = [];

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
     * Title of the document.
     *
     * @var string
     */
    protected $title;

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
    public function __construct($project, $version, $path) {
        $this->urlPath = $path;
        $this->project = $project;
        $this->version = $version;
        $this->flysystem = new Filesystem(new Local(SRC_DIR . 'docs/' . $project . '/'));

        $this->locateSource();
        $this->compileMarkdown();
        $this->detectPlugin();
    }

    /**
     * Return list of chapters.
     *
     * @return array
     */
    public function getChapters() {
        return $this->chapters;
    }

    /**
     * Return a GitHub URL for the specific file path.
     *
     * @return string
     */
    public function getGitHubUrl() {
        return sprintf('https://github.com/titon/%s/tree/master/docs/%s', $this->project, str_replace($this->getSourceVersion() . '/', '', $this->getSourcePath()));
    }

    /**
     * Return the Toolkit plugin.
     *
     * @return \Titon\Model\Plugin
     */
    public function getPlugin() {
        return $this->plugin;
    }

    /**
     * Return list of sections.
     *
     * @return array
     */
    public function getSections() {
        return $this->sections;
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
     * Return the document title.
     *
     * @return string
     */
    public function getTitle() {
        return $this->title;
    }

    /**
     * Return the URL path.
     *
     * @return string
     */
    public function getUrlPath() {
        return $this->urlPath;
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
     * Is the article for a Toolkit plugin?
     *
     * @return bool
     */
    public function isPlugin() {
        return !empty($this->plugin);
    }

    /**
     * Compile a file by reading its contents, extracting the title, sections, and finally convert to HTML.
     *
     * @return void
     */
    protected function compileMarkdown() {
        $path = $this->getSourcePath();
        $environment = Environment::createCommonMarkEnvironment();
        $renderer = new HtmlRenderer($environment);
        $document = (new DocParser($environment))->parse($this->flysystem->read($path));
        $sectionContent = '';
        $sectionHash = '';
        $childHash = '';

        foreach ($document->getChildren() as $child) {
            if ($child instanceof Header) {
                $childContent = htmlentities($child->getStringContent(), ENT_QUOTES, 'UTF-8');
                $childHash = DocManager::makeHash($childContent);

                // Extract the title if first header
                if ($child->getLevel() === 1) {
                    $this->title = $childContent;
                    $sectionHash = $childHash;

                // Start a new section if second header
                } else if ($child->getLevel() === 2) {
                    $this->sections[$sectionHash] = DocManager::parseMarkdown($sectionContent, $path);
                    $sectionContent = '';
                    $sectionHash = $childHash;
                }

                // Extract each chapter if larger than the 1st header
                if ($child->getLevel() > 1) {
                    $this->chapters[$childHash] = str_repeat('&nbsp;', 2 * ($child->getLevel() - 1)) . $childContent;
                }
            }

            // Render the individual child into different sections
            /** @var HtmlElement $renderedSection */
            $renderedSection = $renderer->renderBlock($child);

            // Add an ID to headers
            if ($child instanceof Header) {
                $renderedSection->setAttribute('id', $childHash);
            }

            $sectionContent .= (string) $renderedSection;
        }

        // Append last section
        $this->sections[$sectionHash] = DocManager::parseMarkdown($sectionContent, $path);
    }

    /**
     * Detect if the article is for a Toolkit plugin.
     *
     * @return void
     */
    protected function detectPlugin() {
        $path = $this->getUrlPath();

        if (strpos($path, 'components') === 0 || strpos($path, 'behaviors') === 0) {
            $plugins = Toolkit::loadPlugins();
            $name = basename($path);

            if (isset($plugins[$name])) {
                $this->plugin = new Plugin($plugins[$name]);
            }
        }
    }

    /**
     * Locate a source file by looping through a possible list of version path combinations.
     *
     * @return void
     */
    protected function locateSource() {
        $versions = DocManager::buildVersions($this->getVersion());
        $file = $this->getUrlPath();

        foreach ($versions as $version) {
            $base = sprintf('%s/%s/', $version, APP_LOCALE);

            if ($file) {
                $paths = [$base . $file . '.md', $base . $file . '/index.md'];
            } else {
                $paths = [$base];
            }

            foreach ($paths as $path) {
                if ($this->flysystem->has($path)) {
                    $this->sourcePath = $path;
                    $this->sourceVersion = $version;

                    return;
                }
            }
        }

        throw new RuntimeException(sprintf('Documentation source [%s] could not be located', $file));
    }

}
