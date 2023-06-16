<?php
include ("../config/Conex.php");
class Clientes extends Conex{
    private $id_cliente;
    private $nombre;
    private $ubicacion;
    private $telefono;
    private $email;
    public function __construct($id_cliente = "", $nombre = "", $ubicacion = "", $telefono = "", $email = "", $dbCnx = ""){
        $this -> id_cliente = $id_cliente;
        $this -> nombre = $nombre;
        $this -> ubicacion = $ubicacion;
        $this -> telefono = $telefono;
        $this -> email = $email;
        parent::__construct($dbCnx);
    }
    public function setId_cliente($id_cliente){
        $this -> id_cliente = $id_cliente;
    }

    public function getId_cliente(){
        return $this -> id_cliente;
    }

    public function nombre($nombre){
        $this -> nombre = $nombre;
    }

    public function getNombre(){
        return $this -> nombre;
    }

    public function setUbicacion($ubicacion){
        $this -> ubicacion = $ubicacion;
    }

    public function getUbicacion(){
        return $this -> ubicacion;
    }

    public function setTelefono($telefono){
        $this -> telefono = $telefono;
    }

    public function getTelefono(){
        return $this -> telefono;
    }

    public function setEmail($email){
        $this -> email = $email;
    }

    public function getEmail(){
        return $this -> email;
    }

    public function get_cliente(){
        $conectar = parent::Conexion();
        parent::set_name();
        $stm = $conectar -> prepare("SELECT * FROM clientes");
        $stm -> execute();
        return $stm -> fetchAll(PDO::FETCH_ASSOC);
    }

    public function get_cliente_id($id_cliente){
        $conectar = parent::Conexion();
        parent::set_name();
        $stm = $conectar -> prepare("SELECT * FROM clientes WHERE id_cliente = ?");
        $stm -> bindValue(1, $id_cliente);
        $stm -> execute();
        return $stm -> fetchAll(PDO::FETCH_ASSOC);
    }
}
?>