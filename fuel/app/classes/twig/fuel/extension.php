<?php

class Twig_Fuel_Extension extends \Parser\Twig_Fuel_Extension
{
    public function getFunctions()
    {
        return array_merge(
            parent::getFunctions(), [
                /*
                 * Define a new function Twig
                 * Example form button
                 */
               
            ]
        );
    }
}