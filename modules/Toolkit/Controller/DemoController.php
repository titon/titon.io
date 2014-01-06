<?php

namespace Toolkit\Controller;

use Titon\G11n\Utility\Inflector;
use Titon\Http\Exception\NotFoundException;
use Titon\Utility\Hash;
use Toolkit\Toolkit;

class DemoController extends ToolkitController {

    public function index() {
        $this->getView()->setVariables([
            'components' => Toolkit::loadComponents()
        ]);
    }

    public function component($key) {
        $components = Toolkit::loadComponents();

        if (empty($components[$key])) {
            throw new NotFoundException();
        }

        $this->getView()->setVariables([
            'components' => $components,
            'component' => $components[$key]
        ]);
    }


}