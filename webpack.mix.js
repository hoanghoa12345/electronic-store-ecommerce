const { mix } = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix
    .styles([
        'node_modules/bootstrap/dist/css/bootstrap.min.css',
		'fuel/app/themes/css/app.css',
    ], 'public/assets/css/app.css')
	.scripts([
		'node_modules/jquery/dist/jquery.min.js',
		'node_modules/bootstrap/dist/js/bootstrap.min.js',
		'node_modules/popper.js/dist/popper.min.js',
		'fuel/app/themes/js/app.js',
	], 'public/assets/js/app.js');