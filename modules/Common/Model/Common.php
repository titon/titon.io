<?php

namespace Common\Model;

use Titon\Model\Behavior\TimestampableBehavior;
use Titon\Model\Model;
use Titon\Model\Relation;

abstract class Common extends Model {

    public function initialize() {
        parent::initialize();

        $this->addBehavior(new TimestampableBehavior());
    }

    public static function getById($id) {
        /** @type \Titon\Model\Model $instance */
        $instance = self::getInstance();

        return $instance->select()
            ->where($instance->getPrimaryKey(), $id)
            ->with(array_keys($instance->getRelations(Relation::MANY_TO_ONE)))
            ->fetch();
    }

}