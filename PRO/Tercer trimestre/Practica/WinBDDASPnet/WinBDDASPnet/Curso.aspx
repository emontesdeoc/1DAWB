<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Curso.aspx.cs" Inherits="WinBDDASPnet.Curso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            

            
            <asp:Label runat="server" ID="labelCodCur" Text="Cod_Cur"></asp:Label>
            <asp:TextBox runat="server" ID="textboxCodCur"></asp:TextBox>
            <br />
            <br />
            <asp:Label runat="server" ID="labelDescripcion" Text="Descripcion"></asp:Label>
            <asp:TextBox runat="server" ID="textboxDescripcion"></asp:TextBox>
            <br />
            <br />
            <asp:Label runat="server" ID="labelHoras" Text="Horas"></asp:Label>
            <asp:TextBox runat="server" ID="textboxHoras"></asp:TextBox>
            <br />
            <br />
            <asp:Label runat="server" ID="labelTutor" Text="Tutor"></asp:Label>
            <asp:TextBox runat="server" ID="textboxTutor"></asp:TextBox>
            <br />
            <br />
            <asp:Button runat="server" ID="btnPrimerCurso" Text="<<" OnClick="btnPrimerCurso_Click" />
            <asp:Button runat="server" ID="btnAnteriorCurso" Text="<" OnClick="btnAnteriorCurso_Click" />
            <asp:Button runat="server" ID="btnSiguienteCurso" Text=">" OnClick="btnSiguienteCurso_Click" />
            <asp:Button runat="server" ID="btnUltimoCurso" Text=">>" OnClick="btnUltimoCurso_Click" />
            <br />
            <br />
            <asp:Button runat="server" ID="btnGuardar" Text="Guardar curso" />


        </div>
    </form>
</body>
</html>
