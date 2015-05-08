<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

use Slim\Slim;

// Start the application
$app = new Slim([
    'mode' => APP_ENV,
    'debug' => (APP_ENV === 'development'),
    'log.enabled' => false,
    'view' => 'Titon\View\PlatesView',
    'templates.path' => '../views/'
]);

// Homepage
$app->get('/', function() use ($app) {
    $app->redirect('/en');
});

$app->get('/en', function() use ($app) {
    $app->render('index');
})->name('index');

// Toolkit
$app->get('/en/toolkit', function() use ($app) {
    // TODO
})->name('toolkit');

// Toolkit documentation
$app->get('/en/toolkit/:version/:doc+', function($version, $doc) use ($app) {
    // TODO
})->name('toolkit.docs');

// Framework
$app->get('/en/framework', function() use ($app) {
    // TODO
})->name('framework');

// Framework documentation
$app->get('/en/framework/:version/:doc+', function($version, $doc) use ($app) {
    // TODO
})->name('framework.docs');

// Internal error
$app->error(function(Exception $e) use ($app) {
    $app->render('error', ['code' => $e->getCode()]);
});

// Not found
$app->notFound(function() use ($app) {
    $app->render('error', ['code' => 404]);
});

// Run the application
$app->run();
