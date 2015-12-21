<?php

use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\PresenceOf;

class SearchForm extends Form
{

    public function initialize($entity = null, $options = null)
    {
        // Client Key
        $clientKey = new Text('clientKey');
        $clientKey->setAttribute('placeholder', 'Client Key');
        $clientKey->setFilters(array('striptags', 'string'));
//        $clientKey->addValidators(array(
//            new PresenceOf(array(
//                'message' => 'Client Key required'
//            ))
//        ));
        $this->add($clientKey);

        // Customer Id
        $customerId = new Text('customerId');
        $customerId->setAttribute('placeholder', 'Customer ID');
        $customerId->setFilters(array('striptags', 'string'));
//        $customerId->addValidators(array(
//            new PresenceOf(array(
//                'message' => 'Customer Id is required'
//            ))
//        ));
        $this->add($customerId);

        // Area
        $area = new Text('area');
        $area->setAttribute('placeholder', 'Area');
        $area->setFilters(array('striptags', 'string'));
        $this->add($area);

        // Collection
        $collection = new Text('collection');
        $collection->setAttribute('placeholder', 'Collection');
        $collection->setFilters(array('striptags', 'string'));
        $this->add($collection);

        // Collection
        $language = new Text('language');
        $language->setAttribute('placeholder', 'Language');
        $language->setFilters(array('striptags', 'string'));
        $this->add($language);

        // Sort Field
        $sortField = new Text('sortField');
        $sortField->setAttribute('placeholder', 'Sort Field');
        $sortField->setFilters(array('striptags', 'string'));
        $this->add($sortField);

        // Sort Order
        $sortOrder = new Text('sortOrder');
        $sortOrder->setAttribute('placeholder', 'Sort Order (A or D)');
        $sortOrder->setFilters(array('striptags', 'string'));
        $this->add($sortOrder);

        // Field List
        $fieldList = new Text('fieldList');
        $fieldList->setAttribute('placeholder', 'Field List (comma separated)');
        $fieldList->setFilters(array('striptags', 'string'));
        $this->add($fieldList);

        // Included Navigations
        $includedNavigations = new Text('includedNavigations');
        $includedNavigations->setAttribute('placeholder', 'Included Navigations (comma separated)');
        $includedNavigations->setFilters(array('striptags', 'string'));
        $this->add($includedNavigations);

        // Excluded Navigations
        $excludedNavigations = new Text('excludedNavigations');
        $excludedNavigations->setAttribute('placeholder', 'Excluded Navigations (comma separated)');
        $excludedNavigations->setFilters(array('striptags', 'string'));
        $this->add($excludedNavigations);

        // Query
        $query = new Text('query');
        $query->setAttribute('placeholder', 'Search');
        $query->setFilters(array('striptags', 'string'));
//        $query->addValidators(array(
//            new PresenceOf(array(
//                'message' => 'Query is required'
//            ))
//        ));
        $this->add($query);

        // Refinements
        $this->add(new Hidden('refinements'));

        // Paging
        $this->add(new Hidden('p'));

        // Page Size
        $this->add(new Hidden('ps'));
    }
}