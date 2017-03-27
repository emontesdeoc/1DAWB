<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebASP01.WebForm1" %>

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
         <asp:RequiredFieldValidator ID="ValorRequerido" runat="server" ControlToValidate="tbxCurso"  Display="Dynamic"  EnableClientScript="false"  ErrorMessage="El Curso es obligatorio" />
       </p>
       <p> 
         <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
        </p>
        <asp:Button ID="btnCurso" runat="server" Text="Enviar" OnClick="btnCurso_Click" />  
    </div>
    </form>
</body>
</html>
