<?php
/**
 * @copyright   2010-2014, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Toolkit\Controller;

use Titon\Http\Exception\NotFoundException;
use Toolkit\Helper\DemoHelper;
use Toolkit\Toolkit;

class DemoController extends ToolkitController {

    /**
     * List all components.
     */
    public function index() {
        $this->getView()->setVariables([
            'components' => Toolkit::loadComponents()
        ]);
    }

    /**
     * Demo a component.
     *
     * @param string $key
     * @throws \Titon\Http\Exception\NotFoundException
     */
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