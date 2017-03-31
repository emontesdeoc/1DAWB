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
                CargarCursosDropdown();
                //contenedormodificar.Visible = false;
            }
        }

        #region VER ALUMNOS

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

                    nuevo_textbox_apellido_alumno.Text = valumno.APELLIDOS;
                    nuevo_textbox_codalu_alumno.Text = valumno.COD_ALU;
                    nuevo_textbox_nombre_alumno.Text = valumno.NOMBRE;
                    nuevo_textbox_DNI_alumno.Text = valumno.DNI;
                    CambioPestañas(2);
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

                }



            }
        }


        #endregion

        #region MODIFICAR ALUMNO

        #endregion

        #region NUEVO ALUMNO

        #endregion

        #region BORRAR ALUMNO

        #endregion

        #region CONTROL DE VISTA

        private void CargarCursosDropdown()
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {

                var vcursos = (from c in model.CURSOS
                               select new { value = c.COD_CUR, nombre = c.DESCRIPCION }).ToList();


                foreach (var c in vcursos)
                {
                    ListItem newcurso = new ListItem(c.nombre, c.value);
                    dropdown_cursos.Items.Add(newcurso);
                    dropdown_nuevo_alumno.Items.Add(newcurso);
                }
            }
        }

        private void CambioPestañas(int i)
        {

            switch (i)
            {
                case 1:
                    li_vercursos.Attributes.Add("class", "active");
                    li_nuevocursos.Attributes.Remove("class");
                    li_guardarcursos.Attributes.Remove("class");
                    li_borrarcursos.Attributes.Remove("class");

                    Vercursos.Attributes.Add("style", "display:inline");
                    Nuevocurso.Attributes.Remove("style");
                    Guardarcurso.Attributes.Remove("style");
                    Borrarcurso.Attributes.Remove("style");

                    break;
                case 2:
                    li_nuevocursos.Attributes.Add("class", "active");
                    li_vercursos.Attributes.Remove("class");
                    li_guardarcursos.Attributes.Remove("class");
                    li_borrarcursos.Attributes.Remove("class");

                    Nuevocurso.Attributes.Add("style", "display:inline");
                    Vercursos.Attributes.Remove("style");
                    Guardarcurso.Attributes.Remove("style");
                    Borrarcurso.Attributes.Remove("style");
                    break;
                case 3:
                    li_guardarcursos.Attributes.Add("class", "active");
                    li_nuevocursos.Attributes.Remove("class");
                    li_vercursos.Attributes.Remove("class");
                    li_borrarcursos.Attributes.Remove("class");

                    Guardarcurso.Attributes.Add("style", "display:inline");
                    Vercursos.Attributes.Remove("style");
                    Nuevocurso.Attributes.Remove("style");
                    Borrarcurso.Attributes.Remove("style");
                    break;
                case 4:
                    li_borrarcursos.Attributes.Add("class", "active");
                    li_nuevocursos.Attributes.Remove("class");
                    li_guardarcursos.Attributes.Remove("class");
                    li_vercursos.Attributes.Remove("class");

                    Borrarcurso.Attributes.Add("style", "display:inline");
                    Nuevocurso.Attributes.Remove("style");
                    Guardarcurso.Attributes.Remove("style");
                    Vercursos.Attributes.Remove("style");
                    break;

                default:
                    break;
            }
        }


        #endregion

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

        protected void nuevo_btn_alumno_Click(object sender, EventArgs e)
        {

        }
    }
}