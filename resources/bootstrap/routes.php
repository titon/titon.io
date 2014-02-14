<?php
/**
 * @copyright    Copyright 2010-2013, The Titon Project
 * @license        http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

use Titon\G11n\Route\LocaleRoute;

$router = $app->getRouter();

// Enable locale resolving
$router->on('g11n', $g11n);

// Custom routes
$router->map('static.page', new LocaleRoute('/static/(path)', 'Common\Static@index'));
$router->map('static', new LocaleRoute('/static', 'Common\Static@index'));
$router->map('contact', new LocaleRoute('/contact', 'Common\Contact@index'));

// Default routes
$router->map('action.ext', new LocaleRoute('/{module}/{controller}/{action}.{ext}'));
$router->map('action', new LocaleRoute('/{module}/{controller}/{action}'));
$router->map('controller', new LocaleRoute('/{module}/{controller}'));
$router->map('module', new LocaleRoute('/{module}'));
$router->map('root', new LocaleRoute('/'));

// Initialize
$router->initialize();