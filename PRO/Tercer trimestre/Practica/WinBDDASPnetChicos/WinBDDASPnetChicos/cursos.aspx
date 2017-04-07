<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cursos.aspx.cs" Inherits="WinBDDASPnetChicos.cursos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Cursos</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="assets/css/materialize.min.css" media="screen,projection" />
    <link type="text/css" rel="stylesheet" href="assets/css/style.css" media="screen,projection" />

</head>
<body>
    <ul id="slide-out" class="side-nav">
        <li>
            <div class="userView">
                <span class="black-text name" style="margin-bottom: 40px; font-size: 34px;">WinBDDASP.net</span>
            </div>
        </li>
        <li>
            <div class="divider"></div>
        </li>
        <li><a class="waves-effect" href="cursos.aspx">Cursos</a></li>
        <li><a class="waves-effect" href="alumnos.aspx">Alumnos</a></li>
        <li><a class="waves-effect" href="notas.aspx">Notas</a></li>
    </ul>

    <form id="form1" runat="server">
        <div class="container" style="width: 50%">

            <h1 style="text-align: center; color: white;">Cursos</h1>
            <div style="text-align: center;">
                <a href="#" data-activates="slide-out" class="waves-effect waves-light btn button-collapse">Menu</a>
            </div>
            <br />
            <br />
            <div class="row">
                <div class="col s12">
                    <ul class="tabs">
                        <li class="tab col s3"><a href="#Vercursos" runat="server" id="li_vercursos">Ver cursos</a></li>
                        <li class="tab col s3"><a href="#Nuevocurso" runat="server" id="li_nuevocursos">Nuevo curso</a></li>
                        <li class="tab col s3"><a href="#Guardarcurso" runat="server" id="li_guardarcursos">Modificar curso</a></li>
                        <li class="tab col s3"><a href="#Borrarcurso" runat="server" id="li_borrarcursos">Borrar curso</a></li>
                    </ul>
                </div>
                <div id="Vercursos" runat="server" class="col s12">
                    <div id="containercursos">
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="txtboxCodCur" CssClass="form-control validate"></asp:TextBox>
                            <label for="txtboxCodCur">Codigo curso</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="TextBoxDescripcion" CssClass="form-control validate"></asp:TextBox>
                            <label for="TextBoxDescripcion">Descripcion</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="TextBoxHoras" CssClass="form-control validate"></asp:TextBox>
                            <label for="TextBoxHoras">Horas</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="TextBoxTutor" CssClass="form-control validate"></asp:TextBox>
                            <label for="TextBoxTutor">Tutor</label>
                        </div>
                        <div class="form-group input-field" style="text-align: center;">
                            <asp:Button runat="server" ID="btn_primero" Text="Primero" OnClick="btn_primero_Click" CssClass="waves-effect waves-light btn" />
                            <asp:Button runat="server" ID="btn_anterior" Text="Anterior" OnClick="btn_anterior_Click" CssClass="waves-effect waves-light btn" />
                            <asp:Button runat="server" ID="btn_siguiente" Text="Siguiente" OnClick="btn_siguiente_Click" CssClass="waves-effect waves-light btn" />
                            <asp:Button runat="server" ID="btn_ultimo" Text="Ultimo" OnClick="btn_ultimo_Click" CssClass="waves-effect waves-light btn" />
                        </div>
                    </div>
                </div>
                <div id="Nuevocurso" runat="server" class="col s12">
                    <div id="containercursos">
                        <div class="form-group input-field">
                            <asp:Label runat="server" ID="notification_nuevo"></asp:Label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="nuevo_Textbox_codcur" CssClass="form-control validate"></asp:TextBox>
                            <label for="nuevo_Textbox_codcur">Codigo curso</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="nuevo_Textbox_descripcion" CssClass="form-control validate"></asp:TextBox>
                            <label for="nuevo_Textbox_descripcion">Descripcion</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="nuevo_Textbox_Horas" CssClass="form-control validate"></asp:TextBox>
                            <label for="nuevo_Textbox_Horas">Horas</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="nuevo_Textbox_Tutor" CssClass="form-control validate"></asp:TextBox>
                            <label for="nuevo_Textbox_Tutor">Tutor</label>
                        </div>
                        <div class="form-group input-field" style="text-align: center;">
                            <asp:Button runat="server" ID="btn_Guardar" Text="Guardar" OnClick="btn_Guardar_Click" CssClass="waves-effect waves-light btn" />
                            <asp:Button runat="server" ID="btn_Cancelar" Text="Cancelar" OnClick="btn_Cancelar_Click" CssClass="waves-effect waves-light btn" />
                        </div>
                    </div>
                </div>
                <div id="Guardarcurso" runat="server" class="col s12">
                    <div id="containercursos">
                        <div class="form-group input-field select">
                            <label>Seleccione el curso</label>
                            <br />
                            <br />
                            <asp:DropDownList runat="server" ID="dropdown_cursos_guardar" AutoPostBack="true" CssClass="select" OnSelectedIndexChanged="dropdown_cursos_guardar_SelectedIndexChanged">
                            </asp:DropDownList>
                            <br />
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="guardar_Textbox_codcur" CssClass="form-control validate"></asp:TextBox>
                            <label for="guardar_Textbox_codcur">Codigo curso</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="guardar_Textbox_descripcion" CssClass="form-control validate"></asp:TextBox>
                            <label for="guardar_Textbox_descripcion">Descripcion</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="guardar_Textbox_horas" CssClass="form-control validate"></asp:TextBox>
                            <label for="guardar_Textbox_horas">Horas</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="guardar_Textbox_tutor" CssClass="form-control validate"></asp:TextBox>
                            <label for="guardar_Textbox_tutor">Tutor</label>
                        </div>
                        <div class="form-group" style="text-align: center;">
                            <asp:Button runat="server" ID="guardar_btn_actualizar" Text="Actualizar" OnClick="guardar_btn_actualizar_Click" CssClass="waves-effect waves-light btn" />
                        </div>
                    </div>
                </div>
                <div id="Borrarcurso" runat="server" class="col s12">
                    <div id="containercursos">
                        <div class="form-group input-field">
                            <asp:Label runat="server" ID="notification_label_borrar"></asp:Label>
                        </div>
                        <div class="form-group input-field select">
                            <label>Seleccione el curso</label>
                            <br />
                            <br />
                            <asp:DropDownList runat="server" ID="dropdown_cursos_borrar" AutoPostBack="true" OnSelectedIndexChanged="dropdown_cursos_borrar_SelectedIndexChanged" CssClass="select"></asp:DropDownList>
                            <br />
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="borrar_Textbox_codcur" CssClass="form-control validate"></asp:TextBox>
                            <label for="txtboxCodCur">Codigo curso</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="borrar_Textbox_descripcion" CssClass="form-control validate"></asp:TextBox>
                            <label for="TextBoxDescripcion">Descripcion</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="borrar_Textbox_horas" CssClass="form-control validate"></asp:TextBox>
                            <label for="TextBoxHoras">Horas</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="borrar_Textbox_tutor" CssClass="form-control validate"></asp:TextBox>
                            <label for="TextBoxTutor">Tutor</label>
                        </div>
                        <p>
                            <asp:CheckBox runat="server" ID="chkbox_borrar_curso_asp" OnCheckedChanged="chkbox_borrar_curso_CheckedChanged" />
                            <label for="chkbox_borrar_curso_asp">Confirmar para borrar el curso</label>
                        </p>
                        <div class="form-group" style="text-align: center;">
                            <asp:Button runat="server" ID="borrar_btn_curso" Text="Borrar" OnClick="borrar_btn_curso_Click" CssClass="waves-effect waves-light btn" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="assets/js/materialize.min.js"></script>
    <script>

        $(".button-collapse").sideNav();

        $(document).ready(function () {
            $('ul.tabs').tabs();
        });

    </script>
</body>
</html>
