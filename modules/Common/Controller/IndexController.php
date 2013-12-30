<?php
/**
 * @copyright   2010-2013, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Common\Controller;

class IndexController extends CommonController {

    /**
     * Homepage.
     */
    public function index() {
        $this->getView()->setVariable('pageTitle', 'Project Titon');
    }

}