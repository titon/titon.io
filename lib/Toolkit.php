<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

namespace Titon;

class Toolkit {

    /**
     * Load the latest version from the master branch.
     *
     * @return string
     */
    public static function loadVersion() {
        $version = file_get_contents(VENDOR_DIR . 'titon/toolkit/version.md');

        if (strpos($version, '-') !== false) {
            $version = explode('-', $version)[0];
        }

        return $version;
    }

    /**
     * Load the component manifest from the master branch.
     *
     * @return array
     */
    public static function loadComponents() {
        $json = json_decode(file_get_contents(VENDOR_DIR . 'titon/toolkit/manifest.json'), true);
        $components = [];

        foreach ($json as $key => $component) {
            if (strpos($key, '-') === false) {
                $key = str_replace('_', '-', Inflector::underscore($key));
            }

            $component['key'] = $key;
            $components[$key] = $component;
        }

        return $components;
    }

}
