﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WinBDDASPnetChicos
{
    public partial class cursos : System.Web.UI.Page
    {
        static int id = 0;

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
                        dropdown_cursos_borrar.Items.Add(newcurso);
                        dropdown_cursos_guardar.Items.Add(newcurso);
                    }

                }
            }
            borrar_btn_curso.Attributes.Add("class", "disabled");

        }

        protected void btn_primero_Click(object sender, EventArgs e)
        {
            id = CambioCurso(0);
        }

        protected void btn_anterior_Click(object sender, EventArgs e)
        {
            id = CambioCurso(id - 1);
        }

        protected void btn_siguiente_Click(object sender, EventArgs e)
        {
            id = CambioCurso(id + 1);

        }

        protected void btn_ultimo_Click(object sender, EventArgs e)
        {
            id = CambioCurso(int.MaxValue);
        }

        private int CambioCurso(int newID)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var vcursos = (from c in model.CURSOS
                               select new { codcur = c.COD_CUR, desc = c.DESCRIPCION, horas = c.HORAS, tutor = c.TUTOR }).ToList();

                if (newID < 0)
                {
                    newID = 0;
                }
                if (newID >= vcursos.Count())
                {
                    newID = vcursos.Count() - 1;
                }

                txtboxCodCur.Text = vcursos[newID].codcur.ToString();
                TextBoxDescripcion.Text = vcursos[newID].desc.ToString();
                TextBoxHoras.Text = vcursos[newID].horas.ToString();
                TextBoxTutor.Text = vcursos[newID].tutor.ToString();
            }

            return newID;
        }

        protected void btn_Guardar_Click(object sender, EventArgs e)
        {

            using (ModelOcupacional model = new ModelOcupacional())
            {
                var vcursos = (from c in model.CURSOS
                               where c.COD_CUR == nuevo_Textbox_codcur.Text
                               select c).ToList();

                if (vcursos.Count == 1)
                {
                    //vcursos[0].DESCRIPCION = TextBoxDescripcion.Text;
                    //vcursos[0].HORAS = Convert.ToInt32(TextBoxHoras.Text);
                    //vcursos[0].TUTOR = TextBoxTutor.Text;
                }
                else
                {
                    CURSOS newcurso = new CURSOS();
                    newcurso.COD_CUR = nuevo_Textbox_codcur.Text;
                    newcurso.DESCRIPCION = nuevo_Textbox_descripcion.Text;
                    newcurso.HORAS = Convert.ToInt32(nuevo_Textbox_Horas.Text);
                    newcurso.TUTOR = nuevo_Textbox_Tutor.Text;

                    vcursos.Add(newcurso);
                }
                model.SaveChanges();
            }
        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            id = CambioCurso(id);

        }

        protected void btn_Nuevo_Click(object sender, EventArgs e)
        {
            nuevo_Textbox_codcur.Text = "";
            nuevo_Textbox_descripcion.Text = "";
            nuevo_Textbox_Horas.Text = "";
            nuevo_Textbox_Tutor.Text = "";
        }

        protected void dropdown_cursos_borrar_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var vcursos = (from a in model.CURSOS
                               where a.COD_CUR == dropdown_cursos_guardar.SelectedValue.ToString()
                               select a).First();


                borrar_Textbox_codcur.Text = vcursos.COD_CUR;
                borrar_Textbox_descripcion.Text = vcursos.DESCRIPCION;
                borrar_Textbox_horas.Text = vcursos.HORAS.ToString();
                borrar_Textbox_tutor.Text = vcursos.TUTOR;
                borrar_Textbox_codcur.Enabled = false;
                borrar_Textbox_descripcion.Enabled = false;
                borrar_Textbox_horas.Enabled = false;
                borrar_Textbox_tutor.Enabled = false;

            }
            CambioPestañas(4);
        }

        protected void dropdown_cursos_guardar_SelectedIndexChanged(object sender, EventArgs e)
        {

            using (ModelOcupacional model = new ModelOcupacional())
            {
                var vcursos = (from a in model.CURSOS
                               where a.COD_CUR == dropdown_cursos_guardar.SelectedValue.ToString()
                               select a).First();


                guardar_Textbox_codcur.Text = vcursos.COD_CUR;
                guardar_Textbox_descripcion.Text = vcursos.DESCRIPCION;
                guardar_Textbox_horas.Text = vcursos.HORAS.ToString();
                guardar_Textbox_tutor.Text = vcursos.TUTOR;

            }
            CambioPestañas(3);


        }

        protected void guardar_btn_actualizar_Click(object sender, EventArgs e)
        {

        }

        protected void borrar_btn_curso_Click(object sender, EventArgs e)
        {

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

        protected void chkbox_borrar_curso_CheckedChanged(object sender, EventArgs e)
        {
            borrar_btn_curso.Attributes.Remove("class");


        }
    }
}