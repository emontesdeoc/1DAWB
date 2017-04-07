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
        private NOTAS GetNotasPorAlumno(string CODALU)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var vnotas = (from a in model.NOTAS
                              where a.COD_ALU == CODALU
                              select a).First();

                return vnotas;
            }

        }

        private string GetCursoDeAlumno(string CODALU)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var vnotas = (from a in model.NOTAS
                              where a.COD_ALU == CODALU
                              select a).First();

                return vnotas.COD_CUR;
            }

        }


        private bool TieneNotaAlumno(string CODALU)
        {
            bool res = false;
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var vnotas = (from a in model.NOTAS
                              where a.COD_ALU == CODALU
                              select a).First();

                if (vnotas.NOTA1 >= 0 || vnotas.NOTA2 >= 0 || vnotas.NOTA3 >= 0 || vnotas.MEDIA >= 0)
                {
                    res = true;
                }
            }
            return res;

        }
        private dynamic GetNotasPorCODALU(string codalu)
        {
            using (ModelOcupacional contexto = new ModelOcupacional())
            {

                var nota = (from n in contexto.NOTAS
                            join a in contexto.ALUMNOS
                            on n.COD_ALU equals a.COD_ALU
                            where n.COD_ALU == codalu
                            orderby a.APELLIDOS, a.NOMBRE
                            select new
                            {
                                APELLIDOS = a.APELLIDOS,
                                NOMBRE = a.NOMBRE,
                                DNI = a.DNI,
                                CODALU = a.COD_ALU,
                                CODCUR = a.COD_CUR,
                                NOTA1 = n.NOTA1,
                                NOTA2 = n.NOTA2,
                                NOTA3 = n.NOTA3,
                                MEDIA = n.MEDIA
                            });

                return (nota.First());
            }
        }

        private List<ALUMNOS> GetAllAlumnosByCurso(string curso)
        {

            using (ModelOcupacional model = new ModelOcupacional())
            {
                var valumnos = (from a in model.ALUMNOS
                                where a.COD_CUR == curso
                                select a).ToList();
                return valumnos;
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

            List<string> alulist = GetInformacionAlumno(e.CommandArgument.ToString());

            if (e.CommandName == "Modificar")
            {

                modifcar_textbox_apellido.Text = alulist[0];
                modifcar_textbox_nombre.Text = alulist[1];
                modifcar_textbox_codalu.Text = alulist[3];
                modifcar_textbox_dni.Text = alulist[2];
                modifcar_textbox_nota1.Text = alulist[5];
                modifcar_textbox_nota1.Enabled = true;
                modifcar_textbox_nota2.Text = alulist[6];
                modifcar_textbox_nota2.Enabled = true;
                modifcar_textbox_nota3.Text = alulist[7];
                modifcar_textbox_nota3.Enabled = true;
                modifcar_textbox_media.Text = alulist[8];
                modifcar_textbox_media.Enabled = true;

                CambioPestañas(2);
            }
            if (e.CommandName == "Borrar")
            {

                borrar_textbox_apellido.Text = alulist[0];
                borrar_textbox_nombre.Text = alulist[1];
                borrar_textbox_codalu.Text = alulist[3];
                borrar_textbox_dni.Text = alulist[2];
                borrar_textbox_nota1.Text = alulist[5];
                borrar_textbox_nota2.Text = alulist[6];
                borrar_textbox_nota3.Text = alulist[7];
                borrar_textbox_media.Text = alulist[8];

                CambioPestañas(4);
            }
            if (e.CommandName == "Ver")
            {

                ver_textbox_apellido.Text = alulist[0];
                ver_textbox_nombre.Text = alulist[1];
                ver_textbox_codalu.Text = alulist[3];
                ver_textbox_dni.Text = alulist[2];
                ver_textbox_nota1.Text = alulist[5];
                ver_textbox_nota2.Text = alulist[6];
                ver_textbox_nota3.Text = alulist[7];
                ver_textbox_media.Text = alulist[8];

                CambioPestañas(5);
            }
        }

        private List<string> GetInformacionAlumno(string codalu)
        {
            dynamic valumno = GetNotasPorCODALU(codalu);

            Response.Write(valumno.APELLIDOS);

            string a = valumno.ToString();
            List<string> alulist = new List<string>();
            //Separa por elemtnos(apellido,nombre,etc)
            string[] b = a.Split(',');

            for (int i = 0; i < b.Length; i++)
            {
                //Separa cada elemento en 2 ( [0] = APELLIDO, [1] = CARLOS )
                string[] c = b[i].Split('=');
                //Borra el primer espacio
                c[1] = c[1].Remove(0, 1);
                //El ultimo tiene " }",hay que eliminarlo.
                if (i == b.Length - 1)
                {
                    c[1] = c[1].Remove(c[1].Length - 2, 2);
                }
                //Lo añade a la lista
                alulist.Add(c[1]);
            }
            return alulist;
        }

        #endregion

        #region NUEVA NOTA

        protected void btn_nuevanota_Click(object sender, EventArgs e)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                NOTAS newnota = new NOTAS()
                {
                    COD_ALU = nuevo_textbox_codalu.Text,
                    COD_CUR = GetCursoDeAlumno(nuevo_textbox_codalu.Text),
                    NOTA1 = Convert.ToInt32(nuevo_textbox_nota1.Text),
                    NOTA2 = Convert.ToInt32(nuevo_textbox_nota2.Text),
                    NOTA3 = Convert.ToInt32(nuevo_textbox_nota3.Text),
                    MEDIA = Convert.ToInt32(nuevo_textbox_media.Text),
                };
                model.NOTAS.Add(newnota);
                model.SaveChanges();
            }
            CambioPestañas(1);

        }

        protected void dropdown_nueva_nota_selecciona_curso_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<ALUMNOS> alumnos = GetAllAlumnosByCurso(dropdown_nueva_nota_selecciona_curso.SelectedValue);

            dropdown_nueva_nota_selecciona_alumno.Items.Clear();

            foreach (ALUMNOS a in alumnos)
            {
                if (TieneNotaAlumno(a.COD_ALU))
                {

                }
                else
                {
                    ListItem newalumno = new ListItem(a.NOMBRE + " " + a.APELLIDOS, a.COD_ALU);
                    dropdown_nueva_nota_selecciona_alumno.Items.Add(newalumno);
                }
            }

            dropdown_nueva_nota_selecciona_alumno.Enabled = true;
            CambioPestañas(3);
        }

        protected void dropdown_nueva_nota_selecciona_alumno_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<string> alulist = GetInformacionAlumno(dropdown_nueva_nota_selecciona_alumno.SelectedValue);
            nuevo_textbox_apellido.Text = alulist[0];
            nuevo_textbox_apellido.Text = alulist[0];

            nuevo_textbox_nombre.Text = alulist[1];

            nuevo_textbox_codalu.Text = alulist[3];

            nuevo_textbox_dni.Text = alulist[2];

            nuevo_textbox_nota1.Text = alulist[5];
            nuevo_textbox_nota1.Enabled = true;

            nuevo_textbox_nota2.Text = alulist[6];
            nuevo_textbox_nota2.Enabled = true;

            nuevo_textbox_nota3.Text = alulist[7];
            nuevo_textbox_nota3.Enabled = true;

            nuevo_textbox_media.Text = alulist[8];
            nuevo_textbox_media.Enabled = true;

        }

        #endregion

        #region ACTUALIAR NOTA

        protected void btn_actualizar_Click(object sender, EventArgs e)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                foreach (NOTAS n in model.NOTAS)
                {
                    if (n.COD_ALU == modifcar_textbox_codalu.Text)
                    {
                        n.NOTA1 = Convert.ToInt32(modifcar_textbox_nota1.Text);
                        n.NOTA2 = Convert.ToInt32(modifcar_textbox_nota2.Text);
                        n.NOTA3 = Convert.ToInt32(modifcar_textbox_nota3.Text);
                        n.MEDIA = Convert.ToInt32(modifcar_textbox_media.Text);
                        break;
                    }
                }
                model.SaveChanges();
            }
            CambioPestañas(1);

        }

        #endregion

        #region BORRAR NOTA

        protected void btn_borrar_Click(object sender, EventArgs e)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                foreach (NOTAS n in model.NOTAS)
                {
                    if (n.COD_ALU == borrar_textbox_codalu.Text)
                    {
                        model.NOTAS.Remove(n);
                        break;
                    }
                }
                model.SaveChanges();
            }
            CambioPestañas(1);

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
                dropdown_nueva_nota_selecciona_curso.Items.Add(nada);
                foreach (var c in vcursos)
                {
                    ListItem newcurso = new ListItem(c.nombre, c.value);
                    dropdown_cursos.Items.Add(newcurso);
                    dropdown_nueva_nota_selecciona_curso.Items.Add(newcurso);
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