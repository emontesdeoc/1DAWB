using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WinBDDASPnetChicos
{
    public partial class alumnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                using (ModelOcupacional model = new ModelOcupacional())
                {

                    var vcursos = (from c in model.CURSOS
                                   select new { value = c.COD_CUR, nombre = c.DESCRIPCION }).ToList();


                    foreach (var c in vcursos)
                    {
                        ListItem newcurso = new ListItem(c.nombre, c.value);
                        dropdown_cursos.Items.Add(newcurso);
                    }
                    
                }
                contenedormodificar.Visible = false;
            }
        }

        protected void dropdown_cursos_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var valumnos = (from a in model.ALUMNOS
                                where a.COD_CUR == dropdown_cursos.SelectedValue.ToString()
                                select a).ToList();

                gridview_alumnos.AutoGenerateColumns = false;

                gridview_alumnos.DataSource = valumnos;
                gridview_alumnos.DataBind();
            }
        }

        protected void gridview_alumnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Modificar")
            {
                using (ModelOcupacional model = new ModelOcupacional())
                {
                    var valumno = (from a in model.ALUMNOS
                                   where a.COD_ALU == e.CommandArgument.ToString()
                                   select a).First();

                    txtboxNewApellido.Text = valumno.APELLIDOS.ToString();
                    TextBoxCodAlu.Text = valumno.COD_ALU.ToString();
                    contenedormodificar.Visible = true;
                }

            }
            if (e.CommandName == "Borrar")
            {
                using (ModelOcupacional model = new ModelOcupacional())
                {
                    var valumno = (from a in model.ALUMNOS
                                   where a.COD_ALU == e.CommandArgument.ToString()
                                   select a).First();

                    model.ALUMNOS.Remove(valumno);
                    model.SaveChanges();

                    ALUMNOS a2 = new ALUMNOS();
                    a2.COD_ALU = "alsdjaljksd";
                    model.ALUMNOS.Add(a2);
                    model.SaveChanges();
                }
                

                
            }
        }

        protected void btn_modificaralumno_Click(object sender, EventArgs e)
        {

            using (ModelOcupacional model = new ModelOcupacional())
            {
                var valumno = (from a in model.ALUMNOS
                               select a).ToList();

                foreach (var c in valumno)
                {
                    if (c.COD_ALU == TextBoxCodAlu.Text)
                    {
                        c.APELLIDOS = txtboxNewApellido.Text;
                    }
                }

                model.SaveChanges();
                contenedormodificar.Visible = false;
            }

        }
    }
}