<?php
/**
 * @copyright    Copyright 2010-2013, The Titon Project
 * @license        http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

use Titon\Cache\Storage\FileSystemStorage;
use Titon\Mvc\Application;

$app = Application::getInstance();

// Use file system in dev
$app->get('cache')->addStorage(new FileSystemStorage('default', [
    'directory' => TEMP_DIR . 'cache/'
]));