<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

namespace Titon\View;

use League\Plates\Engine;
use League\Plates\Extension\Asset;
use Slim\Slim;
use Slim\View;

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

        // Asset timestamping
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
        return $this->plates->render($template, $this->data->all());
    }

}
