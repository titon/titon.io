<?php
/**
 * @copyright   2010-2014, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Toolkit\Controller;

use Common\Controller\CommonController;
use Titon\Controller\Controller;
use Titon\Event\Event;

class ToolkitController extends CommonController {

    /**
     * Add toolkit specific variables and assets to the view.
     *
     * @param \Titon\Event\Event $event
     * @param \Titon\Controller\Controller $controller
     * @param string $action
     * @param string $response
     */
    public function postProcess(Event $event, Controller $controller, $action, &$response) {
        parent::postProcess($event, $controller, $action, $response);

        $this->getView()->setVariable('bodyClass', 'toolkit');
    }

}