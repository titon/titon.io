<?php
/**
 * @copyright   2010-2014, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

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
            'index' => 'Toolkit\Controller\IndexController',
            'docs' => 'Toolkit\Controller\DocsController',
            //'demo' => 'Toolkit\Controller\DemoController'
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
        $router->map('toolkit.demo.component',  new LocaleRoute('/toolkit/demo/{component}', 'Toolkit\Demo@component', ['pass' => 'component']));
        $router->map('toolkit.demo',            new LocaleRoute('/toolkit/demo', 'Toolkit\Demo@index'));
        $router->map('toolkit.docs.out',        new LocaleRoute('/toolkit/docs/out', 'Toolkit\Docs@out'));
        $router->map('toolkit.docs',            new LocaleRoute('/toolkit/[version]/(path?)', 'Toolkit\Docs@index', ['pass' => ['version', 'path']]));
        $router->map('toolkit',                 new LocaleRoute('/toolkit', 'Toolkit\Index@index'));

        /** @type \Titon\G11n\Locale $locale */
        $locale = $app->get('g11n')->current();
        $locale->addResourcePath('toolkit', $this->getResourcePath());
    }

}