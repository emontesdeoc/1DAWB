﻿<!DOCTYPE html>
<html>
<head>
    <title>PHP - Alumnos</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/bootstrap-theme.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<?php
session_start();

?>

    <div class="container">
        <div class="header clearfix">
            <nav>
                <ul class="nav nav-pills pull-right">
                    <li role="presentation"><a href="cursos.php">Cursos</a></li>
                    <li role="presentation" class="active"><a href="alumnos.php">Alumnos</a></li>
                    <li role="presentation"><a href="notas.php">Notas</a></li>
                </ul>
            </nav>
            <h3 class="text-muted"><a href="../index.html"> WinBDD PHP </a></h3>
        </div>
        <!-- @* Cursos contenedor *@ -->
        <div id="form-container" style="width:100%;">
            <form method="post" action="alumnos.php">
                <table class="table table-hover" style="margin-bottom: 0px;">
                    <tr>
                        <th>C. alumno</th>
                        <th>C. curso</th>
                        <th>Dni</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Modificar</th>
                        <th>Borrar</th>
                    </tr>

					<?php
						$mysqli = new mysqli("localhost", "root", "", "ocupacional");
						$mysqli->set_charset("utf8");
						$query = "SELECT * FROM alumnos";
						
						if ($result = $mysqli->query($query)) {
						    while ($row = $result->fetch_row()) {
						        printf("<tr>");
						        printf("<td>$row[0]</td>");
						        printf("<td>$row[1]</td>");
						        printf("<td>$row[2]</td>");
						        printf("<td>$row[3]</td>");
						        printf("<td>$row[4]</td>");
						        printf("<td><button type=\"button\" class=\"btn btn-warning\" data-toggle=\"modal\" data-target=\".bs-modificar-modal-sm\" onclick=\"CargarModificar('$row[0]', '$row[1]', '$row[2]', '$row[3]', '$row[4]');\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span> Modificar</button></td>");
						        printf("<td><button type=\"button\" class=\"btn btn-danger\" data-toggle=\"modal\" data-target=\".bs-borrar-modal-sm\" onclick=\"CargarBorrar('$row[0]', '$row[1]', '$row[2]', '$row[3]', '$row[4]');\"><span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span> Borrar</button></td>");
						        printf("<tr>");
						        
						    }
						}
						?>                    
                </table>
                           </form>
            <div class="text-center">
                <div class="btn-group" style="text-align:center;">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-nuevo-modal-sm"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Nuevo alumno</button>
                </div>
            </div>


        </div>

        <!-- @* Modal nuevo curso *@ -->
        <div class="modal fade bs-nuevo-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="text-center">
                        <h2>Nuevo alumno</h2>
                    </div>
                    <div id="modal-form-container">
                        <form method="post" action="../controllers/alumno_nuevo.php">
                            <div class="form-group">
                                <label for="cod_alu">Codigo de alumno</label>
                                <input type="text" class="form-control" id="cod_alu" placeholder="Codigo de alumno" name="nuevo_codalu">
                            </div>
                            <div class="form-group">
                                <label for="cod_cur">Codigo de curso</label>
                                <select class="form-control" name="nuevo_codcur" id="cod_cur">
                                    <?php
											$mysqli = new mysqli("localhost", "root", "", "ocupacional");
											$mysqli->set_charset("utf8");
											$query = "SELECT * FROM cursos";
											
											if ($result = $mysqli->query($query)) {
											    while ($row = $result->fetch_row()) {
											        printf("<option value=\"$row[0]\">$row[1]</option>");
											    }
											}
											?>                                       
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="dni">DNI</label>
                                <input type="text" class="form-control" id="dni" placeholder="DNI" name="nuevo_dni">
                            </div>
                            <div class="form-group">
                                <label for="apellidos">Apellidos</label>
                                <input type="text" class="form-control" id="apellidos" placeholder="Apellidos" name="nuevo_apellido">
                            </div>
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="nombre" placeholder="Nombre" name="nuevo_nombre">
                            </div>
                            <div class="text-center">
                                <div class="form-group btn-group" style="margin-bottom: -15px;">
                                    <button type="submit" class="btn btn-success" name="nuevo_confirmar"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Confirmar</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- @* Modal modificar curso *@ -->
        <div class="modal fade bs-modificar-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="text-center">
                        <h2>Modificar alumno</h2>
                    </div>
                    <div id="modal-form-container">
                        <form method="post" action="../controllers/alumno_modificar.php">
                            <div class="form-group">
                                <label for="cod_alu">Codigo de alumno</label>
                                <input type="text" class="form-control" id="modificar_cod_alu" placeholder="Codigo de alumno" name="modificar_codalu" value="" readonly />
                            </div>
                            <div class="form-group">
                                <label for="cod_cur">Codigo de curso</label>
                                <select class="form-control" name="modificar_codcur" id="modificar_cod_cur">
                                   <?php
											$mysqli = new mysqli("localhost", "root", "", "ocupacional");
											$mysqli->set_charset("utf8");
											$query = "SELECT * FROM cursos";
											
											if ($result = $mysqli->query($query)) {
											    while ($row = $result->fetch_row()) {
											        printf("<option value=\"$row[0]\">$row[1]</option>");
											    }
											}
											?>  
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="dni">DNI</label>
                                <input type="text" class="form-control" id="modificar_dni" placeholder="DNI" name="modificar_dni" value="" />
                            </div>
                            <div class="form-group">
                                <label for="apellidos">Apellidos</label>
                                <input type="text" class="form-control" id="modificar_apellidos" placeholder="Apellidos" name="modificar_apellido" value="" />
                            </div>
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="modificar_nombre" placeholder="Nombre" name="modificar_nombre" value="" />
                            </div>
                            <div class="text-center">
                                <div class="form-group btn-group" style="margin-bottom: -15px;">
                                    <button type="submit" class="btn btn-success" name="modificar_confirmar"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Confirmar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- @* Modal borrar curso *@ -->
        <div class="modal fade bs-borrar-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="text-center">
                        <h2>Borrar alumno</h2>
                    </div>
                    <div id="modal-form-container">
                        <form method="post" action="../controllers/alumno_borrar.php">
                            <div class="form-group">
                                <label for="cod_alu">Codigo de alumno</label>
                                <input type="text" class="form-control" id="borrar_cod_alu" placeholder="Codigo de alumno" name="borrar_codalu" value="" readonly />
                            </div>
                            <div class="form-group">
                                <label for="cod_cur">Codigo de curso</label>
                                <select class="form-control" name="borrar_codcur" id="borrar_cod_cur" readonly>
                                    <?php
											$mysqli = new mysqli("localhost", "root", "", "ocupacional");
											$mysqli->set_charset("utf8");
											$query = "SELECT * FROM cursos";
											
											if ($result = $mysqli->query($query)) {
											    while ($row = $result->fetch_row()) {
											        printf("<option value=\"$row[0]\">$row[1]</option>");
											    }
											}
											?>  
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="dni">DNI</label>
                                <input type="text" class="form-control" id="borrar_dni" placeholder="DNI" name="borrar_dni" value="" readonly />
                            </div>
                            <div class="form-group">
                                <label for="apellidos">Apellidos</label>
                                <input type="text" class="form-control" id="borrar_apellidos" placeholder="Apellidos" name="borrar_apellido" value="" readonly />
                            </div>
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="borrar_nombre" placeholder="Nombre" name="borrar_nombre" value="" readonly />
                            </div>
                            <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="eliminar_checkbox" value="option1" aria-label="...">
                                        Confirmar para borrar curso
                                    </label>
                                </div>
                            </div>
                            <div class="text-center">
                                <div class="form-group btn-group" style="margin-bottom: -15px;">
                                    <button type="submit" class="btn btn-danger" name="borrar_confirmar"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Confirmar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">
            <p style="text-align:center">&copy; Emiliano Montesdeoca del Puerto - 1DAWB - PRO.</p>
        </footer>
    </div>
    <!-- /container -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/js/bootstrap.js"></script>

    <!-- @* Javascript necesario para no hacer postback *@ -->
    <script type="text/javascript" language="javascript">
        function CargarModificar(codalu, codcur, dni, apellidos, nombre) {
            document.getElementById("modificar_cod_alu").setAttribute('value', codalu);
            document.getElementById("modificar_cod_cur").setAttribute('value', codcur);
            document.getElementById("modificar_dni").setAttribute('value', dni);
            document.getElementById("modificar_apellidos").setAttribute('value', apellidos);
            document.getElementById("modificar_nombre").setAttribute('value', nombre);

            var element = document.getElementById('modificar_cod_cur');
            element.value = codcur;
        }
    </script>

    <!-- @* Javascript necesario para no hacer postback *@ -->
    <script type="text/javascript" language="javascript">
        function CargarBorrar(codalu, codcur, dni, apellidos, nombre) {
            document.getElementById("borrar_cod_alu").setAttribute('value', codalu);
            document.getElementById("borrar_cod_cur").setAttribute('value', codcur);
            document.getElementById("borrar_dni").setAttribute('value', dni);
            document.getElementById("borrar_apellidos").setAttribute('value', apellidos);
            document.getElementById("borrar_nombre").setAttribute('value', nombre);

            var element = document.getElementById('borrar_cod_cur');
            element.value = codcur;
        }
    </script>
</body>
</html>