<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cursos.aspx.cs" Inherits="WinBDDASPnetChicos.cursos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label runat="server" ID="labelCodCur" Text="Codigo curso:"></asp:Label>
            <asp:TextBox runat="server" ID="txtboxCodCur"></asp:TextBox>
            <br />
            <asp:Label runat="server" ID="labelDescripcion" Text="Descripcion:"></asp:Label>
            <asp:TextBox runat="server" ID="TextBoxDescripcion"></asp:TextBox>
            <br />
            <asp:Label runat="server" ID="labelHoras" Text="Horas"></asp:Label>
            <asp:TextBox runat="server" ID="TextBoxHoras"></asp:TextBox>
            <br />
            <asp:Label runat="server" ID="labelTutor" Text="Tutor:"></asp:Label>
            <asp:TextBox runat="server" ID="TextBoxTutor"></asp:TextBox>
            <br />
            <asp:Button runat="server" ID="btn_primero" Text="<<" OnClick="btn_primero_Click" />
            <asp:Button runat="server" ID="btn_anterior" Text="<" OnClick="btn_anterior_Click" />
            <asp:Button runat="server" ID="btn_siguiente" Text=">" OnClick="btn_siguiente_Click" />
            <asp:Button runat="server" ID="btn_ultimo" Text=">>" OnClick="btn_ultimo_Click" />
        </div>
    </form>
</body>
</html>
