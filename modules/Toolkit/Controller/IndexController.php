<?php

namespace Toolkit\Controller;

use Toolkit\Toolkit;

class IndexController extends ToolkitController {

    /**
     * Marketing landing page.
     */
    public function index() {
        $this->getView()->setVariables([
            'components' => Toolkit::loadComponents(),
            'version' => Toolkit::loadVersion()
        ]);
    }

}