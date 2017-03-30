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
                            <asp:Button ID="btn_ModificarAlumno" runat="server" CausesValidation="false" CommandName="Modificar"
                                Text="Modificar" CommandArgument='<%# Eval("COD_ALU") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btn_BorrarAlumno" runat="server" CausesValidation="false" CommandName="Borrar"
                                Text="Borrar" CommandArgument='<%# Eval("COD_ALU") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>



            <div runat="server" id="DivModificarAlumno">

                <asp:Label runat="server" ID="labelCodAlu" Text="Cod_Alu"></asp:Label>
                <asp:TextBox runat="server" ID="textboxCodAlu" Enabled="false"></asp:TextBox>
                <br />
                <br />
                <asp:Label runat="server" ID="labelCodCur" Text="Cod_Cur"></asp:Label>
                <asp:TextBox runat="server" ID="textboxCodCur" Enabled="false"></asp:TextBox>
                <br />
                <br />
                <asp:Label runat="server" ID="labelDNI" Text="DNI"></asp:Label>
                <asp:TextBox runat="server" ID="textboxDNI" E></asp:TextBox>
                <br />
                <br />

                <asp:Label runat="server" ID="labelApellidos" Text="Apellidos"></asp:Label>
                <asp:TextBox runat="server" ID="textboxApellidos"></asp:TextBox>
                <br />
                <br />
                <asp:Label runat="server" ID="labelNombre" Text="Nombre"></asp:Label>
                <asp:TextBox runat="server" ID="textboxNombre"></asp:TextBox>
                <br />
                <br />

                <asp:Button ID="btn_BorrarAlumno_confirmar" runat="server" CausesValidation="false" OnClick="btn_BorrarAlumno_confirmar_Click" CommandName="Borrar"
                    Text="Borrar" CommandArgument='<%# Eval("COD_ALU") %>' />

                <asp:Button ID="btn_ModificarAlumno_confirmar" runat="server" CausesValidation="false" OnClick="btn_ModificarAlumno_confirmar_Click" CommandName="Modificar"
                    Text="Modificar" CommandArgument='<%# Eval("COD_ALU") %>' />

            </div>
        </div>
    </form>
</body>
</html>
