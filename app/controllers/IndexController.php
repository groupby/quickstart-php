<?php

use GroupByInc\API\CloudBridge;
use GroupByInc\API\Model\Results;
use GroupByInc\API\Query;
use GroupByInc\API\Request\Sort;
use Phalcon\DI;

class IndexController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Search');
        parent::initialize();
    }

    public function indexAction()
    {
        $this->view->form = new SearchForm;
    }

    /**
     * Sends query to the bridge
     */
    public function searchAction()
    {
        if ($this->request->isPost() != true) {
            return $this->forward('index/index');
        }

        $form = new SearchForm;
        $search = new Search;

        // Validate the form
        $data = $this->request->getPost();
        if (!$form->isValid($data, $search)) {
            foreach ($form->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('index/search');
        }

        $query = new Query();

        // return all fields with each record.
        // If there are specific fields defined, use these, otherwise default to showing all fields.
        if (!empty($search->fieldList)) {
            $fields = explode(',', $search->fieldList);
            foreach ($fields as $field) {
                if (!empty($field)) {
                    $query->addField(trim($field));
                }
            }
        } else {
            $query->addField('*');
        }

        // If a specific area is set in the url params set it on the query.
        // Areas are used to name space rules / query rewrites.
        if (!empty($search->area)) {
            $query->setArea(trim($search->area));
        }

        // Use a specific language
        // See the documentation for which language codes are available.
        if (!empty($search->language)) {
            $query->setLanguage(trim($search->language));
        }

        // If you have data in different collections you can specify the specific
        // collection you wish to query against.
        if (!empty($search->collection)) {
            $query->setCollection(trim($search->collection));
        }

        // You can specify the sort field and order of the results.
        if (!empty($search->sortField)) {
            $sort = new Sort();
            $sort->setField(trim($search->sortField));
            $sortOrder = trim($search->sortOrder);
            if (!empty($sortOrder)) {
                if ($sortOrder == 'D') {
                    $sort->setOrder(Sort\Order::Descending);
                }
            }
            $query->setSort($sort);
        }

        // If the search string has not been beautified get it from the URL parameters.
        if (!empty($search->query)) {
            $query->setQuery(trim($search->query));
        }

        // If there are additional refinements that aren't being beautified get these from the
        // URL and add them to the query
        if (!empty($search->refinements)) {
            $query->addRefinementsByString($search->refinements);
        }

        // If we're paging through results set the skip
        $query->setSkip($search->p);

        // Define the page size.
        if ($search->ps > 0) {
            $query->setPageSize($search->ps);
        } else {
            $query->setPageSize(50);
        }

        // Create the communications bridge to the cloud service.
        $bridge = new CloudBridge(trim($search->clientKey), trim($search->customerId));

        /** @var Results $results */
        $results = $bridge->search($query);

        $this->view->setVar('results', $results);
        $this->view->setVar('params', $search);

        $this->view->form = $form;
    }
}
