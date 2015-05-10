<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

namespace Titon\Model;

class Plugin {

    /**
     * Plugin metadata from the Toolkit manifest.
     *
     * @type array
     */
    protected $data = [];

    /**
     * @param array $data
     */
    public function __construct(array $data) {
        $this->data = $data;
    }

    /**
     * Return the version the plugin was added.
     *
     * @return string
     */
    public function getAddedVersion() {
        return isset($this->data['version']) ? $this->data['version'] : '';
    }

    /**
     * Return the category.
     *
     * @return string
     */
    public function getCategory() {
        return $this->data['category'];
    }

    /**
     * Return a URL for the demo.
     *
     * @return string
     */
    public function getDemoUrl() {
        return sprintf('http://demo.titon.io/?%s', $this->getKey());
    }

    /**
     * Return the description.
     *
     * @return string
     */
    public function getDescription() {
        return $this->data['description'];
    }

    /**
     * Return a GitHub URL to the source (S)CSS file.
     *
     * @return string
     */
    public function getGitHubCssUrl() {
        return ($css = $this->getSourceCss()) ? sprintf('https://github.com/titon/toolkit/tree/master/scss/toolkit/%s', $css) : '';
    }

    /**
     * Return a GitHub URL to the source JavaScript file.
     *
     * @return string
     */
    public function getGitHubJsUrl() {
        return ($js = $this->getSourceJs()) ? sprintf('https://github.com/titon/toolkit/tree/master/js/%s', $js) : '';
    }

    /**
     * Return the unique key.
     *
     * @return string
     */
    public function getKey() {
        return $this->data['key'];
    }

    /**
     * Return the name.
     *
     * @return string
     */
    public function getName() {
        return $this->data['name'];
    }

    /**
     * Return the priority.
     *
     * @return int
     */
    public function getPriority() {
        return $this->data['priority'];
    }

    /**
     * Return a list of required plugins.
     *
     * @return array
     */
    public function getRequires() {
        return isset($this->data['require']) ? $this->data['require'] : [];
    }

    /**
     * Return the relative S(CSS) source path.
     *
     * @return string
     */
    public function getSourceCss() {
        return isset($this->data['source']['css']) ? $this->data['source']['css'][0] : '';
    }

    /**
     * Return the relative JavaScript source path.
     *
     * @return string
     */
    public function getSourceJs() {
        return isset($this->data['source']['js']) ? $this->data['source']['js'][0] : '';
    }

    /**
     * Return the type.
     *
     * @return string
     */
    public function getType() {
        return isset($this->data['type']) ? $this->data['type'] : '';
    }

    /**
     * Return true if a behavior.
     *
     * @return bool
     */
    public function isBehavior() {
        return ($this->getCategory() === 'behavior');
    }

    /**
     * Return true if a component.
     *
     * @return bool
     */
    public function isComponent() {
        return ($this->getCategory() === 'component');
    }

}
