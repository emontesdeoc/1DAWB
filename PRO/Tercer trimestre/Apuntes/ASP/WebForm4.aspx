<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="WebForm1.aspx.cs" Inherits="WebASP2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <p>
        <asp:Label ID="lblCurso" runat="server">Curso:</asp:Label>
        <asp:TextBox ID="tbxCurso" runat ="server" ></asp:TextBox>
          <br />
        <asp:DropDownList ID="ddlist1" runat="server" OnSelectedIndexChanged="ddlist1_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem>DAW1A</asp:ListItem>
            <asp:ListItem>DAW1B</asp:ListItem>
            <asp:ListItem>DAM1A</asp:ListItem>
            <asp:ListItem>DAM1B</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:ListBox ID="listBox1" runat="server" OnSelectedIndexChanged="listBox1_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem>DAW1A</asp:ListItem>
            <asp:ListItem>DAW1B</asp:ListItem>
            <asp:ListItem>DAM1A</asp:ListItem>
            <asp:ListItem>DAM1B</asp:ListItem>
        </asp:ListBox>
        <asp:Table ID="table1" BorderStyle="Solid" runat="server" BorderWidth="2px">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Curso</asp:TableHeaderCell>
                <asp:TableHeaderCell>Descripción</asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow BorderStyle="Solid" BorderWidth="2px">
                <asp:TableCell>DAW1A</asp:TableCell>
                <asp:TableCell>1º DESARROLLO APLICACIONES WEB A</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow BorderStyle="Solid" BorderWidth="2px">
                <asp:TableCell>DAW1B</asp:TableCell>
                <asp:TableCell>1º DESARROLLO APLICACIONES WEB B</asp:TableCell>
            </asp:TableRow>
            <asp:TableFooterRow>
                <asp:TableCell ColumnSpan="2">PIE DE TABLA</asp:TableCell>
            </asp:TableFooterRow>
        </asp:Table>
      </p>
      <p>
        <asp:Label ID="lblMensaje" runat="server" Text=" "></asp:Label>
      </p>
      <p>
        <asp:Button ID="btnCurso" runat="server" Text="Enviar" OnClick="btnCurso_Click" />
      </p>
    </div>
    </form>
</body>
</html>
