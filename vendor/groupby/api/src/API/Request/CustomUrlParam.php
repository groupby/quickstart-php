<?php

namespace GroupByInc\API\Request;

class CustomUrlParam
{
    /** @var string */
    private $key;
    /** @var string */
    private $value;

    /**
     * @return string
     */
    public function getKey()
    {
        return $this->key;
    }

    /**
     * @param string $key
     * @return CustomUrlParam
     */
    public function setKey($key)
    {
        $this->key = $key;
        return $this;
    }

    /**
     * @return string
     */
    public function getValue()
    {
        return $this->value;
    }

    /**
     * @param string $value
     * @return CustomUrlParam
     */
    public function setValue($value)
    {
        $this->value = $value;
        return $this;
    }


}