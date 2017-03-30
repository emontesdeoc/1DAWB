<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alumnos.aspx.cs" Inherits="WinBDDASPnetChicos.alumnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:DropDownList runat="server" ID="dropdown_cursos" AutoPostBack="true" OnSelectedIndexChanged="dropdown_cursos_SelectedIndexChanged"></asp:DropDownList>

            <br />

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

            <div runat="server" id="contenedormodificar">
                <asp:Label runat="server" ID="labelCodAlu" Text="Codigo alumno"></asp:Label>
                <asp:TextBox runat="server" ID="TextBoxCodAlu"></asp:TextBox>
                <br />
                <asp:Label runat="server" ID="labelNewAlumnos" Text="Apellido"></asp:Label>
                <asp:TextBox runat="server" ID="txtboxNewApellido"></asp:TextBox>
                <br />
                <asp:Button runat="server" ID="btn_modificaralumno" Text="modificar" OnClick="btn_modificaralumno_Click" />
            </div>

        </div>
    </form>
</body>
</html>
