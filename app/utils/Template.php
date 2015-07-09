<?php

use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt\Compiler;

class Template extends View
{
    private $templatesDir;
    /** @var Compiler */
    private $compiler;

    function __construct($templatesDir, $viewsDir)
    {
        $this->templatesDir = $templatesDir;
        $this->setViewsDir($viewsDir);
        $this->registerEngines(array(
            ".volt" => 'volt'
        ));

        $this->compiler = new Compiler();
    }

    public function getString($templatePath, $data)
    {
        extract($data);

        $this->compiler->compile($this->templatesDir . '/' . $templatePath);

        ob_start();

        include $this->compiler->getCompiledTemplatePath();

        return ob_get_clean();
    }
}