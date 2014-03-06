<?php
/**
 * @copyright   2010-2014, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

use Titon\Cache\Storage\MemcacheStorage;
use Titon\Common\Config;
use Titon\Mvc\Application;

/**
 * --------------------------------------------------------------
 *  Production
 * --------------------------------------------------------------
 *
 * Configuration pertaining to production environments should
 * be defined here. It will be bootstrapped automatically.
 */

$app = Application::getInstance();

/**
 * Update caching to use Memcache.
 */
$app->get('cache')->addStorage('default', new MemcacheStorage());
