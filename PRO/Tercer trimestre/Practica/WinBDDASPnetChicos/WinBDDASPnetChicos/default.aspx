<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WinBDDASPnetChicos._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>WinBDD ASP.net</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="assets/css/materialize.min.css" media="screen,projection" />
    <link type="text/css" rel="stylesheet" href="assets/css/style.css" media="screen,projection" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="margin-top: 200px;">

            <h1 style="text-align: center; color: white;">WinBDD ASP.net</h1>

            <h2 style="text-align: center; color: white; font-size: 1.56rem;">Emiliano Montesdeoca del Puerto</h2>
            <h3 style="text-align: center; color: white; font-size: 0.92rem;">1DAWB - Programación - CIFP Cesar Manrique</h3>
            <br />
            <div style="text-align: center;">
                <a href="cursos.aspx" data-activates="slide-out" class="waves-effect waves-light btn button-collapse">Cursos</a>
                <a href="alumnos.aspx" data-activates="slide-out" class="waves-effect waves-light btn button-collapse">Alumnos</a>
                <a href="notas.aspx" data-activates="slide-out" class="waves-effect waves-light btn button-collapse">Notas</a>
            </div>
        </div>
    </form>
</body>
</html>
