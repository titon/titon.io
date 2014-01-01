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
        return Application::getInstance()->get('cache')->getStorage('default')->store(__METHOD__, function() {
            $packages = [];

            foreach (glob(VENDOR_DIR . 'titon/*', GLOB_ONLYDIR | GLOB_MARK) as $dir) {
                $reader = new JsonReader($dir . 'composer.json');

                $package = $reader->read();
                $package['version'] = file_get_contents($dir . 'version.md');

                $packages[basename($dir)] = $package;
            }

            return $packages;
        });
    }

}