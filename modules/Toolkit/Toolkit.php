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
        return Application::getInstance()->get('cache')->getStorage('default')->store(__METHOD__, function() {
            return json_decode(Toolkit::fetchRemoteResource('https://raw.github.com/titon/toolkit/master/manifest.json'), true);
        });
    }

    /**
     * Load the latest version from the master branch.
     *
     * @return string
     */
    public static function loadVersion() {
        return Application::getInstance()->get('cache')->getStorage('default')->store(__METHOD__, function() {
            return Toolkit::fetchRemoteResource('https://raw.github.com/titon/toolkit/master/version.md');
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