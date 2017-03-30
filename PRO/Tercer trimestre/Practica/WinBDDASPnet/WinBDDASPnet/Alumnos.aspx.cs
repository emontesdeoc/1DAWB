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
            DivModificarAlumno.Visible = false;
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

                GridView1.AutoGenerateColumns = false;
                GridView1.DataSource = valumnos.ToList();
                GridView1.DataBind();

            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            labelCodAlu.Text = e.CommandArgument.ToString();

            if (e.CommandName == "Modificar")
            {
                using (ModelOcupacional model = new ModelOcupacional())
                {

                    var valumnos = from p in model.ALUMNOS
                                   where p.COD_ALU == e.CommandArgument.ToString()
                                   select p;

                    textboxCodAlu.Text = valumnos.First().COD_ALU;
                    textboxCodCur.Text = valumnos.First().COD_CUR;
                    textboxDNI.Text = valumnos.First().DNI;
                    textboxApellidos.Text = valumnos.First().APELLIDOS;
                    textboxNombre.Text = valumnos.First().NOMBRE;

                    DivModificarAlumno.Visible = true;
                    btn_BorrarAlumno_confirmar.Visible = false;
                    btn_ModificarAlumno_confirmar.Visible = true;

                }
            }


            if (e.CommandName == "Borrar")
            {
                using (ModelOcupacional model = new ModelOcupacional())
                {

                    var valumnos = from p in model.ALUMNOS
                                   where p.COD_ALU == e.CommandArgument.ToString()
                                   select p;

                    textboxCodAlu.Text = valumnos.First().COD_ALU;
                    textboxCodCur.Text = valumnos.First().COD_CUR;
                    textboxDNI.Text = valumnos.First().DNI;
                    textboxApellidos.Text = valumnos.First().APELLIDOS;
                    textboxNombre.Text = valumnos.First().NOMBRE;

                    DivModificarAlumno.Visible = true;
                    btn_BorrarAlumno_confirmar.Visible = true;
                    btn_ModificarAlumno_confirmar.Visible = false;

                }
            }



        }

        protected void btn_BorrarAlumno_confirmar_Click(object sender, EventArgs e)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {

                var valumnos = from p in model.ALUMNOS
                               where p.COD_ALU == textboxCodAlu.Text
                               select p;

                model.ALUMNOS.Remove(valumnos.First());
                model.SaveChanges();

            }
        }

        protected void btn_ModificarAlumno_confirmar_Click(object sender, EventArgs e)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {

                var valumnos = (from p in model.ALUMNOS
                                where p.COD_ALU == textboxCodAlu.Text
                                select p).First();



                ALUMNO a = new ALUMNO() { APELLIDOS = textboxApellidos.Text, NOMBRE = textboxNombre.Text, DNI = textboxDNI.Text, COD_ALU = textboxCodAlu.Text, COD_CUR = textboxCodCur.Text };

                model.ALUMNOS.Remove(valumnos);

                model.ALUMNOS.Add(a);
                model.SaveChanges();

            }
        }
    }
}