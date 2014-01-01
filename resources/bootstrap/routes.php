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
$router->map(new LocaleRoute('static.page', '/static/(path)', 'Common\Static@index'));
$router->map(new LocaleRoute('static', '/static', 'Common\Static@index'));
$router->map(new LocaleRoute('contact', '/contact', 'Common\Contact@index'));

// Initialize
$router->initialize();