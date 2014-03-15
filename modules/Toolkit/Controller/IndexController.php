<?php
/**
 * @copyright   2010-2014, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Toolkit\Controller;

use Toolkit\Toolkit;

class IndexController extends ToolkitController {

    /**
     * Marketing landing page.
     */
    public function index() {
        $this->getView()->setVariables([
            'components' => Toolkit::loadComponents(),
            'version' => Toolkit::loadVersion(),
            'skeletonClass' => 'landing'
        ]);
    }

}