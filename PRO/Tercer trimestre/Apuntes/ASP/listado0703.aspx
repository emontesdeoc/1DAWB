    <%@ Page Language="VB" %>

    <script runat="server">
       Sub Enviar(obj as object, e as eventargs)
          If Page.IsValid then
             lblMensaje.Text = "¡Ha pasado la validación!"
          End If
       End Sub
    </script>

    <html><body>
       <form runat="server">
          <asp:Label id="lblMensaje" runat="server" /><p>

          Teclee su nombre:
          <asp:TextBox id="tbNombre" runat="server" /><br>
          <asp:RequiredFieldValidator runat="server"
             ControlToValidate="tbNombre"
             ErrorMessage="Se necesita su nombre."/><p>

          <asp:Button id="tbEnviar" runat="server"
             Text="Enviar"
             OnClick="Enviar" />
       </form>
    </body></html>
