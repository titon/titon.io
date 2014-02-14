<?php

namespace Framework;

use Titon\Io\Reader\JsonReader;
use Titon\Mvc\Application;

class Framework {

    /**
     * Load all composer package JSONs into a single array.
     *
     * @return array
     */
    public static function loadPackages() {
        return Application::getInstance()->get('cache')->store(__METHOD__, function() {
            $packages = [];

            foreach (glob(VENDOR_DIR . 'titon/*', GLOB_ONLYDIR | GLOB_MARK) as $dir) {
                $reader = new JsonReader($dir . 'composer.json');

                $package = $reader->read();
                $package['version'] = file_get_contents($dir . 'version.md');

                $packages[basename($dir)] = $package;
            }

            // Fetch separately so we don't have to install requirements
            foreach (['mysql', 'postgresql', 'sqlite', 'mongodb'] as $driver) {
                $driver = 'db-' . $driver;

                $json = json_decode(Framework::fetchRemoteResource('https://raw.github.com/titon/' . $driver . '/master/composer.json'), true);
                $json['version'] = Framework::fetchRemoteResource('https://raw.github.com/titon/' . $driver . '/master/version.md');

                $packages[$driver] = $json;
            }

            return $packages;
        });
    }

    /**
     * Fetch the response of a remote URL.
     *
     * @param string $url
     * @return string
     */
    public static function fetchRemoteResource($url) {
        $curl = curl_init($url);
        curl_setopt_array($curl, [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_FAILONERROR => true,
            CURLOPT_SSL_VERIFYPEER => false
        ]);
        $response = curl_exec($curl);
        $error = curl_error($curl);
        curl_close($curl);

        if ($error) {
            return null;
        }

        return $response;
    }

}