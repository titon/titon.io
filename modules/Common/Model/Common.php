<?php
/**
 * @copyright   2010-2013, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Common\Model;

use Titon\Model\Behavior\TimestampableBehavior;
use Titon\Model\Model;
use Titon\Model\Relation;

abstract class Common extends Model {

    /**
     * All models should auto-timestamp on save.
     */
    public function initialize() {
        parent::initialize();

        $this->addBehavior(new TimestampableBehavior());
    }

}