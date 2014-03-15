<?php
/**
 * @copyright   2010-2014, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Framework\Controller;

use Main\Controller\MainController;
use Titon\Controller\Controller;

class FrameworkController extends MainController {

    /**
     * Add framework specific variables and assets to the view.
     */
    public function initialize() {
        parent::initialize();

        $this->getView()->setVariable('bodyClass', 'framework');
    }

}