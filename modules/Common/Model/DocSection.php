<?php

namespace Common\Model;

class DocSection extends Common {

    protected $_config = [
        'table' => 'doc_sections'
    ];

    protected $_schema = [
        'id' => 'serial',
        'doc_id' => ['type' => 'int', 'foreign' => 'docs.id'],
        'doc_revision_id' => ['type' => 'int', 'foreign' => 'doc_revisions.id'],
        'order' => 'smallint',
        'title' => 'varchar',
        'slug' => 'varchar',
        'created' => 'datetime',
        'updated' => 'datetime'
    ];

    public function initialize() {
        parent::initialize();

        // Relations
        $this->belongsTo('Doc', 'Common\Model\Doc', 'doc_id');
        $this->belongsTo('CurrentRevision', 'Common\Model\DocRevision', 'doc_revision_id');

        $this->hasMany('Revisions', 'Common\Model\DocRevision', 'doc_section_id')
            ->setConditions(function() {
                $this->orderBy('created', 'desc');
            });
    }

}