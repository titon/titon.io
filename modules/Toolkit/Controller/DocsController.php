<?php

namespace Toolkit\Controller;

class DocsController extends ToolkitController {

    /**
     * Temporary redirect.
     */
    public function index() {
        $this->getResponse()->redirect(url('toolkit'));
    }

    /**
     * Out going modal.
     */
    public function out() {
        $this->getView()->setVariables([
            'pageTitle' => 'Documentation',
            'modalActions' => [
                'View Docs' => 'https://github.com/titon/toolkit/tree/master/docs',
                'View Demo' => 'https://github.com/titon/toolkit/tree/master/demo'
            ]
        ]);
    }

}