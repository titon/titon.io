<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

use Monolog\ErrorHandler;
use Monolog\Handler\RotatingFileHandler;
use Monolog\Logger;
use Monolog\Registry;

// Instantiated a logger
$logger = new Logger('default');
$logger->pushHandler(new RotatingFileHandler(TEMP_DIR . 'logs/titon.log', 7));

// Store it for use elsewhere
Registry::addLogger($logger, 'default');

// Register as an error handler
ErrorHandler::register($logger);
