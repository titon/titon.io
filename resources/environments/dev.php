<?php
/**
 * @copyright    Copyright 2010-2014, The Titon Project
 * @license        http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

use Titon\Cache\Storage\FileSystemStorage;
use Titon\Debug\Debugger;
use Titon\Mvc\Application;

$app = Application::getInstance();

// Enable error reporting
Debugger::enable();

// Use file system in dev
$app->get('cache')->addStorage(new FileSystemStorage('default', [
    'directory' => TEMP_DIR . 'cache/'
]));