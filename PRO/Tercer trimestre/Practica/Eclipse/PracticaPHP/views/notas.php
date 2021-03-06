﻿<!DOCTYPE html>
<html>
<head>
    <title>PHP - Notas</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/bootstrap-theme.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <!-- @{
        var type = "";
        var message = "";
        var display = "";
        var tabledisplay = "";


        if (!IsPost)
        {
            Session["filtroCodcud"] = "";
            display = "none";
            tabledisplay = "none";
        }
        else
        {
            display = "none";
            tabledisplay = "none";

            /// Modificar nota
            try
            {
                if (Request["modificar_confirmar"] != null)
                {
                    WinBDDRazor.logic.alumnonotas._Codalu = Request["modificar_codalu"];
                    WinBDDRazor.logic.alumnonotas._Nota1 = Convert.ToInt32(Request["modificar_nota1"]);
                    WinBDDRazor.logic.alumnonotas._Nota2 = Convert.ToInt32(Request["modificar_nota2"]);
                    WinBDDRazor.logic.alumnonotas._Nota3 = Convert.ToInt32(Request["modificar_nota3"]);
                    WinBDDRazor.logic.alumnonotas._Media = Convert.ToInt32(Request["modificar_media"]);

                    new WinBDDRazor.logic.alumnonotas().ActualizaNota();

                    type = "warning";
                    message = "Nota modificada correctamente.";
                    display = "inline";
                }
            }
            catch (Exception)
            {
            }
            /// Borrar nota
            try
            {
                if (Request["borrar_confirmar"] != null && Request["eliminar_checkbox"] != null)
                {
                    WinBDDRazor.logic.alumnonotas._Codalu = Request["borrar_codalu"];

                    new WinBDDRazor.logic.alumnonotas().BorarNota();

                    type = "danger";
                    message = "Nota eliminada correctamente.";
                    display = "inline";
                }
            }
            catch (Exception)
            {
            }
            /// Nueva nota
            try
            {
                if (Request["nueva_confirmar"] != null)
                {
                    WinBDDRazor.logic.notas._Codalu = Request["nuevo_alumno"];
                    WinBDDRazor.logic.notas._Nota1 = Convert.ToInt32(Request["nueva_nota1"]);
                    WinBDDRazor.logic.notas._Nota2 = Convert.ToInt32(Request["nueva_nota2"]);
                    WinBDDRazor.logic.notas._Nota3 = Convert.ToInt32(Request["nueva_nota3"]);
                    WinBDDRazor.logic.notas._Media = Convert.ToInt32(Request["nueva_media"]);

                    new WinBDDRazor.logic.notas().CrearNotas();

                    type = "success";
                    message = "Nota agregada correctamente.";
                    display = "inline";
                }
            }
            catch (Exception)
            {

            }

            /// Filtrar por curso
            try
            {
                if (Request["filtro_codcur"] != null)
                {
                    string test = Request["filtro_codcur"];
                    Session["filtroCodcud"] = Request["filtro_codcur"];
                    tabledisplay = "inline-table";

                }
            }
            catch (Exception)
            {

            }
        }
    } -->
    <div class="container">
        <div class="header clearfix">
            <nav>
                <ul class="nav nav-pills pull-right">
                    <li role="presentation"><a href="cursos.php">Cursos</a></li>
                    <li role="presentation"><a href="alumnos.php">Alumnos</a></li>
                    <li role="presentation" class="active"><a href="notas.php">Notas</a></li>
                </ul>
            </nav>
            <h3 class="text-muted"><a href="../index.html"> WinBDD Razor </a></h3>
        </div>



        <!-- @* Cursos contenedor *@ -->
        <div id="form-container" style="width:100%;">
            <form method="post" action="">
                <div class="form-group" style="width:50%; margin: 0 auto; margin-bottom:20px;">
                    <div class="text-center">
                        <label for="cod_cur">Elegir curso</label>
                        <select onchange="this.form.submit()" class="form-control" name="filtro_codcur" id="cod_cur">
                            <option value="">Seleccione un curso</option>
                           <!--  @foreach (WinBDDRazor.bd.CURSO c in new WinBDDRazor.logic.cursos().GetAllCursos())
                            { -->
                            <option value="@c.COD_CUR">@c.DESCRIPCION</option>
                            <!-- } -->
                        </select>
                    </div>
                </div>
            </form>
            <form method="post" action="">
                <table class="table table-hover" style="display:@tabledisplay; margin-bottom: 10px;">
                    <tr>
                        <td>Codigo alumno</td>
                        <td>Codigo curso</td>
                        <td>Nombre</td>
                        <td>Apellido</td>
                        <td>Ver</td>
                        <td>Modificar</td>
                        <td>Borrar</td>
                    </tr>

                    <!-- @foreach (WinBDDRazor.logic.alumnonotas a in new WinBDDRazor.logic.alumnonotas().GetListaAlumnosNotas().FindAll(x => x.Codcur == Session["filtroCodcud"].ToString()))
                    { -->
                    <tr>
                        <td>@a.Codalu</td>
                        <td>@a.Codcur</td>
                        <td>@a.Apellidos</td>
                        <td>@a.Nombre</td>
                        <td><button type="button" class="btn btn-success" data-toggle="modal" data-target=".bs-ver-modal-sm" onclick="CargarVer('@a.Codalu', '@a.Codcur', '@a.Dni', '@a.Apellidos', '@a.Nombre', @a.Nota1, @a.Nota2, @a.Nota3, @a.Media);"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Ver</button></td>
                        <td><button type="button" class="btn btn-warning" data-toggle="modal" data-target=".bs-modificar-modal-sm" onclick="CargarModificar('@a.Codalu', '@a.Codcur', '@a.Dni', '@a.Apellidos', '@a.Nombre', @a.Nota1, @a.Nota2, @a.Nota3, @a.Media);"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Modificar</button></td>
                        <td><button type="button" class="btn btn-danger" data-toggle="modal" data-target=".bs-borrar-modal-sm" onclick="CargarBorrar('@a.Codalu', '@a.Codcur', '@a.Dni', '@a.Apellidos', '@a.Nombre', @a.Nota1, @a.Nota2, @a.Nota3, @a.Media);"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Borrar</button></td>
                    </tr>
                    <!-- } -->
                </table>
            </form>
            <div class="text-center">


                <div class="btn-group" style="text-align:center;">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-nuevo-modal-sm"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Nueva nota</button>
                    <!-- @*<button type="submit" class="btn btn-warning" data-toggle="modal" data-target=".bs-modificar-modal-sm">Modificar</button>*@
                    @*<button type="submit" class="btn btn-danger" data-toggle="modal" data-target=".bs-borrar-modal-sm">Borrar</button>*@ -->
                </div>
            </div>
        </div>

        <!-- @* Modal ver curso *@ -->
        <div class="modal fade bs-ver-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="text-center">
                        <h2>Ver notas</h2>
                    </div>
                    <div id="modal-form-container">
                        <form method="post" action="">
                            <div class="form-group">
                                <label for="cod_alu">Codigo de alumno</label>
                                <input type="text" class="form-control" id="ver_codalu" placeholder="Codigo de alumno" name="ver_codalu" readonly>
                            </div>
                            <div class="form-group">
                                <label for="cod_cur">Codigo de curso</label>
                                <input type="text" class="form-control" id="ver_codcur" placeholder="Codigo de curso" name="ver_codcur" readonly>

                            </div>
                            <div class="form-group">
                                <label for="dni">DNI</label>
                                <input type="text" class="form-control" id="ver_dni" placeholder="DNI" name="ver_dni" readonly>
                            </div>
                            <div class="form-group">
                                <label for="apellidos">Apellidos</label>
                                <input type="text" class="form-control" id="ver_apellidos" placeholder="Apellidos" name="ver_apellido" readonly>
                            </div>
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="ver_nombre" placeholder="Nombre" name="ver_nombre" readonly>
                            </div>
                            <div class="form-group" style="width:20%;float:left;">
                                <label for="nombre">Nota 1</label>
                                <input type="text" class="form-control" id="ver_nota1" name="ver_nota1" readonly>
                            </div>
                            <div class="form-group" style="width:20%; float:left; margin-left:15px;">
                                <label for="nombre">Nota 2</label>
                                <input type="text" class="form-control" id="ver_nota2" name="ver_nota2" readonly>
                            </div>
                            <div class="form-group" style="width:20%;float:left; margin-left:15px;">
                                <label for="nombre">Nota 3</label>
                                <input type="text" class="form-control" id="ver_nota3" name="ver_nota3" readonly>
                            </div>
                            <div class="form-group" style="width:20%;float:left; margin-left:15px;">
                                <label for="nombre">Media</label>
                                <input type="text" class="form-control" id="ver_media" name="ver_media" readonly>
                            </div>
                            <div class="text-center">
                                <div class="form-group btn-group" style="margin-bottom: -15px;">
                                    <button type="button" class="btn btn-success" data-dismiss="modal" data-target=".bs-ver-modal-sm" name="ver_confirmar"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Cerrar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- @* Modal nuevo curso HAY QUE HACERLO *@ -->
        <div class="modal fade bs-nuevo-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="text-center">
                        <h2>Nueva nota</h2>
                    </div>
                    <div id="modal-form-container">
                        <form method="post" action="">
                            <div class="form-group">
                                <label for="alumno">Alumno</label>
                                <select class="form-control" name="nuevo_alumno" id="nuevo_alumno">
                                    <!-- @foreach (WinBDDRazor.bd.ALUMNO a in new WinBDDRazor.logic.alumnos().GetAllAlumnosSinNota())
                                    { -->
                                    <option value="@a.COD_ALU">@a.NOMBRE @a.APELLIDOS</option>
                                    <!-- } -->
                                </select>
                            </div>
                            <div class="form-group" style="width:20%;float:left;">
                                <label for="nombre">Nota 1</label>
                                <input type="text" class="form-control" id="nueva_nota1" name="nueva_nota1">
                            </div>
                            <div class="form-group" style="width:20%; float:left; margin-left:15px;">
                                <label for="nombre">Nota 2</label>
                                <input type="text" class="form-control" id="nueva_nota2" name="nueva_nota2">
                            </div>
                            <div class="form-group" style="width:20%;float:left; margin-left:15px;">
                                <label for="nombre">Nota 3</label>
                                <input type="text" class="form-control" id="nueva_nota3" name="nueva_nota3">
                            </div>
                            <div class="form-group" style="width:20%;float:left; margin-left:15px;">
                                <label for="nombre">Media</label>
                                <input type="text" class="form-control" id="nueva_media" name="nueva_media">
                            </div>
                            <div class="text-center">
                                <div class="form-group btn-group" style="margin-bottom: -15px;">
                                    <button type="submit" class="btn btn-success" name="nueva_confirmar"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Crear</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- @* Modal modificar notas *@ -->
        <div class="modal fade bs-modificar-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="text-center">
                        <h2>Modificar notas</h2>
                    </div>
                    <div id="modal-form-container">
                        <form method="post" action="">
                            <div class="form-group">
                                <label for="cod_alu">Codigo de alumno</label>
                                <input type="text" class="form-control" id="modificar_codalu" placeholder="Codigo de alumno" name="modificar_codalu" readonly>
                            </div>
                            <div class="form-group">
                                <label for="cod_cur">Codigo de curso</label>
                                <input type="text" class="form-control" id="modificar_codcur" placeholder="Codigo de curso" name="modificar_codcur" readonly>

                            </div>
                            <div class="form-group">
                                <label for="dni">DNI</label>
                                <input type="text" class="form-control" id="modificar_dni" placeholder="DNI" name="modificar_dni" readonly>
                            </div>
                            <div class="form-group">
                                <label for="apellidos">Apellidos</label>
                                <input type="text" class="form-control" id="modificar_apellidos" placeholder="Apellidos" name="modificar_apellido" readonly>
                            </div>
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="modificar_nombre" placeholder="Nombre" name="modificar_nombre" readonly>
                            </div>
                            <div class="form-group" style="width:20%;float:left;">
                                <label for="nombre">Nota 1</label>
                                <input type="text" class="form-control" id="modificar_nota1" name="modificar_nota1">
                            </div>
                            <div class="form-group" style="width:20%; float:left; margin-left:15px;">
                                <label for="nombre">Nota 2</label>
                                <input type="text" class="form-control" id="modificar_nota2" name="modificar_nota2">
                            </div>
                            <div class="form-group" style="width:20%;float:left; margin-left:15px;">
                                <label for="nombre">Nota 3</label>
                                <input type="text" class="form-control" id="modificar_nota3" name="modificar_nota3">
                            </div>
                            <div class="form-group" style="width:20%;float:left; margin-left:15px;">
                                <label for="nombre">Media</label>
                                <input type="text" class="form-control" id="modificar_media" name="modificar_media">
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

        <!-- @* Modal borrar notas *@ -->
        <div class="modal fade bs-borrar-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="text-center">
                        <h2>Borrar notas</h2>
                    </div>
                    <div id="modal-form-container">
                        <form method="post" action="">
                            <div class="form-group">
                                <label for="cod_alu">Codigo de alumno</label>
                                <input type="text" class="form-control" id="borrar_codalu" placeholder="Codigo de alumno" name="borrar_codalu" readonly>
                            </div>
                            <div class="form-group">
                                <label for="cod_cur">Codigo de curso</label>
                                <input type="text" class="form-control" id="borrar_codcur" placeholder="Codigo de curso" name="borrar_codcur" readonly>

                            </div>
                            <div class="form-group">
                                <label for="dni">DNI</label>
                                <input type="text" class="form-control" id="borrar_dni" placeholder="DNI" name="borrar_dni" readonly>
                            </div>
                            <div class="form-group">
                                <label for="apellidos">Apellidos</label>
                                <input type="text" class="form-control" id="borrar_apellidos" placeholder="Apellidos" name="borrar_apellidos" readonly>
                            </div>
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="borrar_nombre" placeholder="Nombre" name="borrar_nombre" readonly>
                            </div>
                            <div class="form-group" style="width:20%;float:left;">
                                <label for="nombre">Nota 1</label>
                                <input type="text" class="form-control" id="borrar_nota1" name="borrar_nota1" readonly>
                            </div>
                            <div class="form-group" style="width:20%; float:left; margin-left:15px;">
                                <label for="nombre">Nota 2</label>
                                <input type="text" class="form-control" id="borrar_nota2" name="borrar_nota2" readonly>
                            </div>
                            <div class="form-group" style="width:20%;float:left; margin-left:15px;">
                                <label for="nombre">Nota 3</label>
                                <input type="text" class="form-control" id="borrar_nota3" name="borrar_nota3" readonly>
                            </div>
                            <div class="form-group" style="width:20%;float:left; margin-left:15px;">
                                <label for="nombre">Media</label>
                                <input type="text" class="form-control" id="borrar_media" name="borrar_media" readonly>
                            </div>
                            <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="eliminar_checkbox" value="option1" aria-label="...">
                                        Confirmar para borrar nota
                                    </label>
                                </div>
                            </div>
                            <div class="text-center">
                                <div class="form-group btn-group" style="margin-bottom: -15px;">
                                    <button type="submit" class="btn btn-danger" name="borrar_confirmar"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Confirmar</button>
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
        function CargarVer(codalu, codcur, dni, apellidos, nombre, nota1, nota2, nota3, media) {
            document.getElementById("ver_codalu").setAttribute('value', codalu);
            document.getElementById("ver_codcur").setAttribute('value', codcur);
            document.getElementById("ver_dni").setAttribute('value', dni);
            document.getElementById("ver_apellidos").setAttribute('value', apellidos);
            document.getElementById("ver_nombre").setAttribute('value', nombre);
            document.getElementById("ver_nota1").setAttribute('value', nota1);
            document.getElementById("ver_nota2").setAttribute('value', nota2);
            document.getElementById("ver_nota3").setAttribute('value', nota3);
            document.getElementById("ver_media").setAttribute('value', media);
        }
    </script>

    <!-- @* Javascript necesario para no hacer postback *@ -->
    <script type="text/javascript" language="javascript">
        function CargarModificar(codalu, codcur, dni, apellidos, nombre, nota1, nota2, nota3, media) {
            document.getElementById("modificar_codalu").setAttribute('value', codalu);
            document.getElementById("modificar_codcur").setAttribute('value', codcur);
            document.getElementById("modificar_dni").setAttribute('value', dni);
            document.getElementById("modificar_apellidos").setAttribute('value', apellidos);
            document.getElementById("modificar_nombre").setAttribute('value', nombre);
            document.getElementById("modificar_nota1").setAttribute('value', nota1);
            document.getElementById("modificar_nota2").setAttribute('value', nota2);
            document.getElementById("modificar_nota3").setAttribute('value', nota3);
            document.getElementById("modificar_media").setAttribute('value', media);
        }
    </script>

    <!-- @* Javascript necesario para no hacer postback *@ -->
    <script type="text/javascript" language="javascript">
        function CargarBorrar(codalu, codcur, dni, apellidos, nombre, nota1, nota2, nota3, media) {
            document.getElementById("borrar_codalu").setAttribute('value', codalu);
            document.getElementById("borrar_codcur").setAttribute('value', codcur);
            document.getElementById("borrar_dni").setAttribute('value', dni);
            document.getElementById("borrar_apellidos").setAttribute('value', apellidos);
            document.getElementById("borrar_nombre").setAttribute('value', nombre);
            document.getElementById("borrar_nota1").setAttribute('value', nota1);
            document.getElementById("borrar_nota2").setAttribute('value', nota2);
            document.getElementById("borrar_nota3").setAttribute('value', nota3);
            document.getElementById("borrar_media").setAttribute('value', media);
        }
    </script>
</body>
</html>
