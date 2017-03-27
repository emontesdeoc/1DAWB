using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebASPDataGrid
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRellena_Click(object sender, EventArgs e)
        {
            //string[,] tabla = { { "111", "Fernández", "Pepe" }, { "111", "Fernández", "Pepe" }, { "111", "Fernández", "Pepe" } };
            DataTable tabla = new DataTable();
            tabla.Columns.Add("DNI");
            tabla.Columns.Add("APELLIDOS");
            tabla.Columns.Add("NOMBRE");
            DataRow nueva = tabla.NewRow();
            nueva[0] = "111";
            nueva[1] = "Fernández";
            nueva[2] = "Pepe";
            tabla.Rows.Add(nueva);
            nueva = tabla.NewRow();
            nueva[0] = "222";
            nueva[1] = "López";
            nueva[2] = "Juan";
            tabla.Rows.Add(nueva);

            dgrid1.DataSource = tabla;
            dgrid1.DataBind();

            Grid1.DataSource = tabla;
            Grid1.DataBind();
        }
    }
}