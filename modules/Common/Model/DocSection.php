<?php
/**
 * @copyright   2010-2013, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Common\Model;

class DocSection extends Common {

    /**
     * Configuration.
     *
     * @type array
     */
    protected $_config = [
        'table' => 'doc_sections'
    ];

    /**
     * Table schema.
     *
     * @type array
     */
    protected $_schema = [
        'id' => ['type' => 'int', 'ai' => true, 'primary' => true],
        'doc_id' => ['type' => 'int', 'index' => true],
        'doc_revision_id' => ['type' => 'int', 'index' => true],
        'order' => 'smallint',
        'title' => 'varchar',
        'slug' => 'varchar',
        'created' => 'datetime',
        'updated' => 'datetime'
    ];

    /**
     * Set behaviors and relations.
     */
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

    /**
     * Return a document section by ID or slug.
     *
     * @param string|int $id
     * @return \Titon\Model\Entity
     */
    public static function getSection($id) {
        $self = self::getInstance();
        $key = is_numeric($id) ? $self->getPrimaryKey() : 'slug';

        return $self->select()
            ->where($key, $id)
            ->with(['Doc', 'CurrentRevision', 'Revisions'])
            ->cache([__METHOD__, $id])
            ->fetch();
    }

}