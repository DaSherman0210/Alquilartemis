<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');
require_once("../config/Conex.php");
require_once("../models/Cliente.php");

$cliente = new Cliente();
$body = json_decode(file_get_contents("php://input"), true);

switch($_GET["op"]){
    case "GetAll":
        $datos = $cliente -> get_cliente();
        echo json_encode($datos);
        break;
    default:
        echo "Hay un error";
        break;
}
?>