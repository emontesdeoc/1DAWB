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
        struct alumnoStrcut
        {
            public string codalu { get; set; }
            public string codcur { get; set; }
            public string dni { get; set; }
            public string apellido { get; set; }
            public string nombre { get; set; }
            public int nota1 { get; set; }
            public int nota2 { get; set; }
            public int nota3 { get; set; }
            public int media { get; set; }

        }


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

        private IQueryable GetNotasPorAlumnos(string CODALU)
        {

            using (ModelOcupacional model = new ModelOcupacional())
            {
                IQueryable vnotas = (from a in model.ALUMNOS
                                     join vn in model.NOTAS on a.COD_ALU equals vn.COD_ALU
                                     where a.COD_ALU == CODALU
                                     select new
                                     {
                                         codalu = a.COD_ALU,
                                         codcur = a.COD_CUR,
                                         nombre = a.NOMBRE,
                                         apellido = a.APELLIDOS,
                                         dni = a.DNI,
                                         nota1 = vn.NOTA1,
                                         nota2 = vn.NOTA2,
                                         nota3 = vn.NOTA3,
                                         media = vn.MEDIA
                                     }).AsQueryable();


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

            switch (e.CommandName)
            {
                case "Modificar":


                    using (ModelOcupacional model = new ModelOcupacional())
                    {
                        var vnotas = (from a in model.ALUMNOS
                                      join vn in model.NOTAS on a.COD_ALU equals vn.COD_ALU
                                      where a.COD_ALU == e.CommandArgument.ToString()
                                      select new { codalu = a.COD_ALU, codcur = a.COD_CUR, nombre = a.NOMBRE, apellido = a.APELLIDOS, dni = a.DNI, nota1 = vn.NOTA1, nota2 = vn.NOTA2, nota3 = vn.NOTA3, media = vn.MEDIA }).First();



                        modifcar_textbox_apellido.Text = vnotas.apellido;
                        modifcar_textbox_nombre.Text = vnotas.nombre;
                        modifcar_textbox_codalu.Text = vnotas.codalu;
                        modifcar_textbox_dni.Text = vnotas.dni;
                        modifcar_textbox_nota1.Text = vnotas.nota1.ToString();
                        modifcar_textbox_nota2.Text = vnotas.nota2.ToString();
                        modifcar_textbox_nota3.Text = vnotas.nota3.ToString();
                        modifcar_textbox_media.Text = vnotas.media.ToString();
                    }



                    CambioPestañas(2);
                    break;

                case "Borrar":




                    using (ModelOcupacional model = new ModelOcupacional())
                    {
                        var vnotas = (from a in model.ALUMNOS
                                      join vn in model.NOTAS on a.COD_ALU equals vn.COD_ALU
                                      where a.COD_ALU == e.CommandArgument.ToString()
                                      select new { codalu = a.COD_ALU, codcur = a.COD_CUR, nombre = a.NOMBRE, apellido = a.APELLIDOS, dni = a.DNI, nota1 = vn.NOTA1, nota2 = vn.NOTA2, nota3 = vn.NOTA3, media = vn.MEDIA }).First();

                        borrar_textbox_apellido.Text = vnotas.apellido;
                        borrar_textbox_nombre.Text = vnotas.nombre;
                        borrar_textbox_codalu.Text = vnotas.codalu;
                        borrar_textbox_dni.Text = vnotas.dni;
                        borrar_textbox_nota1.Text = vnotas.nota1.ToString();
                        borrar_textbox_nota2.Text = vnotas.nota2.ToString();
                        borrar_textbox_nota3.Text = vnotas.nota3.ToString();
                        borrar_textbox_media.Text = vnotas.media.ToString();
                    }


                    CambioPestañas(4);
                    break;

                case "Ver":

                    var vnotastest = GetNotasPorAlumnos("");
                    IQueryable test = GetNotasPorAlumnos("");



                    using (ModelOcupacional model = new ModelOcupacional())
                    {
                        var vnotas = (from a in model.ALUMNOS
                                      join vn in model.NOTAS on a.COD_ALU equals vn.COD_ALU
                                      where a.COD_ALU == e.CommandArgument.ToString()
                                      select new { codalu = a.COD_ALU, codcur = a.COD_CUR, nombre = a.NOMBRE, apellido = a.APELLIDOS, dni = a.DNI, nota1 = vn.NOTA1, nota2 = vn.NOTA2, nota3 = vn.NOTA3, media = vn.MEDIA }).First();

                        ver_textbox_apellido.Text = vnotas.apellido;
                        ver_textbox_nombre.Text = vnotas.nombre;
                        ver_textbox_codalu.Text = vnotas.codalu;
                        ver_textbox_dni.Text = vnotas.dni;
                        ver_textbox_nota1.Text = vnotas.nota1.ToString();
                        ver_textbox_nota2.Text = vnotas.nota2.ToString();
                        ver_textbox_nota3.Text = vnotas.nota3.ToString();
                        ver_textbox_media.Text = vnotas.media.ToString();
                    }

                    CambioPestañas(5);
                    break;
                default:

                    break;
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
                    li_vernota.Attributes.Remove("class");

                    Vercursos.Attributes.Add("style", "display:inline");
                    Nuevocurso.Attributes.Remove("style");
                    Guardarcurso.Attributes.Remove("style");
                    Borrarcurso.Attributes.Remove("style");
                    Vernota.Attributes.Remove("style");

                    break;
                case 2:
                    li_nuevocursos.Attributes.Add("class", "active");
                    li_vercursos.Attributes.Remove("class");
                    li_guardarcursos.Attributes.Remove("class");
                    li_borrarcursos.Attributes.Remove("class");
                    li_vernota.Attributes.Remove("class");

                    Nuevocurso.Attributes.Add("style", "display:inline");
                    Vercursos.Attributes.Remove("style");
                    Guardarcurso.Attributes.Remove("style");
                    Borrarcurso.Attributes.Remove("style");
                    Vernota.Attributes.Remove("style");
                    break;
                case 3:
                    li_guardarcursos.Attributes.Add("class", "active");
                    li_nuevocursos.Attributes.Remove("class");
                    li_vercursos.Attributes.Remove("class");
                    li_borrarcursos.Attributes.Remove("class");
                    li_vernota.Attributes.Remove("class");

                    Guardarcurso.Attributes.Add("style", "display:inline");
                    Vercursos.Attributes.Remove("style");
                    Nuevocurso.Attributes.Remove("style");
                    Borrarcurso.Attributes.Remove("style");
                    Vernota.Attributes.Remove("style");
                    break;
                case 4:
                    li_borrarcursos.Attributes.Add("class", "active");
                    li_nuevocursos.Attributes.Remove("class");
                    li_guardarcursos.Attributes.Remove("class");
                    li_vercursos.Attributes.Remove("class");
                    li_vernota.Attributes.Remove("class");

                    Borrarcurso.Attributes.Add("style", "display:inline");
                    Nuevocurso.Attributes.Remove("style");
                    Guardarcurso.Attributes.Remove("style");
                    Vercursos.Attributes.Remove("style");
                    Vernota.Attributes.Remove("style");
                    break;
                case 5:
                    li_vernota.Attributes.Add("class", "active");
                    li_nuevocursos.Attributes.Remove("class");
                    li_guardarcursos.Attributes.Remove("class");
                    li_vercursos.Attributes.Remove("class");
                    li_borrarcursos.Attributes.Remove("class");

                    Vernota.Attributes.Add("style", "display:inline");
                    Nuevocurso.Attributes.Remove("style");
                    Guardarcurso.Attributes.Remove("style");
                    Vercursos.Attributes.Remove("style");
                    Borrarcurso.Attributes.Remove("style");
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