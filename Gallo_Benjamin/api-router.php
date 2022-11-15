<?php
require_once 'libs/Router.php';
require_once 'app/controllers/movie-api.controller.php';

define("BASE_URL", 'http://'.$_SERVER["SERVER_NAME"].':'.$_SERVER["SERVER_PORT"].dirname($_SERVER["PHP_SELF"]).'/');

// recurso solicitado
$resource = $_GET["resource"];

// método utilizado
$method = $_SERVER["REQUEST_METHOD"];

$router = new Router();

// define la tabla de ruteo
$router->addRoute('/movies', 'GET', 'MovieApiController', 'getMovies');
$router->addRoute('/movies/:COLUMN/:DIRECTION', 'GET', 'MovieApiController', 'getMovies');
$router->addRoute('/movies', 'POST', 'MovieApiController', 'insertMovie');
$router->addRoute('/movies/:ID', 'GET', 'MovieApiController', 'getMovie');
$router->addRoute('/movies/:ID', 'DELETE', 'MovieApiController', 'deleteMovie');
$router->addRoute('/movies/:ID', 'PUT', 'MovieApiController', 'editMovie');

// rutea
$router->route($resource, $method);

