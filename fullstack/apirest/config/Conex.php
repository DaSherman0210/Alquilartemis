<?php
include "db.php";

abstract class Conex{
    protected $dbCnx;
    public function __construct(){
        $this -> dbCnx = new PDO(DB_TYPE.":host=".DB_HOST.";dbname=".DB_NAME , DB_USER , DB_PWD , [PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC]);
    }
    protected function Conexion(){
        try {
            $conectar = $this -> dbCnx = new PDO("mysql:local=localhost;dbname=alquilartemis", "campus", "campus2023");
            return $conectar;
        } catch (Exception $e) {
            return $e -> getMessage();
        }
    }
    public function set_name(){
        return $this -> dbCnx -> query("SET NAMES 'utf8'");
    }
}
?>