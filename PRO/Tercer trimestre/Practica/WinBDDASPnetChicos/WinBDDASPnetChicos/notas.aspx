<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notas.aspx.cs" Inherits="WinBDDASPnetChicos.notas" %>

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
        <div class="container" style="width: 60%">

            <h1 style="text-align: center; color: white;">Notas</h1>
            <div style="text-align: center;">
                <a href="#" data-activates="slide-out" class="waves-effect waves-light btn button-collapse">Menu</a>
            </div>
            <br />
            <br />
            <div class="row">
                <div class="col s12">
                    <ul class="tabs">
                        <li class="tab col s3"><a href="#Vercursos" runat="server" id="li_vercursos">Ver alumnos</a></li>
                        <li class="tab col s3"><a href="#Nuevocurso" runat="server" id="li_guardarcursos">Nueva nota</a></li>
                        <li class="tab col s3"><a href="#Guardarcurso" runat="server" id="li_nuevocursos">Modificar nota</a></li>
                        <li class="tab col s3"><a href="#Borrarcurso" runat="server" id="li_borrarcursos">Borrar nota</a></li>
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
                                <asp:BoundField DataField="COD_ALU" HeaderText="Codigo alumno" />
                                <asp:BoundField DataField="DNI" HeaderText="DNI" />
                                <asp:BoundField DataField="APELLIDOS" HeaderText="Apellidos" />
                                <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" />

                                <asp:TemplateField HeaderText="Nota">
                                    <ItemTemplate>
                                        <asp:Button ID="btn_VerNota" CssClass="waves-effect waves-light btn" runat="server" CausesValidation="false" CommandName="Ver"
                                            Text="Ver" CommandArgument='<%# Eval("COD_ALU") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Nota">
                                    <ItemTemplate>
                                        <asp:Button ID="btn_" CssClass="waves-effect waves-light btn" runat="server" CausesValidation="false" CommandName="Modificar"
                                            Text="Modificar" CommandArgument='<%# Eval("COD_ALU") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Nota">
                                    <ItemTemplate>
                                        <asp:Button ID="btn_BorrarNota" CssClass="waves-effect waves-light btn" runat="server" CausesValidation="false" CommandName="Borrar"
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
                    </div>
                </div>
                <%-- MODIFICAR ALUMNO --%>
                <div id="Guardarcurso" runat="server" class="col s12">
                    <div id="containercursos">
                    </div>

                </div>

                <%-- BORRAR ALUMNO --%>
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

