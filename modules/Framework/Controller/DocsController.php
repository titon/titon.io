<?php
/**
 * @copyright   2010-2014, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Framework\Controller;

class DocsController extends FrameworkController {

    /**
     * Temporary redirect.
     */
    public function index() {
        return $this->getResponse()->redirect(url('framework'));
    }

    /**
     * Out going modal.
     */
    public function out() {
        $this->getView()->setVariables([
            'pageTitle' => 'Documentation'
        ]);
    }

}