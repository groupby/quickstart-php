<?php

use Phalcon\Mvc\Model;

class Search extends Model
{

    public $clientKey;

    public $customerId;

    public $area;

    public $collection;

    public $language;

    public $sortField;

    public $sortOrder;

    public $fieldList;

    public $query;

    public $refinements;

    public $includedNavigations;

    public $excludedNavigations;

    public $p;

    public $ps;

}
