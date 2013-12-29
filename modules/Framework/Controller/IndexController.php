<?php

namespace Framework\Controller;

use Framework\Framework;

class IndexController extends FrameworkController {

    public function index() {
        $this->getView()->setVariables([
            'pageTitle' => 'Framework - Project Titon',
            'packages' => Framework::loadPackages()
        ]);
    }

}