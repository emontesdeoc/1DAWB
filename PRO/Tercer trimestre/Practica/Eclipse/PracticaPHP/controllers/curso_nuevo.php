<?php

$codcur = $_POST["nuevo_codcur"];
$descripcion = $_POST["nuevo_descripcion"];
$tutor = $_POST["nuevo_tutor"];
$horas = $_POST["nuevo_horas"];

$mysqli = new mysqli ( "localhost", "root", "", "ocupacional" );
$mysqli->set_charset ( "utf8" );
$mysqli->query ( "INSERT INTO `cursos`(`COD_CUR`, `DESCRIPCION`, `HORAS`, `TUTOR`) VALUES ('$codcur','$descripcion','$horas','$tutor')" );

header("Location: http://localhost/Eclipse/PracticaPHP/views/cursos.php");
exit();