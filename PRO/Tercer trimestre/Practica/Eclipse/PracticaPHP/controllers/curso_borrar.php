<?php

$codcur = $_POST["eliminar_cod_cur"];

$mysqli = new mysqli ( "localhost", "root", "", "ocupacional" );
$mysqli->set_charset ( "utf8" );
$mysqli->query ( "DELETE FROM `cursos` WHERE COD_CUR='$codcur'" );

header("Location: http://localhost/Eclipse/PracticaPHP/views/cursos.php"); /* Redirect browser */
exit();