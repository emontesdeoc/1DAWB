<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebAsp1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Prueba 1</title>

    <script runat="server">
        private void ControladorDeNombre(object obj, EventArgs e)
        {
            lblMensaje1.Text = tbNombre.Text + ", elija un color: ";
            lblMensaje2.Text = tbNombre.Text + ", elija otro color: ";
            
        }

        private void ControladorDeLista(object obj, EventArgs e)
        {
            string strColor="";
            ListBox lisaux = (ListBox)obj;
            switch (lisaux.SelectedItem.ToString())
            {
                case "Rojo":
                    strColor = "red";
                    break;
                case "Azul":
                    strColor = "blue";
                    break;
                case "Verde":
                    strColor = "green";
                    break;
                case "Blanco":
                    strColor = "white";
                    break;
            }
            lbColor.BackColor = System.Drawing.Color.FromName(strColor);
        }

        private void ControladorDeCombo(object obj, EventArgs e)
        {
            string strColor="";
            DropDownList ddlaux = (DropDownList)obj;
            switch (ddlaux.SelectedItem.ToString())
            {
                case "Rojo":
                    strColor = "red";
                    break;
                case "Azul":
                    strColor = "blue";
                    break;
                case "Verde":
                    strColor = "green";
                    break;
                case "Blanco":
                    strColor = "white";
                    break;
            }
            ddlaux.BackColor = System.Drawing.Color.FromName(strColor);
        }

    </script>


</head>


<body>
       <form id="form1" runat="server">
         <p>
          <asp:Label runat="server">Introduzca su nombre: &nbsp;</asp:Label>
          <asp:TextBox id="tbNombre" runat="server"
             OnTextChanged="ControladorDeNombre"
             AutoPostBack="true" />
         </p>
         <p>
          <asp:Label id="lblMensaje1" runat="server" /><br />
         </p>
         <p>
          <asp:ListBox id="lbColor" runat="server"
             OnSelectedIndexChanged="ControladorDeLista"
             AutoPostBack="true" >
             <asp:Listitem>Rojo</asp:Listitem>
             <asp:Listitem>Azul</asp:Listitem>
             <asp:Listitem>Verde</asp:Listitem>
             <asp:Listitem>Blanco</asp:Listitem>
          </asp:ListBox> 
          </p><br /><br />
          <p>
          <asp:Label id="lblMensaje2" runat="server" /> <br />
          </p>
          <p>
          <asp:DropDownList ID="ddlColor" runat="server"
             OnSelectedIndexChanged="ControladorDeCombo"
             Height="50px" 
             AutoPostBack="true" >
             <asp:Listitem>Rojo</asp:Listitem>
             <asp:Listitem>Azul</asp:Listitem>
             <asp:Listitem>Verde</asp:Listitem>
             <asp:Listitem>Blanco</asp:Listitem>
           </asp:DropDownList>
          </p>
       </form>
    </body></html>

