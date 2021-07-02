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
                new Twig\TwigFunction('is_active', function ($router){
                    return isActive($router);
                }),
                new Twig\TwigFunction('appname', function (){
                    return $_ENV['APP_NAME'];
                }),
                new Twig\TwigFunction('is_admin', function (){
                    return isAdmin();
                }),
                new Twig\TwigFunction('current_url', function (){
                    return currentUrl();
                }),
                new Twig\TwigFunction('ellipsis_str', function ($str){
                    return ellipsisStr($str);
                }),
            ]
        );
    }
}