<?php

namespace Toolkit\Controller;

use Common\Controller\CommonController;

class IndexController extends CommonController {

    /**
     * List all the documentation grouped by version.
     */
    public function index() {

    }

    /**
     * Redirect to the index so users can choose a version.
     */
    public function redirect() {
        $this->getResponse()->redirect(
            ['module' => 'toolkit', 'controller' => 'index', 'action' => 'index']
        );
    }

}