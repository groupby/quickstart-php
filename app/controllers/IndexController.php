<?php

use GroupByInc\API\CloudBridge;
use GroupByInc\API\Model\RefinementsResult;
use GroupByInc\API\Model\Results;
use GroupByInc\API\Query;
use GroupByInc\API\Request\Request;
use GroupByInc\API\Request\Sort;
use Phalcon\DI;
use Phalcon\Exception;
use Phalcon\Http\Response;
use Phalcon\Mvc\View;

class IndexController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Search');
        parent::initialize();
    }

    public function indexAction()
    {
        $this->view->form = new SearchForm();
        $this->view->setVar('params', new Search());
    }

    /**
     * Sends query to the bridge
     */
    public function searchAction()
    {
        if (!$this->request->isPost()) {
            return $this->forward('index/index');
        }

        $form = new SearchForm();
        $search = new Search();

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

    public function searchRefinementsAction()
    {
        if ($this->request->isPost() && $this->request->isAjax()) {
            $navigation = $this->request->getPost('name');
            $params = $this->request->getPost('params');

            $bridge = new CloudBridge(trim($params['clientKey']), trim($params['customerId']));
            $query = new Query();
            $query->setArea($params['area']);
            $query->setCollection($params['collection']);
            $query->setLanguage($params['language']);

            if (!empty($params['sortField'])) {
                $sort = new Sort();
                $sort->setField($params['sortField']);
                $sort->setOrder($params['sortOrder']);
                $query->setSort($sort);
            }

            $query->setQuery($params['query']);
            $query->addRefinementsByString($params['refinements']);
            $query->setSkip($params['p']);
            $query->setPageSize($params['ps']);

            /** @var RefinementsResult $results */
            $results = $bridge->refinements($query, $navigation);

            $response = new Response();
            if ($results == null || !empty($results->errors)) {

                $response->setStatusCode(400, 'Bad Request');
                $response->setContent($results->getErrors());
            } else {
                // get compiled template
                $content = $this->template->getString('searchRefinements.volt', array('nv' => $results->getNavigation()));
                $response->setStatusCode(200, 'OK');
                $response->setContent($content);
            }
            return $response;
        }
    }
}
