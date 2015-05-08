<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

date_default_timezone_set('UTC');

define('VENDOR_DIR', dirname(__DIR__) . '/vendor/');
define('WEB_DIR', __DIR__ . '/');
define('APP_DIR', dirname(__DIR__) . '/app/');
define('APP_ENV', getenv('SLIM_MODE') ?: 'production');

// Load dependencies
require VENDOR_DIR . 'autoload.php';

// Run the application
require APP_DIR . 'app.php';
