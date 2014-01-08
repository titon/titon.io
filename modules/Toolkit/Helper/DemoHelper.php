<?php

namespace Toolkit\Helper;

use Titon\View\Helper\AbstractHelper;

class DemoHelper extends AbstractHelper {

    /**
     * Get a value from the current query string or return a default.
     *
     * @param string $value
     * @param string $default
     * @return string
     */
    public function value($value, $default = '') {
        return $this->getRequest()->get($value) ?: $default;
    }

    /**
     * Return a JS parameter in string format.
     *
     * @param string $value
     * @param string $default
     * @return string
     */
    public function string($value, $default = '') {
        return sprintf("'%s'", $this->value($value, $default));
    }

    /**
     * Return a JS parameter in number format.
     *
     * @param string $value
     * @param int $default
     * @return int
     */
    public function number($value, $default = 0) {
        return (int) $this->value($value, $default);
    }

    /**
     * Return a JS parameter in bool format.
     *
     * @param string $value
     * @param bool $default
     * @return string
     */
    public function bool($value, $default = true) {
        return $this->value($value, $default) ? 'true' : 'false';
    }

}