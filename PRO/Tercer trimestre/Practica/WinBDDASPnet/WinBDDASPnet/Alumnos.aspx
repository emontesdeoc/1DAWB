<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alumnos.aspx.cs" Inherits="WinBDDASPnet.Alumnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList runat="server" ID="testdropdown" OnSelectedIndexChanged="testdropdown_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

            <asp:GridView runat="server" ID="testgridview"></asp:GridView>

            <br />

            <asp:GridView ID="GridView1" runat="server" DataKeyNames="COD_ALU" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="COD_CUR" HeaderText="Codigo curso" />
                    <asp:BoundField DataField="COD_ALU" HeaderText="Codigo alumno" />
                    <asp:BoundField DataField="APELLIDOS" HeaderText="Apellido" />
                    <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="Modificar"
                                Text="Modificar" CommandArgument='<%# Eval("COD_ALU") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="Borrar"
                                Text="Borrar" CommandArgument='<%# Eval("COD_ALU") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
