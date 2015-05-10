<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

use Slim\Slim;
use Titon\Manager\DocManager;
use Titon\Model\DocArticle;
use Titon\Model\DocMenu;
use Titon\Model\Toolkit;

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
    $app->render('toolkit/index', [
        'components' => Toolkit::loadComponents(),
        'skeletonClass' => 'landing',
        'bodyClass' => 'toolkit'
    ]);
})->name('toolkit');

$app->get('/en/toolkit/:version', function($version) use ($app) {
    $app->render('toolkit/docs/index', [
        'skeletonClass' => 'documentation',
        'bodyClass' => 'toolkit',
        'version' => $version,
        'menu' => new DocMenu('toolkit', $version)
    ]);
})->name('toolkit.docs.index');

$app->get('/en/toolkit/:version/:path+', function($version, $path = []) use ($app) {
    $app->render('toolkit/docs/read', [
        'skeletonClass' => 'documentation',
        'bodyClass' => 'toolkit',
        'version' => $version,

        'components' => Toolkit::loadComponents(),
        'article' => new DocArticle('toolkit', $version, implode('/', $path)),
        'menu' => new DocMenu('toolkit', $version)
    ]);
})->name('toolkit.docs');

// Framework
$app->get('/en/framework', function() use ($app) {
    $app->redirect('/en');
})->name('framework');

// Framework documentation
$app->get('/en/framework/:version(/:path+)', function($version, $path = []) use ($app) {
    $app->redirect('/en');
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
