using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WinBDDASPnet
{
    public partial class Alumnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (ModelOcupacional model = new ModelOcupacional())
                {

                    var vcursos = from p in model.CURSOS
                                  select new { codcur = p.COD_CUR, desc = p.DESCRIPCION };

                    foreach (var v in vcursos)
                    {
                        ListItem litem = new ListItem(v.desc, v.codcur);
                        testdropdown.Items.Add(litem);
                    }
                }
            }
        }
        protected void testdropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {

                var valumnos = from p in model.ALUMNOS
                               where p.COD_CUR == testdropdown.SelectedValue.ToString()
                               select p;

                testgridview.DataSource = valumnos.ToList();
                testgridview.DataBind();

            }
        }
    }
}