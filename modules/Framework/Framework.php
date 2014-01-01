<?php

namespace Framework;

use Titon\Common\Registry;
use Titon\Io\Reader\JsonReader;
use Titon\Mvc\Application;

class Framework {

    /**
     * Load all composer package JSONs into a single array.
     *
     * @return array
     */
    public static function loadPackages() {
        $packages = [];
        $cacheKey = __METHOD__;

        /** @type \Titon\Cache\Storage $storage */
        $storage = Application::getInstance()->get('cache')->getStorage('default');

        if ($storage->has($cacheKey)) {
            return $storage->get($cacheKey);
        }

        foreach (glob(VENDOR_DIR . 'titon/*', GLOB_ONLYDIR | GLOB_MARK) as $dir) {
            $reader = new JsonReader($dir . 'composer.json');

            $package = $reader->read();
            $package['version'] = file_get_contents($dir . 'version.md');

            $packages[basename($dir)] = $package;
        }

        $storage->set($cacheKey, $packages, '+24 hours');

        return $packages;
    }

}