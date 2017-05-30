<?php

$codalu = $_POST["borrar_codalu"];

$mysqli = new mysqli ( "localhost", "root", "", "ocupacional" );
$mysqli->set_charset ( "utf8" );
$mysqli->query ( "DELETE FROM alumnos WHERE COD_ALU = '$codalu'" );

header("Location: http://localhost/Eclipse/PracticaPHP/views/alumnos.php");
exit();