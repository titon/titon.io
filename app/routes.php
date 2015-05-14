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

$isDev = (getenv('APP_ENV') === 'development' || getenv('APP_ENV') === 'local');

$app = new Slim([
    'debug' => $isDev,
    'log.enabled' => true,
    'log.writer' => 'Titon\Adapter\MonologLogger',
    'view' => 'Titon\Adapter\PlatesView',
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
        'plugins' => Toolkit::loadPlugins(),
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
    $article = new DocArticle('toolkit', $version, $path);

    $app->render('toolkit/docs/read', [
        'skeletonClass' => 'documentation',
        'bodyClass' => 'toolkit',
        'version' => $version,
        'menu' => new DocMenu('toolkit', $version, $path),
        'article' => $article,
        'description' => $article->getDescription(),
        'plugins' => Toolkit::loadPlugins()
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
    $app->render('error', [
        'code' => 500,
        'title' => 'Internal Error',
        'message' => $e->getMessage()
    ]);
});

$app->notFound(function() use ($app) {
    $app->render('error', [
        'code' => 404,
        'title' => 'Not Found',
        'message' => 'The page you are looking for could not be found.'
    ]);
});

$app->run();
