<?php

$codalu = $_POST["modificar_codalu"];
$codcur = $_POST["modificar_codcur"];
$dni = $_POST["modificar_dni"];
$apellido = $_POST["modificar_apellido"];
$nombre = $_POST["modificar_nombre"];

$mysqli = new mysqli ( "localhost", "root", "", "ocupacional" );
$mysqli->set_charset ( "utf8" );
$mysqli->query ( "UPDATE `alumnos` SET `COD_CUR`='$codcur',`DNI`='$dni',`APELLIDOS`='$apellido',`NOMBRE`='$nombre' WHERE COD_ALU='$codalu'" );

header("Location: http://localhost/Eclipse/PracticaPHP/views/alumnos.php");
exit();