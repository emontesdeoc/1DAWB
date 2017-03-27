    <%@ Page Language="VB" %>

    <script runat="server">
       Sub Enviar(obj as object, e as eventargs)
          If Page.IsValid then
             lblMensaje.Text = "�Correcto!"
          Else
             lblMensaje.Text = "Alguno de los campos no es v�lido."
          End if
       End sub
    </script>

    <html><body>
       <form runat="server">
          <asp:Label id="lblEncabezado" runat="server"
             Height="25px" Width="100%" BackColor="#ddaa66"
             ForeColor="white" Font-Bold="true"
             Text="Un ejemplo de validaci�n" />
          <asp:Label id="lblMensaje" runat="server" /><br>
          <asp:Panel id="Panel1" runat="server">
          <asp:ValidationSummary runat="server"
             DisplayMode="BulletList" />
             <table>
             <tr>
                <td width="100" valign="top">
                   Nombre y apellidos:
                </td>
                <td width="300" valign="top">
                   <asp:TextBox id="tbNombre" runat="server" />
                   <asp:TextBox id="tbApellidos" runat="server" /><br>
                   <asp:RequiredFieldValidator runat="server"
                      ControlToValidate="tbNombre"
                      ErrorMessage="Se necesita el nombre"
		      Display="dynamic" />

                   <asp:RequiredFieldValidator runat="server"
                      ControlToValidate="tbApellidos"
                      ErrorMessage="Se necesitan los apellidos"
                      Display="dynamic" />
                   <asp:CompareValidator runat="server"
                      ControlToValidate="tbNombre"
                      ControlToCompare="tbApellidos"
                      Type="String"
                      Operator="NotEqual"
                      ErrorMessage="El nombre y los apellidos no pueden ser iguales" 
                      Display="dynamic" />
                </td>
             </tr>
             <tr>
                <td valign="top">Correo electr�nico (s�lo .com):</td>
                <td valign="top">
                   <asp:TextBox id="tbCorreoE"
                      runat="server" /><br>
                   <asp:RegularExpressionValidator
                      runat="server"
                      ControlToValidate="tbCorreoE"
                      ValidationExpression="\w+\@\w+\.com"
                      ErrorMessage="No es un correo electr�nico correcto" 
                      Display="dynamic" />
                </td>
             </tr>
             <tr>
                <td valign="top">Domicilio:</td>
                <td valign="top">
                   <asp:TextBox id="tbDomicilio"
                      runat="server" />
                </td>
             </tr>
             <tr>
                <td valign="top">Ciudad, Estado y C�digo postal (5 cifras):</td>
                <td valign="top">
                   <asp:TextBox id="tbCiudad"
                      runat="server" />,
                   <asp:TextBox id="tbEstado" runat="server"
                      size=2 />&nbsp;
                   <asp:TextBox id="tbZonaPostal" runat="server"
                      size=5 /><br>
                   <asp:RegularExpressionValidator
                      runat="server"
                      ControlToValidate="tbZonaPostal"
                      ValidationExpression="[0-9]{5}"
                      ErrorMessage="No es un c�digo postal correcto" 
                      Display="dynamic" />
                   <br>
                   <asp:RangeValidator runat="server"
                      ControlToValidate="tbZonaPostal"
                      MinimumValue="00000" MaximumValue="22222"
                      Type="String"
                      ErrorMessage="No se encuentra en la regi�n adecuada" 
                      Display="dynamic" />
                </td>
             </tr>
             <tr>
                <td valign="top">Tel�fono (<i>xxxx-xxxx</i>):</td>
                <td valign="top">
                   <asp:TextBox id="tbTelefono" runat="server"
                      size=11 /><br>
                   <asp:RegularExpressionValidator
                      runat="server"
                      ControlToValidate="tbTelefono"
                      ValidationExpression="[0-9]{4}-[0-9]{4}"
                      ErrorMessage="No es un n�mero telef�nico correcto" 
                      Display="dynamic" />
                </td>
             </tr>
             <tr>
                <td colspan="2" valign="top" align="right">
                   <asp:Button id="btEnviar" runat="server"
                      text="Agregar" 
                      OnClick="Enviar" />
                </td>
             </tr>
             </table>
          </asp:Panel>
       </form>
    </body></html>