<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

date_default_timezone_set('UTC');
error_reporting(0);

define('ROOT_DIR', dirname(__DIR__) . '/');
define('APP_DIR', ROOT_DIR . 'app/');
define('SRC_DIR', ROOT_DIR . 'src/');
define('TEMP_DIR', ROOT_DIR . 'temp/');
define('VENDOR_DIR', ROOT_DIR . 'vendor/');
define('WEB_DIR', __DIR__ . '/');

// Load dependencies
require VENDOR_DIR . 'autoload.php';

// Setup environment
Dotenv::load(ROOT_DIR);

// Run the application
require APP_DIR . 'logging.php';
require APP_DIR . 'routes.php';
