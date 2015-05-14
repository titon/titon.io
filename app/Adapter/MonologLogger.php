<?php
/**
 * @copyright   2010-2015, The Titon Project
 * @license     http://opensource.org/licenses/BSD-3-Clause
 * @link        http://titon.io
 */

namespace Titon\Adapter;

use Monolog\Logger;
use Monolog\Registry;
use Slim\Log;
use Slim\LogWriter;

class MonologLogger extends LogWriter {

    /**
     * Write a message to the Monolog layer.
     *
     * @param mixed $message
     * @param int $level
     * @return bool
     */
    public function write($message, $level = Log::DEBUG) {
        switch ($level) {
            case Log::EMERGENCY:    $level = Logger::EMERGENCY; break;
            case Log::ALERT:        $level = Logger::ALERT; break;
            case Log::CRITICAL:     $level = Logger::CRITICAL; break;
            case Log::FATAL:        $level = Logger::CRITICAL; break;
            case Log::ERROR:        $level = Logger::ERROR; break;
            case Log::WARN:         $level = Logger::WARNING; break;
            case Log::NOTICE:       $level = Logger::NOTICE; break;
            case Log::INFO:         $level = Logger::INFO; break;
            case Log::DEBUG:        $level = Logger::DEBUG; break;
        }

        return Registry::getInstance('default')->log($level, $message);
    }

}
