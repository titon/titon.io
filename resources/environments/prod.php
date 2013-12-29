<?php
/**
 * @copyright    Copyright 2010-2013, The Titon Project
 * @license        http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

use Titon\Cache\Storage\MemcacheStorage;
use Titon\Common\Config;
use Titon\Debug\Debugger;

// Disable error reporting
Debugger::enable(false);

// Use memcache in prod
Config::set('cache.storage', new MemcacheStorage('default'));