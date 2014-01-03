<?php
/**
 * @copyright    Copyright 2010-2013, The Titon Project
 * @license        http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

use Titon\Common\Config;
use Titon\Common\Registry;
use Titon\Debug\Debugger;
use Titon\Debug\Logger;
use Titon\Mvc\Application;

/**
 * Dates should always be UTC!
 */
date_default_timezone_set('UTC');

/**
 * Enable the debugger and logger to handle errors and exceptions.
 */
Debugger::initialize();
Debugger::setLogger(new Logger(TEMP_DIR . '/logs'));
Debugger::setHandler([$app, 'handleError']);

/**
 * Define the primary configurations used by the application.
 */
Config::set('app', [
    'name' => 'Titon',
    'salt' => 'AN3sk8ANjsSl1Hwx910APs7lq8nmsP5LQmKC',
    'encoding' => 'UTF-8'
]);

/**
 * Define available lookup paths for specific resources.
 */
Config::set('titon.path', [
    'resources' => [
        RESOURCES_DIR,
        VENDOR_DIR . 'titon/g11n/src/resources'
    ],
    'views' => [
        VIEWS_DIR
    ]
]);

/**
 * Initialize all application level components.
 */
Application::getInstance()
    ->set('env', Registry::factory('Titon\Environment\Environment'))
    ->set('cache', Registry::factory('Titon\Cache\Cache'))
    ->set('g11n', Registry::factory('Titon\G11n\G11n'));