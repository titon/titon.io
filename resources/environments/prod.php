<?php
/**
 * @copyright    Copyright 2010-2014, The Titon Project
 * @license        http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

use Titon\Cache\Storage\MemcacheStorage;
use Titon\Mvc\Application;

$app = Application::getInstance();

// Use memcache in prod
$app->get('cache')->addStorage(new MemcacheStorage('default'));