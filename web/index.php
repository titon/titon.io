<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

date_default_timezone_set('UTC');

define('ROOT_DIR', dirname(__DIR__) . '/');
define('VENDOR_DIR', ROOT_DIR . 'vendor/');
define('WEB_DIR', __DIR__ . '/');
define('SRC_DIR', ROOT_DIR . 'src/');
define('APP_DIR', ROOT_DIR . 'app/');

define('APP_ENV', getenv('SLIM_MODE') ?: 'production');
define('APP_LOCALE', 'en');

// Load dependencies
require VENDOR_DIR . 'autoload.php';

// Run the application
require APP_DIR . 'app.php';
