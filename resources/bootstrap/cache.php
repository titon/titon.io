<?php
use Titon\Common\Config;
use Titon\Common\Registry;

/**
 * @copyright    Copyright 2010-2013, The Titon Project
 * @license        http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

/** @type \Titon\Cache\Cache $cache */
$cache = Registry::factory('Titon\Cache\Cache');

// Use different storage per environment
$cache->addStorage(Config::get('cache.storage'));

// Store in the app
$app->set('cache', $cache);