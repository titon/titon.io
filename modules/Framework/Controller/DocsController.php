<?php

namespace Framework\Controller;

class DocsController extends FrameworkController {

    /**
     * Temporary redirect.
     */
    public function index() {
        $this->getResponse()->redirect(url('framework'));
    }

    /**
     * Out going modal.
     */
    public function out() {
        $this->getView()->setVariables([
            'pageTitle' => 'Documentation',
            'modalActions' => [
                'View GitHub' => 'https://github.com/titon'
            ]
        ]);
    }

}