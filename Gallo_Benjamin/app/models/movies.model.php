<?php

class MovieModel {

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_movies;charset=utf8', 'root', '');
    }

    public function getAll() {
        // 1. abro conexión a la DB
        // ya esta abierta por el constructor de la clase
        $query = $this->db->prepare("SELECT * FROM movies");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ); // devuelve un arreglo de objetos
    }

    public function get($id) {
        $query = $this->db->prepare("SELECT * FROM movies WHERE id = ?");
        $query->execute([$id]);
        $task = $query->fetch(PDO::FETCH_OBJ);
        return $task;
    }

    public function insert($title, $year, $producer, $synopsis, $duration, $url_image, $id_genre_fk) {
        $query = $this->db->prepare("INSERT INTO movies (title, year_movie, producer, synopsis, duration, url_image, id_genre_fk) 
                                     VALUES (?, ?, ?, ?, ?, ?, ?)");
        $query->execute([$title, $year, $producer, $synopsis, $duration, $url_image, $id_genre_fk]);

        return $this->db->lastInsertId();
    }

    function delete($id) {
        $query = $this->db->prepare('DELETE FROM movies WHERE id = ?');
        $query->execute([$id]);
    }

    public function finalize($id) {
        $query = $this->db->prepare('UPDATE task SET finalizada = 1 WHERE id = ?');
        $query->execute([$id]);
        // var_dump($query->errorInfo()); // y eliminar la redireccion
    }

    function edit($title, $year_movie, $producer, $synopsis, $duration, $url_image, $id_genre_fk, $id) {
        $query = $this->db->prepare("UPDATE movies SET title=?, year_movie=?, producer=?, synopsis=?, duration=?, url_image=?, id_genre_fk=?  WHERE id = ?");
        $query->execute([$title, $year_movie, $producer, $synopsis, $duration, $url_image, $id_genre_fk, $id]);
    }

    public function getAllOrdered($order, $direction) {
        try {
            $query = $this->db->prepare("SELECT * FROM movies ORDER BY $order $direction");
            $query->execute();
            return $query->fetchAll(PDO::FETCH_OBJ);
        }
        catch (PDOException $e) {
            return null;
        }
    }
}
