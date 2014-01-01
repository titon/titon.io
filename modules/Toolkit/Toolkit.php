<?php

namespace Toolkit;

use Titon\Common\Registry;
use Titon\Mvc\Application;

class Toolkit {

    /**
     * Load the component manifest from the master branch.
     *
     * @return array
     */
    public static function loadComponents() {
        $cacheKey = __METHOD__;

        /** @type \Titon\Cache\Storage $storage */
        $storage = Application::getInstance()->get('cache')->getStorage('default');

        if ($storage->has($cacheKey)) {
            return $storage->get($cacheKey);
        }

        $components = json_decode(self::fetchRemoteResource('https://raw.github.com/titon/toolkit/master/manifest.json'), true);

        $storage->set($cacheKey, $components, '+24 hours');

        return $components;
    }

    /**
     * Load the latest version from the master branch.
     *
     * @return string
     */
    public static function loadVersion() {
        $cacheKey = __METHOD__;

        /** @type \Titon\Cache\Storage $storage */
        $storage = Application::getInstance()->get('cache')->getStorage('default');

        if ($storage->has($cacheKey)) {
            return $storage->get($cacheKey);
        }

        $components = self::fetchRemoteResource('https://raw.github.com/titon/toolkit/master/version.md');

        $storage->set($cacheKey, $components, '+24 hours');

        return $components;
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