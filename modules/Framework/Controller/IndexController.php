<?php

namespace Framework\Controller;

use Framework\Framework;

class IndexController extends FrameworkController {

    /**
     * Marketing landing page.
     */
    public function index() {
        $this->getView()->setVariables([
            'pageTitle' => 'Framework - Project Titon',
            'packages' => Framework::loadPackages()
        ]);
    }

}