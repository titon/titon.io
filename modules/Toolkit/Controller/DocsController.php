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
        $sources = $this->getApplication()->get('docs')->getSource('toolkit', $version, $path);

        $this->getView()->setVariables([
            'toc' => $sources['toc'],
            'chapters' => $sources['chapters']
        ]);
    }

}