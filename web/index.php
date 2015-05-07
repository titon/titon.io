<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

define('VENDOR_DIR', dirname(__DIR__) . '/vendor/');
define('WEB_DIR', __DIR__ . '/');
define('APP_ENV', getenv('SLIM_MODE') ?: 'production');

// Load dependencies
require VENDOR_DIR . 'autoload.php';

use Slim\Slim;

// Start the application
$app = new Slim([
    'mode' => APP_ENV,
    'debug' => (APP_ENV === 'development'),
    'log.enabled' => false,
    'templates.path' => '../views'
]);

// Set the view engine

// Homepage
$app->get('/', function() use ($app) {
})->name('index');

// Toolkit
$app->get('/toolkit', function() use ($app) {
})->name('toolkit');

// Toolkit documentation
$app->get('/toolkit/:version/:doc+', function($version, $doc) use ($app) {
})->name('toolkit.docs');

// Framework
$app->get('/framework', function() use ($app) {
})->name('framework');

// Framework documentation
$app->get('/framework/:version/:doc+', function($version, $doc) use ($app) {
})->name('framework.docs');

// Internal error
$app->error(function(Exception $e) use ($app) {
    $app->render('error.php');
});

// Not found
$app->notFound(function() use ($app) {
    $app->render('404.html');
});

// Run the application
$app->run();
