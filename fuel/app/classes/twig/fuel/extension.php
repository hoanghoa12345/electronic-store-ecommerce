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
                new Twig\TwigFunction('getUserInformation', function ($field) {
                    return Auth::get($field);
                }),
                new Twig\TwigFunction('vndFormater', function($num){
                    return number_format($num,0,'.',',') . '₫';
                }),
            ]
        );
    }
}