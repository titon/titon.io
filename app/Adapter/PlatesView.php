<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

namespace Titon\Adapter;

use League\Plates\Engine;
use League\Plates\Extension\Asset;
use Slim\Slim;
use Slim\View;
use Titon\Model\Toolkit;

class PlatesView extends View {

    /**
     * @type \League\Plates\Engine
     */
    protected $plates;

    /**
     * Setup a new Plates template engine.
     */
    public function __construct() {
        parent::__construct();

        $app = Slim::getInstance();
        $plates = new Engine($app->config('templates.path'), 'tpl');

        // Global variables
        $plates->addData([
            'env' => getenv('APP_ENV'),
            'locale' => getenv('APP_LOCALE'),
            'toolkitVersion' => Toolkit::loadVersion(),
            'currentUrl' => $app->request->getUrl() . $app->request->getPath()
        ]);

        // Asset cache busting
        $plates->loadExtension(new Asset(WEB_DIR));

        // URL building
        $plates->registerFunction('url', function($route, $params = []) use ($app) {
            return $app->urlFor($route, $params);
        });

        $this->plates = $plates;
    }

    /**
     * Render a template using Plates.
     *
     * @param string $template
     * @return string
     */
    public function render($template) {
        return $this->plates
            ->addData($this->data->all())
            ->render($template);
    }

}
