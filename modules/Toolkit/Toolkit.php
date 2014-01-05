<?php

namespace Toolkit;

use Titon\Common\Registry;
use Titon\Io\Reader\JsonReader;
use Titon\Mvc\Application;

class Toolkit {

    /**
     * Load the component manifest from the master branch.
     *
     * @return array
     */
    public static function loadComponents() {
        return Application::getInstance()->get('cache')->store(__METHOD__, function() {
            return (new JsonReader(VENDOR_DIR . 'titon/toolkit/manifest.json'))->read();
        });
    }

    /**
     * Load the latest version from the master branch.
     *
     * @return string
     */
    public static function loadVersion() {
        return Application::getInstance()->get('cache')->store(__METHOD__, function() {
            return file_get_contents(VENDOR_DIR . 'titon/toolkit/version.md');
        });
    }

}