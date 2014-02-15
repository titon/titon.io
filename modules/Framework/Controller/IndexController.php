<?php
/**
 * @copyright   2010-2014, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

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