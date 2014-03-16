<?php
/**
 * @copyright   2010-2014, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Toolkit\Controller;

/**
 * @property \Docs $docs
 */
class DocsController extends ToolkitController {

    /**
     * Set shared variables.
     */
    public function initialize() {
        parent::initialize();

        $this->docs = new \Docs();

        $this->getView()->setVariables([
            'skeletonClass' => 'documentation',
            'navIcons' => ['fa-power-off', 'fa-code', 'fa-puzzle-piece', 'fa-shield']
        ]);
    }

    /**
     * If a path is set, forward to the read action.
     *
     * @param string $version
     * @param string $path
     */
    public function index($version, $path) {
        if ($path) {
            $this->forwardAction('read', [$version, $path]);
            return;
        }

        $this->getView()->setVariable('toc', $this->docs->getToc('toolkit', $version));
    }

    /**
     * Locate and render documentation for the matching path.
     *
     * @param string $version
     * @param string $path
     */
    public function read($version, $path) {
        $sources = $this->docs->getSource('toolkit', $version, $path);

        $this->getView()->setVariables([
            'toc' => $this->docs->getToc('toolkit', $version),
            'chapters' => $sources['toc'],
            'sections' => $sources['chapters'],
            'version' => $version,
            'urlPath' => '/' . trim($path, '/'),
            'url' => sprintf('/toolkit/%s/%s', $version, $path)
        ]);
    }

}