<?php
/**
 * @copyright   2010-2014, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

use Titon\Cache\Storage\FileSystemStorage;
use Titon\Common\Config;
use Titon\Debug\Debugger;
use Titon\Mvc\Application;

/**
 * --------------------------------------------------------------
 *  Development
 * --------------------------------------------------------------
 *
 * Configuration pertaining to development environments should
 * be defined here. It will be bootstrapped automatically.
 */

$app = Application::getInstance();

/**
 * Enable error reporting.
 */
Debugger::enable(true);