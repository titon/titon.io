<?php

namespace Toolkit;

use Titon\G11n\Route\LocaleRoute;
use Titon\Mvc\Application;
use Titon\Mvc\Module\AbstractModule;

class ToolkitModule extends AbstractModule {

    /**
     * Define all the controllers.
     */
    public function initialize() {
        parent::initialize();

        $this->setControllers([
            'index' => 'Toolkit\Controller\IndexController'
        ]);
    }

    /**
     * Add routes that include the documentation version.
     *
     * @param \Titon\Mvc\Application $app
     */
    public function bootstrap(Application $app) {
        parent::bootstrap($app);

        $router = $app->getRouter();
        $router->map(new LocaleRoute('toolkit.docs', '/toolkit/{version}/(path)', 'Toolkit\Docs@index'));
        $router->map(new LocaleRoute('toolkit', '/toolkit', 'Toolkit\Index@index'));
    }

}