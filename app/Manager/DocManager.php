<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

namespace Titon\Manager;

class DocManager {

    /**
     * Determine a valid version by looping through a list of possible versions in descending order.
     *
     * @param string $version
     * @return array
     */
    public static function buildVersions($version) {
        $version = substr($version, 0, 3);
        $versions = [$version];

        if (substr($version, -1) <= 0) {
            $versions[] = substr($version, 0, 1) . '.x';

        } else {
            while (substr($version, -1) >= 0) {
                $version -= 0.1;

                if (strlen($version) === 1) {
                    $versions[] = $version . '.x';
                    break;
                } else {
                    $versions[] = $version;
                }
            }
        }

        return $versions;
    }

    /**
     * Parse the Markdown even further by fixing specific situations.
     *
     * @param string $contents
     * @param string $path
     * @return string
     */
    public static function parseMarkdown($contents, $path) {

        // Replace .md in URLs
        $contents = str_replace('.md', '', $contents);

        // Wrap tables for responsiveness
        $contents = str_replace('<table', '<div class="table-responsive"><table', $contents);
        $contents = str_replace('</table>', '</table></div>', $contents);

        // Fix URLs on index pages
        if (basename($path) === 'index.md') {
            $folder = basename(dirname($path));
            $contents = preg_replace_callback('/<a href="([-a-zA-Z0-9\/\.]+)">/', function($matches) use ($folder) {
                return sprintf('<a href="%s">', $folder . '/' . $matches[1]);
            }, $contents);
        }

        return $contents;
    }

    /**
     * Convert a header title into a hash.
     *
     * @param string $string
     * @return string
     */
    public static function makeHash($string) {
        $hash = strtolower(str_replace([
            '-', ' ', '&amp;', '&', '.'
        ], [
            '_', '-', 'and', 'and', ''
        ], trim($string)));

        if (is_numeric($hash)) {
            $hash = 'no-' . $hash;
        }

        return $hash;
    }

}
