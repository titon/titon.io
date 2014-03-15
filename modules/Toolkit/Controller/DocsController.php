<?php
/**
 * @copyright   2010-2014, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Toolkit\Controller;

class DocsController extends ToolkitController {

    /**
     * Temporary redirect.
     */
    public function index($version, $path) {
        $docs = new \Docs();
        $toc = $docs->getToc('toolkit', $version);
        $sources = $docs->getSource('toolkit', $version, $path);

        $this->getView()->setVariables([
            'toc' => $toc,
            'chapters' => $sources['toc'],
            'sections' => $sources['chapters'],
            'version' => $version,
            'url' => '/' . trim($path, '/')
        ]);
    }

}