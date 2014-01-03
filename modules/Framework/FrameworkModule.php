<?php

namespace Framework;

use Titon\G11n\Route\LocaleRoute;
use Titon\Mvc\Application;
use Titon\Mvc\Module\AbstractModule;

class FrameworkModule extends AbstractModule {

    /**
     * Define all the controllers.
     */
    public function initialize() {
        parent::initialize();

        $this->setControllers([
            'index' => 'Framework\Controller\IndexController',
            'docs' => 'Framework\Controller\DocsController'
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
        $router->map(new LocaleRoute('framework.docs.out', '/framework/docs/out', 'Framework\Docs@out'));
        $router->map(new LocaleRoute('framework.docs', '/framework/{version}/(path)', 'Framework\Docs@index'));
        $router->map(new LocaleRoute('framework', '/framework', 'Framework\Index@index'));

        /** @type \Titon\G11n\Locale $locale */
        //$locale = $app->get('g11n')->current();
        //$locale->addResourcePath('framework', $this->getResourcePath());
    }

}