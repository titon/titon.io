<?php
/**
 * @copyright    Copyright 2010-2013, The Titon Project
 * @license        http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

use Titon\Cache\Storage\MemcacheStorage;
use Titon\Debug\Debugger;
use Titon\Mvc\Application;

$app = Application::getInstance();

// Disable error reporting
Debugger::enable(false);

// Use memcache in prod
$app->get('cache')->addStorage(new MemcacheStorage('default'));