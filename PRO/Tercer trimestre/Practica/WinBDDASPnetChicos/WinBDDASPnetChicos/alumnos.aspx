<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alumnos.aspx.cs" Inherits="WinBDDASPnetChicos.alumnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Alumnos</title>
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
        <li><a class="waves-effect" href="~/cursos.aspx">Cursos</a></li>
        <li><a class="waves-effect" href="~/alumnos.aspx">Alumnos</a></li>
        <li><a class="waves-effect" href="#">Notas</a></li>
    </ul>

    <form id="form1" runat="server">
        <div class="container" style="width: 50%">

            <h1 style="text-align: center; color: white;">Alumnos</h1>
            <div style="text-align: center;">
                <a href="#" data-activates="slide-out" class="waves-effect waves-light btn button-collapse">Menu</a>
            </div>
            <br />
            <br />
            <div class="row">
                <div class="col s12">
                    <ul class="tabs">
                        <li class="tab col s3"><a href="#Vercursos" runat="server" id="li_vercursos">Ver alumnos</a></li>
                        <li class="tab col s3"><a href="#Nuevocurso" runat="server" id="li_guardarcursos">Nuevo alumno</a></li>
                        <li class="tab col s3"><a href="#Guardarcurso" runat="server" id="li_nuevocursos">Modificar alumno</a></li>
                        <li class="tab col s3"><a href="#Borrarcurso" runat="server" id="li_borrarcursos">Borrar curso</a></li>
                    </ul>
                </div>
                <div id="Vercursos" runat="server" class="col s12">
                    <div id="containercursos">
                        <div class="form-group input-field select">
                            <label>Seleccione el curso</label>
                            <br />
                            <br />
                            <asp:DropDownList runat="server" ID="dropdown_cursos" CssClass="select" AutoPostBack="true" OnSelectedIndexChanged="dropdown_cursos_SelectedIndexChanged"></asp:DropDownList>
                            <br />
                        </div>

                        <asp:GridView runat="server" ID="gridview_alumnos" DataKeyNames="COD_ALU" OnRowCommand="gridview_alumnos_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="COD_CUR" HeaderText="Codigo curso" />
                                <asp:BoundField DataField="COD_ALU" HeaderText="Codigo alumno" />
                                <asp:BoundField DataField="DNI" HeaderText="DNI" />
                                <asp:BoundField DataField="APELLIDOS" HeaderText="Apellidos" />
                                <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" />

                                <asp:TemplateField HeaderText="Modificar">
                                    <ItemTemplate>
                                        <asp:Button ID="btn_ModificarAlumno" runat="server" CausesValidation="false" CommandName="Modificar"
                                            Text="Modificar" CommandArgument='<%# Eval("COD_ALU") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Borrar">
                                    <ItemTemplate>
                                        <asp:Button ID="btn_BorrarAlumno" runat="server" CausesValidation="false" CommandName="Borrar"
                                            Text="Borrar" CommandArgument='<%# Eval("COD_ALU") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
                <div id="Nuevocurso" runat="server" class="col s12">
                    <div id="containercursos">
                        <div runat="server" id="contenedormodificar">
                            <div class="form-group input-field select">
                                <label>Seleccione el curso</label>
                                <br />
                                <br />
                                <asp:DropDownList runat="server" ID="dropdown_nuevo_alumno" CssClass="select"></asp:DropDownList>
                                <br />
                            </div>
                            <asp:Label runat="server" ID="labelCodAlu" Text="Codigo alumno"></asp:Label>
                            <asp:TextBox runat="server" ID="TextBoxCodAlu"></asp:TextBox>
                            <br />
                            <asp:Label runat="server" ID="labelNewAlumnos" Text="Apellido"></asp:Label>
                            <asp:TextBox runat="server" ID="txtboxNewApellido"></asp:TextBox>
                            <br />
                            <asp:Button runat="server" ID="btn_modificaralumno" Text="modificar" OnClick="btn_modificaralumno_Click" />
                        </div>
                    </div>
                </div>
                <div id="Guardarcurso" runat="server" class="col s12">
                    <div id="containercursos">

                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="nuevo_textbox_codalu_alumno" CssClass="form-control validate"></asp:TextBox>
                            <label for="nuevo_textbox_codalu_alumno">Codigo de alumno</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="nuevo_textbox_nombre_alumno" CssClass="form-control validate"></asp:TextBox>
                            <label for="nuevo_textbox_nombre_alumno">Nombre</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="nuevo_textbox_apellido_alumno" CssClass="form-control validate"></asp:TextBox>
                            <label for="nuevo_textbox_apellido_alumno">Apellido</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="nuevo_textbox_DNI_alumno" CssClass="form-control validate"></asp:TextBox>
                            <label for="nuevo_textbox_DNI_alumno">DNI</label>
                        </div>
                        <div class="form-group" style="text-align: center;">
                            <asp:Button runat="server" ID="nuevo_btn_alumno" Text="Guardar" OnClick="nuevo_btn_alumno_Click" CssClass="waves-effect waves-light btn" />
                        </div>

                    </div>

                </div>
                <div id="Borrarcurso" runat="server" class="col s12">
                    <div id="containercursos">
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
