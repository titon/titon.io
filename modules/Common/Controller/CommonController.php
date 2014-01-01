<?php
/**
 * @copyright   2010-2013, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Common\Controller;

use Titon\Common\Registry;
use Titon\Controller\Controller\AbstractController;
use Titon\Mvc\Application;
use Titon\View\Engine\ViewEngine;
use Titon\View\Helper\Html\AssetHelper;
use Titon\View\Helper\Html\FormHelper;
use Titon\View\Helper\Html\HtmlHelper;
use Titon\View\View;

class CommonController extends AbstractController {

    /**
     * Set the view rendering layer.
     */
    public function initialize() {
        $app = Application::getInstance();

        $view = new View($this->getModule()->getViewPath());
        $view->setEngine(new ViewEngine());
        $view->addHelper('html', new HtmlHelper());
        $view->addHelper('asset', new AssetHelper());
        $view->addHelper('form', new FormHelper());
        $view->setVariables([
            'env' => $app->get('env')->current()->getKey(),
            'route' => $app->getRouter()->current(),
            'request' => $this->getRequest()
        ]);

        $this->setView($view);
    }

}