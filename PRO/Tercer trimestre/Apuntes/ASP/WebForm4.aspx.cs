using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCurso_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "Hola";
        }

        protected void ddlist1_SelectedIndexChanged(object sender, EventArgs e)
        {
            tbxCurso.Text = ddlist1.SelectedItem.Text;
        }

        protected void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            tbxCurso.Text = listBox1.SelectedItem.Text;
        }
    }
}