<?php

$codalu = $_POST["nuevo_codalu"];
$codcur = $_POST["nuevo_codcur"];
$dni = $_POST["nuevo_dni"];
$apellido = $_POST["nuevo_apellido"];
$nombre = $_POST["nuevo_nombre"];

$mysqli = new mysqli ( "localhost", "root", "", "ocupacional" );
$mysqli->set_charset ( "utf8" );
$mysqli->query ( "INSERT INTO `alumnos`(`COD_ALU`, `COD_CUR`, `DNI`, `APELLIDOS`, `NOMBRE`) VALUES ('$codalu','$codcur','$dni','$apellido','$nombre')" );

header("Location: http://localhost/Eclipse/PracticaPHP/views/alumnos.php"); 
exit();