<?php

namespace Common\Model;

class DocRevision extends Common {

    protected $_config = [
        'table' => 'doc_revisions'
    ];

    protected $_schema = [
        'id' => 'serial',
        'doc_section_id' => ['type' => 'int', 'foreign' => 'doc_sections.id'],
        'content' => 'text',
        'created' => 'datetime',
        'updated' => 'datetime'
    ];

    public function initialize() {
        parent::initialize();

        // Relations
        $this->belongsTo('Section', 'Common\Model\DocSection', 'doc_section_id');
    }

}