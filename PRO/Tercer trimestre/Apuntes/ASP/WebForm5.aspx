<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebASPDataGrid.WebForm1" %>

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
         <asp:Button ID="btnRellena" runat="server" Text="Rellena" OnClick="btnRellena_Click" /> <br />
        </p>
        <asp:DataGrid ID ="dgrid1" runat="server" AutoGenerateColumns = "False">
            <Columns>
                <asp:BoundColumn DataField="DNI" HeaderText="DNI"></asp:BoundColumn>
                <asp:BoundColumn DataField="APELLIDOS" HeaderText="APELLIDOS"></asp:BoundColumn>
                <asp:BoundColumn DataField="NOMBRE" HeaderText="NOMBRE"></asp:BoundColumn>
            </Columns>
        </asp:DataGrid>
        <asp:GridView ID ="Grid1" runat="server" AutoGenerateColumns = "False">
            <Columns>
                <asp:BoundField DataField="DNI" HeaderText="DNI" />
                <asp:BoundField DataField="APELLIDOS" HeaderText="APELLIDOS" />
                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" />
            </Columns>

        </asp:GridView>
    </div>
    </form>
</body>
</html>
