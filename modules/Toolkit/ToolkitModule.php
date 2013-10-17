<?php

namespace Toolkit;

use Titon\Mvc\Application;
use Titon\Mvc\Module\AbstractModule;
use Titon\Route\Route;

class ToolkitModule extends AbstractModule {

    /**
     * Define all the controllers.
     */
    public function initialize() {
        parent::initialize();

        $this->setControllers([
            'index' => 'Toolkit\Controller\IndexController',
            'css'   => 'Toolkit\Controller\CssController',
            'js'    => 'Toolkit\Controller\JsController',
            'build' => 'Toolkit\Controller\BuildController',
            'crud'  => 'Toolkit\Controller\CrudController'
        ]);
    }

    /**
     * Add routes that include the documentation version.
     *
     * @param \Titon\Mvc\Application $app
     */
    public function bootstrap(Application $app) {
        parent::bootstrap($app);

        $config = ['patterns' => ['version' => Route::ALNUM]];

        /*$router = $app->getRouter();
        $router->map(new Route('/toolkit/<version>/build', ['module' => 'toolkit', 'controller' => 'build'], $config));
        $router->map(new Route('/toolkit/<version>/css/{component}', ['module' => 'toolkit', 'controller' => 'css', 'action' => 'component'], $config));
        $router->map(new Route('/toolkit/<version>/css', ['module' => 'toolkit', 'controller' => 'css'], $config));
        $router->map(new Route('/toolkit/<version>/js/{component}', ['module' => 'toolkit', 'controller' => 'js', 'action' => 'component'], $config));
        $router->map(new Route('/toolkit/<version>/js', ['module' => 'toolkit', 'controller' => 'js'], $config));
        $router->map(new Route('/toolkit/<version>', ['module' => 'toolkit', 'controller' => 'index', 'action' => 'redirect'], $config));
        $router->map(new Route('/toolkit', ['module' => 'toolkit', 'controller' => 'index']));*/
    }

}