<?php
/**
 * @copyright   2010-2014, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Toolkit;

use Titon\G11n\Utility\Inflector;
use Titon\Io\Reader\JsonReader;
use Titon\Mvc\Application;

class Toolkit {

    /**
     * Load the latest version from the master branch.
     *
     * @return string
     */
    public static function loadVersion() {
        return Application::getInstance()->get('cache')->store(__METHOD__, function() {
            $version = file_get_contents(VENDOR_DIR . 'titon/toolkit/version.md');

            if (strpos($version, '-') !== false) {
                $version = explode('-', $version)[0];
            }

            return $version;
        });
    }

    /**
     * Load the component manifest from the master branch.
     *
     * @return array
     */
    public static function loadComponents() {
        return Application::getInstance()->get('cache')->store(__METHOD__, function() {
            $json = (new JsonReader(VENDOR_DIR . 'titon/toolkit/manifest.json'))->read();
            $components = [];

            foreach ($json as $key => $component) {
                if (strpos($key, '-') === false) {
                    $key = str_replace('_', '-', Inflector::underscore($key));
                }

                $component['key'] = $key;
                $components[$key] = $component;
            }

            return $components;
        });
    }

}