<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebASP00.WebForm1" %>

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
         <asp:RequiredFieldValidator ID="ValorRequerido" runat="server" ControlToValidate="tbxCurso"  EnableClientScript="false" ErrorMessage="El Curso es obligatorio" />
         <asp:RegularExpressionValidator ID="revalida1" runat="server" 
              ControlToValidate="tbxCurso" 
              ErrorMessage="Formato no válido del código del curso" 
              EnableClientScript="false" 
              ValidationExpression ="[A-Z]{3}[1-2]{1}[A-Z]{1}">              
         </asp:RegularExpressionValidator>
        </p>
        <p> 
         <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label> <br />
        </p>
        <asp:Button ID="btnCurso" runat="server" Text="Enviar" OnClick="btnCurso_Click" />

    </div>
    </form>
</body>
</html>
