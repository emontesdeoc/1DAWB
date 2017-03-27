using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP00
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCurso.Text = "";
        }

        protected void btnCurso_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
                lblCurso.Text = "Controles validados correctamente";
        }
    }
}