<?php
/**
 * @copyright   2010-2013, The Titon Project
 * @license     http://opensource.org/licenses/bsd-license.php
 * @link        http://titon.io
 */

namespace Common\Model;

use Titon\Model\Behavior\HierarchicalBehavior;

class Doc extends Common {

    /**
     * Configuration.
     *
     * @type array
     */
    protected $_config = [
        'table' => 'docs'
    ];

    /**
     * Table schema.
     *
     * @type array
     */
    protected $_schema = [
        'id' => ['type' => 'int', 'ai' => true, 'primary' => true],
        'parent_id' => ['type' => 'int', 'index' => true],
        'left' => ['type' => 'smallint', 'index' => true],
        'right' => ['type' => 'smallint', 'index' => true],
        'version' => ['type' => 'varchar', 'length' => 20],
        'title' => 'varchar',
        'slug' => 'varchar',
        'content' => 'text',
        'created' => 'datetime',
        'updated' => 'datetime'
    ];

    /**
     * Set behaviors and relations.
     */
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

    /**
     * Return a document by ID or slug.
     *
     * @param string|int $id
     * @return \Titon\Model\Entity
     */
    public static function getDoc($id) {
        $self = self::getInstance();
        $key = is_numeric($id) ? $self->getPrimaryKey() : 'slug';

        return $self->select()
            ->where($key, $id)
            ->with(['Parent', 'Children', 'Sections'])
            ->cache([__METHOD__, $id])
            ->fetch();
    }

    /**
     * Return all the docs in order.
     *
     * @return \Titon\Model\Entity[]
     */
    public static function getAll() {
        return self::getInstance()->select()
            ->orderBy('left', 'asc')
            ->fetchAll();
    }

    public static function getHierarchy() {
        return self::getInstance()->getBehavior('Hierarchical')
            ->getList();
    }

    /**
     * Return the hierarchy tree for all nodes below the node with ID.
     *
     * @param string|int $id
     * @return array
     */
    public static function getHierarchyChildren($id) {
        $doc = self::getDoc($id);

        if (!$doc) {
            return null;
        }

        return self::getInstance()->getBehavior('Hierarchical')->getTree($doc->id);
    }

}