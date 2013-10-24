<?php

namespace Toolkit\Controller;

use Common\Controller\CommonController;
use Common\Model\Doc;
use Common\Model\DocRevision;
use Common\Model\DocSection;
use Titon\Route\Router;

class CrudController extends CommonController {

    /**
     * List all doc nodes within javascript.
     */
    public function index() {

    }

    public function listDocs() {
        $this->getView()->setVariable('docs', Doc::getAll());
    }

    public function formDocs($id = null) {
        $doc = Doc::getDoc($id);

        if ($this->getRequest()->isPost()) {
            $data = $this->getRequest()->data;

            if ($doc) {
                Doc::getInstance()->update($id, $data);
            } else {
                $id = Doc::getInstance()->create($data);
            }

            debug($data);

            //$this->getResponse()->redirect('/toolkit/crud/form_docs/' . $id);
        } else if ($doc) {
            $_POST = $doc->all();
        }

        $this->getView()->setVariables([
            'doc' => $doc,
            'docs' => Doc::getHierarchy()
        ]);
    }

    public function create_tables() {
        $doc = new Doc();
        $doc->createTable();
        echo "Created Doc\n";

        $docRevision = new DocRevision();
        $docRevision->createTable();
        echo "Created DocRevision\n";

        $docSection = new DocSection();
        $docSection->createTable();
        echo "Created DocSection\n";

        exit();
    }

    public function sync_tree() {
        $doc = new Doc();
        $doc->getBehavior('Hierarchical')->reOrder([]);
        echo "Re-ordering tree";

        exit();
    }

}