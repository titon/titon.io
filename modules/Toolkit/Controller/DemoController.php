<?php

namespace Toolkit\Controller;

use Titon\G11n\Utility\Inflector;
use Titon\Http\Exception\NotFoundException;
use Titon\Utility\Hash;
use Toolkit\Helper\DemoHelper;
use Toolkit\Toolkit;

class DemoController extends ToolkitController {

    public function index() {
        $this->getView()->setVariables([
            'components' => Toolkit::loadComponents()
        ]);
    }

    public function component($key) {
        $components = Toolkit::loadComponents();
        $request = $this->getRequest();

        if (empty($components[$key])) {
            throw new NotFoundException();
        }

        $demo = new DemoHelper();
        $demo->setRequest($request);

        $this->getView()
            ->setVariables([
                'components' => $components,
                'component' => $components[$key],
                'vendor' => $request->get('vendor') ?: 'jquery'
            ])
            ->addHelper('demo', $demo);
    }


}