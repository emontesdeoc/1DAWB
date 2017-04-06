﻿using System;
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
                List<string> alulist = GetInformacionAlumno(e.CommandArgument.ToString());

                modifcar_textbox_apellido.Text = alulist[0];
                modifcar_textbox_nombre.Text = alulist[1];
                modifcar_textbox_codalu.Text = alulist[3];
                modifcar_textbox_codcur.Text = alulist[4];
                modifcar_textbox_nota1.Text = alulist[5];
                modifcar_textbox_nota2.Text = alulist[6];
                modifcar_textbox_nota3.Text = alulist[7];
                modifcar_textbox_media.Text = alulist[8];

                CambioPestañas(2);
            }
            if (e.CommandName == "Borrar")
            {
                List<string> alulist = GetInformacionAlumno(e.CommandArgument.ToString());

                modifcar_textbox_apellido.Text = alulist[0];
                modifcar_textbox_nombre.Text = alulist[1];
                modifcar_textbox_codalu.Text = alulist[3];
                modifcar_textbox_codcur.Text = alulist[4];
                modifcar_textbox_nota1.Text = alulist[5];
                modifcar_textbox_nota2.Text = alulist[6];
                modifcar_textbox_nota3.Text = alulist[7];
                modifcar_textbox_media.Text = alulist[8];

                CambioPestañas(4);
            }
            if (e.CommandName == "Ver")
            {
                List<string> alulist = GetInformacionAlumno(e.CommandArgument.ToString());

                .Text = alulist[0];
                modifcar_textbox_nombre.Text = alulist[1];
                modifcar_textbox_codalu.Text = alulist[3];
                modifcar_textbox_codcur.Text = alulist[4];
                modifcar_textbox_nota1.Text = alulist[5];
                modifcar_textbox_nota2.Text = alulist[6];
                modifcar_textbox_nota3.Text = alulist[7];
                modifcar_textbox_media.Text = alulist[8];

                CambioPestañas(1);
            }
        }

        private List<string> GetInformacionAlumno(string codalu)
        {
            dynamic valumno = GetNotasPorCODALU(codalu);

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