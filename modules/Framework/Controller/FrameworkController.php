<?php

namespace Framework\Controller;

use Common\Controller\CommonController;
use Titon\Controller\Controller;
use Titon\Event\Event;

class FrameworkController extends CommonController {

    /**
     * Add framework specific variables and assets to the view.
     *
     * @param \Titon\Event\Event $event
     * @param \Titon\Controller\Controller $controller
     * @param string $action
     * @param string $response
     */
    public function postProcess(Event $event, Controller $controller, $action, &$response) {
        parent::postProcess($event, $controller, $action, $response);

        $this->getView()
            ->setVariable('bodyClass', 'framework')
            ->getHelper('asset')->addStylesheet('/css/framework', [], 20);
    }

}