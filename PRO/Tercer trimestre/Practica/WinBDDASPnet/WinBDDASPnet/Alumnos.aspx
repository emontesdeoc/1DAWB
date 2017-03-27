<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alumnos.aspx.cs" Inherits="WinBDDASPnet.Alumnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList runat="server" ID="testdropdown" OnSelectedIndexChanged="testdropdown_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

            <asp:GridView runat="server" ID="testgridview"></asp:GridView>
        </div>
    </form>
</body>
</html>
