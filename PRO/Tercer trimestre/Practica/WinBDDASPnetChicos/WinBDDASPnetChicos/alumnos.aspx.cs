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
            CambioPestañas(1);
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
                    modificar_textbox_apellido.Text = valumno.APELLIDOS;
                    modificar_textbox_codalu.Text = valumno.COD_ALU;
                    modificar_textbox_nombre.Text = valumno.NOMBRE;
                    modificar_textbox_DNI.Text = valumno.DNI;
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


        protected void btn_modificaralumno_Click(object sender, EventArgs e)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                foreach (var c in model.ALUMNOS.ToList())
                {
                    if (c.COD_ALU == modificar_textbox_codalu.Text)
                    {
                        c.DNI = modificar_textbox_DNI.Text;
                        c.APELLIDOS = modificar_textbox_apellido.Text;
                        c.NOMBRE = modificar_textbox_nombre.Text;
                    }
                }
                model.SaveChanges();
                //contenedormodificar.Visible = false;
            }
        }


        #endregion

        #region NUEVO ALUMNO

        protected void btn_nuevoalumno_Click(object sender, EventArgs e)
        {

            using (ModelOcupacional model = new ModelOcupacional())
            {
                ALUMNOS newalumno = new ALUMNOS()
                {
                    APELLIDOS = nuevo_textbox_apellido.Text,
                    NOMBRE = nuevo_textbox_nombre.Text,
                    DNI = nuevo_textbox_dni.Text,
                    COD_CUR = dropdown_nuevo_alumno.SelectedValue.ToString(),
                    COD_ALU = nuevo_textbox_codalu.Text
                };
                model.ALUMNOS.Add(newalumno);
            }

        }

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

        protected void nuevo_btn_alumno_Click(object sender, EventArgs e)
        {

        }

        protected void modificar_btn_alumno_Click(object sender, EventArgs e)
        {

        }
    }
}