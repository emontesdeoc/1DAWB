<?php

$codcur = $_POST["modificar_cod_cur"];
$descripcion = $_POST["modificar_descripcion"];
$tutor = $_POST["modificar_tutor"];
$horas = $_POST["modificar_horas"];

$mysqli = new mysqli ( "localhost", "root", "", "ocupacional" );
$mysqli->set_charset ( "utf8" );
$mysqli->query ( "UPDATE `cursos` SET `DESCRIPCION`='$descripcion',`HORAS`='$horas',`TUTOR`='$tutor' WHERE COD_CUR = '$codcur'" );

header("Location: http://localhost/Eclipse/PracticaPHP/views/cursos.php"); 
exit();