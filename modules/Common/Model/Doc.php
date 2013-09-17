<?php

namespace Common\Model;

use Titon\Model\Behavior\HierarchicalBehavior;

class Doc extends Common {

    protected $_config = [
        'table' => 'docs'
    ];

    protected $_schema = [
        'id' => 'serial',
        'parent_id' => ['type' => 'int', 'foreign' => 'docs.id'],
        'left' => ['type' => 'smallint', 'index' => true],
        'right' => ['type' => 'smallint', 'index' => true],
        'version' => ['type' => 'varchar', 'length' => 20],
        'title' => 'varchar',
        'slug' => 'varchar',
        'content' => 'text',
        'created' => 'datetime',
        'updated' => 'datetime'
    ];

    public function initialize() {
        parent::initialize();

        // Behaviors
        $this->addBehavior(new HierarchicalBehavior());

        // Relations
        $this->belongsTo('Parent', 'Common\Model\Doc', 'parent_id');

        $this->hasMany('Children', 'Common\Model\Doc', 'parent_id')
            ->setConditions(function() {
                $this->orderBy('left', 'asc');
            });

        $this->hasMany('Sections', 'Common\Model\DocSection', 'doc_id')
            ->setConditions(function() {
                $this->orderBy('order', 'asc');
            });
    }

}