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
        <li><a class="waves-effect" href="default.aspx">Inicio</a></li>
        <li><a class="waves-effect" href="cursos.aspx">Cursos</a></li>
        <li><a class="waves-effect" href="alumnos.aspx">Alumnos</a></li>
        <li><a class="waves-effect" href="notas.aspx">Notas</a></li>
    </ul>

    <form id="form1" runat="server">
        <div class="container" style="width: 60%">

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
                        <li class="tab col s3"><a href="#Borrarcurso" runat="server" id="li_borrarcursos">Borrar alumno</a></li>
                    </ul>
                </div>
                <%-- VER ALUMNOS --%>
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
                                        <asp:Button ID="btn_ModificarAlumno" CssClass="waves-effect waves-light btn" runat="server" CausesValidation="false" CommandName="Modificar"
                                            Text="Modificar" CommandArgument='<%# Eval("COD_ALU") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Borrar">
                                    <ItemTemplate>
                                        <asp:Button ID="btn_BorrarAlumno" CssClass="waves-effect waves-light btn" runat="server" CausesValidation="false" CommandName="Borrar"
                                            Text="Borrar" CommandArgument='<%# Eval("COD_ALU") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
                <%-- NUEVO ALUMNO --%>
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
                            <div class="form-group input-field select">
                                <asp:TextBox runat="server" ID="nuevo_textbox_codalu" MaxLength="10"></asp:TextBox>
                                <label for="nuevo_textbox_codalu">Codigo alumno</label>
                            </div>
                            <div class="form-group input-field ">
                                <asp:TextBox runat="server" ID="nuevo_textbox_dni" MaxLength="10"></asp:TextBox>
                                <label for="nuevo_textbox_dni">DNI</label>
                            </div>
                            <div class="form-group input-field ">
                                <asp:TextBox runat="server" ID="nuevo_textbox_apellido" MaxLength="30"></asp:TextBox>
                                <label for="nuevo_textbox_apellido">Apellido</label>
                            </div>
                            <div class="form-group input-field ">
                                <asp:TextBox runat="server" ID="nuevo_textbox_nombre" MaxLength="30"></asp:TextBox>
                                <label for="nuevo_textbox_nombre">Nombre</label>
                            </div>
                            <div class="form-group input-field" style="text-align: center;">
                                <asp:Button runat="server" ID="btn_nuevoalumno" Text="Crear" OnClick="btn_nuevoalumno_Click" CssClass="waves-effect waves-light btn" />
                            </div>
                        </div>
                    </div>
                </div>
                <%-- MODIFICAR ALUMNO --%>
                <div id="Guardarcurso" runat="server" class="col s12">
                    <div id="containercursos">

                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="modificar_textbox_codalu" MaxLength="10" CssClass="form-control validate" Enabled="false"></asp:TextBox>
                            <label for="modificar_textbox_codalu">Codigo alumno</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="modificar_textbox_nombre" MaxLength="30" CssClass="form-control validate"></asp:TextBox>
                            <label for="modificar_textbox_nombre">Nombre</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="modificar_textbox_apellido" MaxLength="30" CssClass="form-control validate"></asp:TextBox>
                            <label for="modificar_textbox_apellido">Apellido</label>
                        </div>
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="modificar_textbox_DNI" MaxLength="10" CssClass="form-control validate"></asp:TextBox>
                            <label for="modificar_textbox_DNI">DNI</label>
                        </div>
                        <div class="form-group" style="text-align: center;">
                            <asp:Button runat="server" ID="modificar_btn_alumno" Text="Guardar" OnClick="btn_modificaralumno_Click" CssClass="waves-effect waves-light btn" />
                        </div>

                    </div>

                </div>

                <%-- BORRAR ALUMNO --%>
                <div id="Borrarcurso" runat="server" class="col s12">
                    <div id="containercursos">
                        <div class="form-group input-field">
                            <asp:Label runat="server" ID="notification_nuevo"></asp:Label>
                        </div>
                        <br />
                        <div class="form-group input-field">
                            <asp:TextBox runat="server" ID="borrar_textbox_codalu" Enabled="false" MaxLength="10"></asp:TextBox>
                            <label for="borrar_textbox_codalu">Codigo alumno</label>
                        </div>
                        <div class="form-group input-field select">
                            <asp:TextBox runat="server" ID="borrar_textbox_codcur" Enabled="false" MaxLength="10"></asp:TextBox>
                            <label for="borrar_textbox_codcur">Codigo curso</label>
                        </div>
                        <div class="form-group input-field ">
                            <asp:TextBox runat="server" ID="borrar_textbox_dni" Enabled="false" MaxLength="10"></asp:TextBox>
                            <label for="borrar_textbox_dni">DNI</label>
                        </div>
                        <div class="form-group input-field ">
                            <asp:TextBox runat="server" ID="borrar_textbox_apellido" Enabled="false" MaxLength="30"></asp:TextBox>
                            <label for="borrar_textbox_apellido">Apellido</label>
                        </div>
                        <div class="form-group input-field ">
                            <asp:TextBox runat="server" ID="borrar_textbox_nombre" MaxLength="30" Enabled="false"></asp:TextBox>
                            <label for="borrar_textbox_nombre">Nombre</label>
                        </div>
                        <p>
                            <asp:CheckBox runat="server" ID="chkbox_borrar_alumno" />
                            <label for="chkbox_borrar_alumno">Confirmar para borrar el alumno</label>
                        </p>
                        <div class="form-group input-field" style="text-align: center;">
                            <asp:Button runat="server" ID="borrar_button" Text="Borrar" OnClick="borrar_button_Click" CssClass="waves-effect waves-light btn" />
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
