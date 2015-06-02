<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

namespace Titon\Manager;

use Doctrine\Common\Cache\MemcachedCache;
use Memcached;

class CacheManager {

    /**
     * @type \Doctrine\Common\Cache\MemcachedCache
     */
    protected $engine;

    /**
     * @type \Titon\Manager\CacheManager
     */
    protected static $instance;

    /**
     * Instantiate a new Memcached instance.
     */
    public function __construct() {
        $memcached = new Memcached();
        $memcached->addServer('localhost', 11211);

        $this->engine = new MemcachedCache();
        $this->engine->setMemcached($memcached);
    }

    /**
     * Attempt to retrieve a cache by key and return it.
     * If no cache is found, execute the callback and save a new cache.
     *
     * @param string $key
     * @param callable $callback
     * @param int [$lifetime]
     * @return mixed
     */
    public static function cache($key, callable $callback, $lifetime = 86400) {
        if (IS_LOCAL) {
            return $callback();
        }

        if (is_array($key)) {
            $key = implode(':', $key);
        }

        $engine = static::getInstance()->getEngine();
        $value = $engine->fetch($key);

        if (!$value) {
            $value = $callback();
            $engine->save($key, $value, $lifetime); // 24 hours
        }

        return $value;
    }

    /**
     * Return the cache engine.
     *
     * @return \Doctrine\Common\Cache\MemcachedCache
     */
    public function getEngine() {
        return $this->engine;
    }

    /**
     * Return a singleton instance.
     *
     * @return \Titon\Manager\CacheManager
     */
    public static function getInstance() {
        if (static::$instance) {
            return static::$instance;
        }

        return static::$instance = new static();
    }

}
