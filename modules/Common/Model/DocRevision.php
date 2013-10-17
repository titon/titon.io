<?php
/**
 * @copyright   2010-2013, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Common\Model;

class DocRevision extends Common {

    /**
     * Configuration.
     *
     * @type array
     */
    protected $_config = [
        'table' => 'doc_revisions'
    ];

    /**
     * Table schema.
     *
     * @type array
     */
    protected $_schema = [
        'id' => ['type' => 'int', 'ai' => true, 'primary' => true],
        'doc_section_id' => ['type' => 'int', 'index' => true],
        'content' => 'text',
        'created' => 'datetime',
        'updated' => 'datetime'
    ];

    /**
     * Set behaviors and relations.
     */
    public function initialize() {
        parent::initialize();

        // Relations
        $this->belongsTo('Section', 'Common\Model\DocSection', 'doc_section_id');
    }

}