<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

use Slim\Slim;
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

/**
 * INDEX
 *
 * The root should redirect to the locale specific root,
 * as to support the old URL structure.
 */

$app->get('/', function() use ($app) {
    $app->redirect('/en');
});

$app->get('/en', function() use ($app) {
    $app->render('index');
})->name('index');

/**
 * TOOLKIT
 *
 * Landing page and documentation for the Toolkit project
 * and its plugins.
 */

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
    $path = implode('/', $path);

    $app->render('toolkit/docs/read', [
        'skeletonClass' => 'documentation',
        'bodyClass' => 'toolkit',
        'version' => $version,
        'components' => Toolkit::loadComponents(),
        'article' => new DocArticle('toolkit', $version, $path),
        'menu' => new DocMenu('toolkit', $version, $path)
    ]);
})->name('toolkit.docs');

/**
 * FRAMEWORK
 *
 * Landing page and documentation for the Framework project
 * and its packages. Will temporarily redirect till implemented.
 */

$app->get('/en/framework', function() use ($app) {
    $app->redirect('/en');
})->name('framework');

$app->get('/en/framework/:version', function($version) use ($app) {
    $app->redirect('/en');
})->name('framework.docs.index');

$app->get('/en/framework/:version(/:path+)', function($version, $path = []) use ($app) {
    $app->redirect('/en');
})->name('framework.docs');

/**
 * ERRORS
 *
 * Error pages for internal errors and not found entities.
 */

$app->error(function(Exception $e) use ($app) {
    $app->render('error', ['code' => $e->getCode()]);
});

$app->notFound(function() use ($app) {
    $app->render('error', ['code' => 404]);
});

$app->run();
