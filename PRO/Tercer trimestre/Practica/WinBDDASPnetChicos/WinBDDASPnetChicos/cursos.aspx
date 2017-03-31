<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cursos.aspx.cs" Inherits="WinBDDASPnetChicos.cursos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="assets/css/materialize.min.css" media="screen,projection" />
    <link type="text/css" rel="stylesheet" href="assets/css/style.css" media="screen,projection" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="container" style="width: 50%">
            <div class="row" id="containercursos">
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
                    <asp:Button runat="server" ID="btn_primero" Text="<<" OnClick="btn_primero_Click" CssClass="waves-effect waves-light btn" />
                    <asp:Button runat="server" ID="btn_anterior" Text="<" OnClick="btn_anterior_Click" CssClass="waves-effect waves-light btn" />
                    <asp:Button runat="server" ID="btn_siguiente" Text=">" OnClick="btn_siguiente_Click" CssClass="waves-effect waves-light btn" />
                    <asp:Button runat="server" ID="btn_ultimo" Text=">>" OnClick="btn_ultimo_Click" CssClass="waves-effect waves-light btn" />
                </div>
                <br />
                <div class="form-group" style="text-align: center;">
                    <asp:Button runat="server" ID="btn_Nuevo" Text="Nuevo" OnClick="btn_Nuevo_Click" CssClass="waves-effect waves-light btn" />
                    <asp:Button runat="server" ID="btn_Guardar" Text="Guardar" OnClick="btn_Guardar_Click" CssClass="waves-effect waves-light btn" />
                    <asp:Button runat="server" ID="btn_Cancelar" Text="Cancelar" OnClick="btn_Cancelar_Click" CssClass="waves-effect waves-light btn" />
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="assets/js/materialize.min.js"></script>
</body>
</html>
