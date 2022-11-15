<?php
require_once './app/models/movies.model.php';
require_once './app/views/api.view.php';

class MovieApiController {
    private $model;
    private $view;

    private $data;

    public function __construct() {
        $this->model = new MovieModel();
        $this->view = new ApiView();
        
        // lee el body del request
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }

    public function getMovies($params = null) {
        if($params != null){
            $column = $params[':COLUMN'];
            $direction = $params[':DIRECTION'];
            $movies = $this->model->getAllOrdered($column, $direction);
        }
        else{
            $movies = $this->model->getAll();
        }
        if($movies){
            $this->view->response($movies);
        }
        else{
            $this->view->response("Los parametros ingresados son incorrectos", 404);
        }
        
    }

    public function getMovie($params = null) {
        $id = $params[':ID'];
        $movie = $this->model->get($id);
        if ($movie)
            $this->view->response($movie);
        else 
            $this->view->response("La pelicula con el id=$id no existe", 404);
    }

    public function deleteMovie($params = null) {
        $id = $params[':ID'];

        $movie = $this->model->get($id);
        if ($movie) {
            $this->model->delete($id);
            $this->view->response($movie);
        } else 
            $this->view->response("La pelicula con el id=$id no existe", 404);
    }

    public function insertMovie($params = null) {
        $movie = $this->getData();
        if (empty($movie->title) || empty($movie->year_movie) || empty($movie->producer) || empty($movie->synopsis) || empty($movie->duration) || empty($movie->url_image) || empty($movie->id_genre_fk)) {
            $this->view->response("Complete los datos", 400);
        } else {
            $id = $this->model->insert($movie->title, $movie->year_movie, $movie->producer, $movie->synopsis, $movie->duration, $movie->url_image, $movie->id_genre_fk);
            $movie = $this->model->get($id);
            $this->view->response($movie, 201);
        }
    }
    
    public function editMovie($params = null) {
        $id = $params[':ID'];
        $old_movie = $this->model->get($id);
        if($old_movie){
            $movie = $this->getData();
            if (empty($movie->title) || empty($movie->year_movie) || empty($movie->producer) || empty($movie->synopsis) || empty($movie->duration) || empty($movie->url_image) || empty($movie->id_genre_fk)) {
                $this->view->response("Complete los datos", 400);
            } else {
                $this->model->edit($movie->title, $movie->year_movie, $movie->producer, $movie->synopsis, $movie->duration, $movie->url_image, $movie->id_genre_fk, $id);
                $this->view->response($this->model->get($id));
            }  
        } else 
        $this->view->response("La pelicula con el id=$id no existe", 404);
    }
    
}