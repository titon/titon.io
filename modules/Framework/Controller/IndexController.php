<?php

namespace Framework\Controller;

use Framework\Framework;

class IndexController extends FrameworkController {

    /**
     * Marketing landing page.
     */
    public function index() {
        $this->getView()->setVariables([
            'packages' => Framework::loadPackages()
        ]);
    }

}