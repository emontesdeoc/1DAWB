using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WinBDDASPnetChicos
{
    public partial class notas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCursosDropdown();
            }
        }

        #region CONSEGUIR NOTAS

        private List<ALUMNOS> GetAllNotas()
        {

            using (ModelOcupacional model = new ModelOcupacional())
            {
                var vnotas = (from a in model.ALUMNOS
                              join vn in model.NOTAS on a.COD_ALU equals vn.COD_ALU
                              select a).ToList();
                return vnotas;
            }

        }

        private List<ALUMNOS> GetNotasPorCurso(string CODCUR)
        {

            using (ModelOcupacional model = new ModelOcupacional())
            {
                var vnotas = (from a in model.ALUMNOS
                              join vn in model.NOTAS on a.COD_ALU equals vn.COD_ALU
                              where a.COD_CUR == CODCUR
                              select a).ToList();

                return vnotas;
            }

        }

        private ALUMNOS GetNotasPorAlumnos(string CODALU)
        {

            using (ModelOcupacional model = new ModelOcupacional())
            {
                var vnotas = (from a in model.ALUMNOS
                              join vn in model.NOTAS on a.COD_ALU equals vn.COD_ALU
                              where a.COD_ALU == CODALU
                              select a).First();

                return vnotas;
            }

        }


        #endregion

        #region VER NOTAS

        protected void dropdown_cursos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dropdown_cursos.SelectedValue == "todos")
            {
                gridview_alumnos.AutoGenerateColumns = false;
                gridview_alumnos.DataSource = GetAllNotas();
                gridview_alumnos.DataBind();
            }
            if (dropdown_cursos.SelectedValue == "nada")
            {
            }
            else if (dropdown_cursos.SelectedValue != "todos" && dropdown_cursos.SelectedValue != "nada")
            {
                gridview_alumnos.AutoGenerateColumns = false;
                gridview_alumnos.DataSource = GetNotasPorCurso(dropdown_cursos.SelectedValue);
                gridview_alumnos.DataBind();
            }
            CambioPestañas(1);
        }

        protected void gridview_alumnos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Modificar")
            {
                var valumno = GetNotasPorAlumnos(e.CommandArgument.ToString());

                CambioPestañas(2);
            }
            if (e.CommandName == "Borrar")
            {
                var valumno = GetNotasPorAlumnos(e.CommandArgument.ToString());

                CambioPestañas(4);
            }
            if (e.CommandName == "Ver")
            {
                var valumno = GetNotasPorAlumnos(e.CommandArgument.ToString());

                CambioPestañas(1);
            }
        }


        #endregion

        #region NUEVA NOTA

        protected void btn_nuevanota_Click(object sender, EventArgs e)
        {

        }

        #endregion

        #region ACTUALIAR NOTA

        protected void btn_actualizar_Click(object sender, EventArgs e)
        {

        }

        #endregion

        #region BORRAR NOTA

        protected void btn_borrar_Click(object sender, EventArgs e)
        {

        }

        #endregion

        #region CONTROL DE VISTA

        private void CargarCursosDropdown()
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {

                var vcursos = (from c in model.CURSOS
                               select new { value = c.COD_CUR, nombre = c.DESCRIPCION }).ToList();

                ListItem nada = new ListItem("Seleccione un curso", "nada");
                dropdown_cursos.Items.Add(nada);
                foreach (var c in vcursos)
                {
                    ListItem newcurso = new ListItem(c.nombre, c.value);
                    dropdown_cursos.Items.Add(newcurso);
                }
                ListItem todos = new ListItem("TODOS", "todos");
                dropdown_cursos.Items.Add(todos);
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
            gridview_alumnos.DataBind();
            dropdown_cursos.SelectedIndex = 0;
        }


        #endregion






    }
}