<?php

namespace Framework\Controller;

use Common\Controller\CommonController;
use Titon\Controller\Controller;
use Titon\Event\Event;

class FrameworkController extends CommonController {

    public function postProcess(Event $event, Controller $controller, $action, &$response) {
        $this->getView()
            ->setVariable('bodyClass', 'framework')
            ->getHelper('asset')
                ->addStylesheet('/css/landing', [], 10)
                ->addStylesheet('/css/framework', [], 10);
    }

}