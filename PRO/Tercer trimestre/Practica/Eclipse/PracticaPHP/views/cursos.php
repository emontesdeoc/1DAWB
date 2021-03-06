﻿<!DOCTYPE html>
<html>
<head>
<title>PHP - Cursos</title>
<meta charset="UTF-8">
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-theme.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<?php
session_start();

if(isset($_SESSION['skip'])) {
	$skip = (int)$_SESSION ['skip'];	
}else {
	$skip = 0;
}

if (isset ( $_POST ["cambiocur"] )) {
	switch ($_POST ["cambiocur"]) {
		case "|<" :
			$skip = 0;
			break;
		case "<<" :
				$skip--;
			break;
		case ">>" :
			$skip++;
			break;
		case ">|" :
			$skip = 10000;
			break;
	}
}

$mysqli2 = new mysqli ( "localhost", "root", "", "ocupacional" );
$mysqli2->set_charset ( "utf8" );
$result2 = $mysqli2->query ( "select * from cursos" );
$rowCount = $result2->num_rows;

if($skip < 0){
	$_SESSION['skip'] = 0;
	$skip = 0;
	
}else 
{
	$_SESSION['skip'] = $skip;
	$skip = (int)$skip;
}
if((int)$skip > (int)$rowCount -1)
{
	$_SESSION['skip'] = $rowCount -1;
	$skip = (int)$rowCount -1;
}

$mysqli = new mysqli ( "localhost", "root", "", "ocupacional" );
$mysqli->set_charset ( "utf8" );
$result = $mysqli->query ( "select * from cursos limit $skip,1" );

$row = $result->fetch_row();

?>
	<div class="container">
		<div class="header clearfix">
			<nav>
				<ul class="nav nav-pills pull-right">
					<li role="presentation" class="active"><a href="cursos.php">Cursos</a></li>
					<li role="presentation"><a href="alumnos.php">Alumnos</a></li>
					<li role="presentation"><a href="notas.php">Notas</a></li>
				</ul>
			</nav>
			<h3 class="text-muted">
				<a href="../index.html"> WinBDD PHP </a>
			</h3>
		</div>


		<!--  @* Cursos contenedor *@ -->
		<div id="form-container">

				<div class="form-group">
					<label for="cod_cur">Codigo de curso</label> <input type="text"
						class="form-control" id="cod_cur" placeholder="Codigo de curso"
						value="<?php print(htmlspecialchars($row[0])) ?>" readonly>
				</div>
				<div class="form-group">
					<label for="descripcion">Descripcion</label> <input type="text"
						class="form-control" id="descripcion" placeholder="Descripcion"
						value="<?php print(htmlspecialchars($row[1])) ?>" readonly>
				</div>
				<div class="form-group">
					<label for="horas">Horas</label> <input type="text"
						class="form-control" id="horas" placeholder="Horas"
						value="<?php print(htmlspecialchars($row[2])) ?>" readonly>
				</div>
				<div class="form-group">
					<label for="tutor">Tutor</label> <input type="text"
						class="form-control" id="tutor" placeholder="Tutor"
						value="<?php print(htmlspecialchars($row[3])) ?>" readonly>
				</div>
				<form action="cursos.php" method="post">
				<div class="text-center">
					<div class="form-group btn-group ">
						<input type="submit" class="btn btn-default" name="cambiocur" value="|<" />
						<input type="submit" class="btn btn-default" name="cambiocur" value="<<" />
						<input type="submit" class="btn btn-default" name="cambiocur" value=">>" />
						<input type="submit" class="btn btn-default" name="cambiocur" value=">|" />
					</div>
				</div>
				</form>
			
			<div class="text-center">
				<div class="btn-group" style="text-align: center;">
					<!-- Small modal -->
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target=".bs-nuevo-modal-sm">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						Nuevo
					</button>
					<button type="submit" class="btn btn-warning" data-toggle="modal"
						data-target=".bs-modificar-modal-sm">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
						Modificar
					</button>
					<button type="submit" class="btn btn-danger" data-toggle="modal"
						data-target=".bs-borrar-modal-sm">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						Borrar
					</button>
				</div>
			</div>
		</div>

		<!--  @* Modal nuevo curso *@ -->
		<div class="modal fade bs-nuevo-modal-sm" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="text-center">
						<h2>Nuevo curso</h2>
					</div>
					<div id="modal-form-container">
						<form method="post" action="../controllers/curso_nuevo.php">
							<div class="form-group">
								<label for="cod_cur">Codigo de curso</label> <input type="text"
									class="form-control" id="nuevo_cod_cur" placeholder="Codigo de curso"
									name="nuevo_codcur">
							</div>
							<div class="form-group">
								<label for="descripcion">Descripcion</label> <input type="text"
									class="form-control" id="descripcion" placeholder="Descripcion"
									name="nuevo_descripcion">
							</div>
							<div class="form-group">
								<label for="horas">Horas</label> <input type="text"
									class="form-control" id="horas" placeholder="Horas"
									name="nuevo_horas">
							</div>
							<div class="form-group">
								<label for="tutor">Tutor</label> <input type="text"
									class="form-control" id="tutor" placeholder="Tutor"
									name="nuevo_tutor">
							</div>
							<div class="text-center">
								<div class="form-group btn-group" style="margin-bottom: -15px;">
									<button type="submit" class="btn btn-success"
										name="nuevo_confirmar">
										<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
										Confirmar
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- @* Modal modificar curso *@ -->
		<div class="modal fade bs-modificar-modal-sm" tabindex="-1"
			role="dialog" aria-labelledby="mySmallModalLabel">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="text-center">
						<h2>Modificar curso</h2>
					</div>
					<div id="modal-form-container">
						<form method="post" action="../controllers/curso_modificar.php">
							<div class="form-group">
								<label for="cod_cur">Codigo de curso</label> <input type="text"
									class="form-control" name="modificar_cod_cur"
									placeholder="Codigo de curso" value="<?php print(htmlspecialchars($row[0])) ?>" readonly>
							</div>
							<div class="form-group">
								<label for="descripcion">Descripcion</label> <input type="text"
									class="form-control" name="modificar_descripcion"
									placeholder="Descripcion" value="<?php print(htmlspecialchars($row[1])) ?>">
							</div>
							<div class="form-group">
								<label for="horas">Horas</label> <input type="text"
									class="form-control" name="modificar_horas" placeholder="Horas"
									value="<?php print(htmlspecialchars($row[2])) ?>">
							</div>
							<div class="form-group">
								<label for="tutor">Tutor</label> <input type="text"
									class="form-control" name="modificar_tutor" placeholder="Tutor"
									value="<?php print(htmlspecialchars($row[3])) ?>">
							</div>
							<div class="text-center">
								<div class="form-group btn-group" style="margin-bottom: -15px;">
									<button type="submit" class="btn btn-success"
										name="modificar_curso">
										<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
										Confirmar
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- @* Modal borrar curso *@ -->
		<div class="modal fade bs-borrar-modal-sm" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="text-center">
						<h2>Borrar curso</h2>
					</div>
					<div id="modal-form-container">
						<form method="post" action="../controllers/curso_borrar.php">
							<div class="form-group">
								<label for="cod_cur">Codigo de curso</label> <input type="text"
									class="form-control" name="eliminar_cod_cur"
									placeholder="Codigo de curso" value="<?php print(htmlspecialchars($row[0])) ?>" readonly>
							</div>
							<div class="form-group">
								<label for="descripcion">Descripcion</label> <input type="text"
									class="form-control" id="descripcion" placeholder="Descripcion"
									value="<?php print(htmlspecialchars($row[1])) ?>" readonly>
							</div>
							<div class="form-group">
								<label for="horas">Horas</label> <input type="text"
									class="form-control" id="horas" placeholder="Horas"
									value="<?php print(htmlspecialchars($row[2])) ?>" readonly>
							</div>
							<div class="form-group">
								<label for="tutor">Tutor</label> <input type="text"
									class="form-control" id="tutor" placeholder="Tutor"
									value="<?php print(htmlspecialchars($row[3])) ?>" readonly>
							</div>
							<div class="text-center">
								<div class="form-group btn-group" style="margin-bottom: -15px;">
									<button type="submit" name="eliminar_curso"
										class="btn btn-danger">
										<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
										Confirmar
									</button>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>

		<footer class="footer">
			<p style="text-align: center">&copy; Emiliano Montesdeoca del Puerto
				- 1DAWB - PRO.</p>
		</footer>
	</div>
	<!-- /container -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="assets/js/bootstrap.js"></script>
</body>
</html>
