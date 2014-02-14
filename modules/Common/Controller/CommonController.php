<?php
/**
 * @copyright   2010-2013, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Common\Controller;

use Titon\Mvc\Controller;
use Titon\Mvc\View;
use Titon\View\Engine\ViewEngine;
use Titon\View\Helper\Html\AssetHelper;
use Titon\View\Helper\Html\FormHelper;
use Titon\View\Helper\Html\HtmlHelper;
use Titon\View\Helper\Html\BreadcrumbHelper;

class CommonController extends Controller {

    /**
     * Set the view rendering layer.
     */
    public function initialize() {
        $app = $this->getApplication();

        $view = new View($this->getModule()->getViewPath());
        $view->setEngine(new ViewEngine($app->getRouter()->current()->getParams()));
        $view->addHelper('html', new HtmlHelper());
        $view->addHelper('asset', new AssetHelper(['webroot' => $app->getWebroot()]));
        $view->addHelper('form', (new FormHelper())->setRequest($this->getRequest()));
        $view->addHelper('breadcrumb', new BreadcrumbHelper());
        $view->setVariables([
            'env' => $app->get('env')->current()->getKey()
        ]);

        $this->setView($view);
    }

}