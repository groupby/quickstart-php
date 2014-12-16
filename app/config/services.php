<?php

use Doctrine\Common\Annotations\AnnotationRegistry;
use GroupByInc\API\Url\UrlFunctions;
use Phalcon\DI\FactoryDefault;
use Phalcon\Flash\Session as FlashSession;
use Phalcon\Loader;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\Url as UrlProvider;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;

/**
 * The FactoryDefault Dependency Injector automatically register the right services providing a full stack framework
 */
$di = new FactoryDefault();

require APP_PATH . 'vendor/autoload.php';

AnnotationRegistry::registerAutoloadNamespace('JMS\Serializer\Annotation',
    APP_PATH . 'vendor/groupby/serializer/src');

/**
 * The URL component is used to generate all kind of urls in the application
 */
$di->set('url', function () use ($config) {
    $url = new UrlProvider();
    $url->setBaseUri($config->application->baseUri);
    return $url;
});


$di->set('view', function () use ($config) {

    $view = new View();

    $view->setViewsDir(APP_PATH . $config->application->viewsDir);

    $view->registerEngines(array(
        ".volt" => 'volt'
    ));

    return $view;
});

/**
 * Setting up volt
 */
$di->set('volt', function ($view, $di) {

    $volt = new VoltEngine($view, $di);

    $volt->setOptions(array(
        "compiledPath" => APP_PATH . "cache/volt/"
    ));

    $compiler = $volt->getCompiler();
    $compiler->addFunction('is_a', 'is_a');

    return $volt;
}, true);

/**
 * Start the session the first time some component request the session service
 */
$di->set('functions', function () {
    $functions = new UrlFunctions();
    return $functions;
});

/**
 * Register the flash service with custom CSS classes
 */
$di->set('flash', function () {
    return new FlashSession(array(
        'error' => 'alert alert-danger',
        'success' => 'alert alert-success',
        'notice' => 'alert alert-info',
    ));
});
