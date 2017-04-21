using System;
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
                CargaDropDownConCursos();
                RestablecerValoresTextboxes();
            }
        }

        #region CONSEGUIR CURSOS

        /// <summary>
        /// Metdo que me devuelve un curso pasando un codcur
        /// </summary>
        /// <param name="CODCUR">Codigo de curso</param>
        /// <returns></returns>
        private CURSOS GetCursoByCODCUR(string CODCUR)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var vcursos = (from c in model.CURSOS
                               where c.COD_CUR == CODCUR
                               select c).First();
                return vcursos;

            }



        }

        #endregion

        #region VER CURSOS

        /// <summary>
        /// Evento que muestra el primer curso
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_primero_Click(object sender, EventArgs e)
        {

            id = CambioCurso(0);
            CambioPestañas(1);
        }

        /// <summary>
        /// Metodo que devuelve el anterior curso 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_anterior_Click(object sender, EventArgs e)
        {
            id = CambioCurso(id - 1);
            CambioPestañas(1);
        }

        /// <summary>
        /// Metodo que muestra el siguiente curso
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_siguiente_Click(object sender, EventArgs e)
        {
            id = CambioCurso(id + 1);

            CambioPestañas(1);
        }

        /// <summary>
        /// Metodo que devuelve el ultimo curso
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_ultimo_Click(object sender, EventArgs e)
        {
            id = CambioCurso(int.MaxValue);
            CambioPestañas(1);
        }

        /// <summary>
        /// Metodo encargado de hacer el cambio de curso pasandole un id
        /// </summary>
        /// <param name="newID">siguiente ID</param>
        /// <returns></returns>
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

        #endregion

        #region NUEVO CURSO

        /// <summary>
        /// Evento que guarda un curso
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_Guardar_Click(object sender, EventArgs e)
        {

            using (ModelOcupacional model = new ModelOcupacional())
            {
                //var vcursos = GetCursoByCODCUR(nuevo_Textbox_codcur.Text);

                CURSOS newcurso = new CURSOS();
                newcurso.COD_CUR = nuevo_Textbox_codcur.Text;
                newcurso.DESCRIPCION = nuevo_Textbox_descripcion.Text;
                newcurso.HORAS = Convert.ToInt32(nuevo_Textbox_Horas.Text);
                newcurso.TUTOR = nuevo_Textbox_Tutor.Text;

                model.CURSOS.Add(newcurso);
                model.SaveChanges();

                RestablecerValoresTextboxes();


            }

            CambioPestañas(2);

            CargaDropDownConCursos();
        }

        /// <summary>
        /// Boton que cancela la insercion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            nuevo_Textbox_codcur.Text = "";
            nuevo_Textbox_descripcion.Text = "";
            nuevo_Textbox_Horas.Text = "";
            nuevo_Textbox_Tutor.Text = "";

        }

        #endregion

        #region MODIFICAR CURSO

        /// <summary>
        /// Evento que genera los datos del curso seleccionado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dropdown_cursos_guardar_SelectedIndexChanged(object sender, EventArgs e)
        {

            using (ModelOcupacional model = new ModelOcupacional())
            {
                var vcursos = GetCursoByCODCUR(dropdown_cursos_guardar.SelectedValue.ToString());

                guardar_Textbox_codcur.Enabled = false;
                guardar_Textbox_codcur.Text = vcursos.COD_CUR;
                guardar_Textbox_descripcion.Text = vcursos.DESCRIPCION;
                guardar_Textbox_horas.Text = vcursos.HORAS.ToString();
                guardar_Textbox_tutor.Text = vcursos.TUTOR;

            }

            CambioPestañas(3);
        }

        /// <summary>
        /// Bton que actualiza el curso
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void guardar_btn_actualizar_Click(object sender, EventArgs e)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                foreach (CURSOS c in model.CURSOS)
                {
                    if (c.COD_CUR == guardar_Textbox_codcur.Text)
                    {
                        c.DESCRIPCION = guardar_Textbox_descripcion.Text;
                        c.HORAS = Convert.ToInt32(guardar_Textbox_horas.Text);
                        c.TUTOR = guardar_Textbox_tutor.Text;
                    }
                }

                model.SaveChanges();
            }
            CargaDropDownConCursos();
            CambioPestañas(3);
        }

        #endregion

        #region BORRAR CURSO

        /// <summary>
        /// Evento que muestra los datos del curso a borrar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void dropdown_cursos_borrar_SelectedIndexChanged(object sender, EventArgs e)
        {
            var vcursos = GetCursoByCODCUR(dropdown_cursos_borrar.SelectedValue.ToString());


            borrar_Textbox_codcur.Text = vcursos.COD_CUR;
            borrar_Textbox_descripcion.Text = vcursos.DESCRIPCION;
            borrar_Textbox_horas.Text = vcursos.HORAS.ToString();
            borrar_Textbox_tutor.Text = vcursos.TUTOR;

            borrar_Textbox_codcur.Enabled = false;
            borrar_Textbox_descripcion.Enabled = false;
            borrar_Textbox_horas.Enabled = false;
            borrar_Textbox_tutor.Enabled = false;

            CambioPestañas(4);
        }

        /// <summary>
        /// Boton que borra el curso
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void borrar_btn_curso_Click(object sender, EventArgs e)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                if (chkbox_borrar_curso_asp.Checked)
                {
                    foreach (CURSOS c in model.CURSOS)
                    {

                        if (c.COD_CUR == dropdown_cursos_borrar.SelectedValue.ToString())
                        {
                            model.CURSOS.Remove(c);
                            break;
                        }
                    }
                    try
                    {
                        model.SaveChanges();
                    }
                    catch (Exception)
                    {

                        notification_label_borrar.Text = "El curso tiene alumnos!";
                    }

                }
                else
                {
                    notification_label_borrar.Text = "Pulsa en el checkbox para borrar";
                }
            }

            CargaDropDownConCursos();
            CambioPestañas(4);

            borrar_Textbox_descripcion.Text = "";
            borrar_Textbox_horas.Text = "";
            borrar_Textbox_tutor.Text = "";
            borrar_Textbox_codcur.Text = "";

        }

        protected void chkbox_borrar_curso_CheckedChanged(object sender, EventArgs e)
        {
        }

        #endregion

        #region METODOS DE CONTROL DE VISTA

        /// <summary>
        /// Metodo encargao de carga los dropdown de cursos
        /// </summary>
        private void CargaDropDownConCursos()
        {
            dropdown_cursos_borrar.Items.Clear();
            dropdown_cursos_guardar.Items.Clear();

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

        /// <summary>
        /// Metodo encargado de cambiar las pestañas
        /// </summary>
        /// <param name="i">Numero de pestaña</param>
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

        /// <summary>
        /// Metodo que restablece los valores de los textboxes
        /// </summary>
        private void RestablecerValoresTextboxes()
        {
            nuevo_Textbox_descripcion.Text = "";
            nuevo_Textbox_Horas.Text = "";
            nuevo_Textbox_Tutor.Text = "";
            nuevo_Textbox_codcur.Text = "";

            guardar_Textbox_descripcion.Text = "";
            guardar_Textbox_horas.Text = "";
            guardar_Textbox_tutor.Text = "";
            guardar_Textbox_codcur.Text = "";

            borrar_Textbox_descripcion.Text = "";
            borrar_Textbox_horas.Text = "";
            borrar_Textbox_tutor.Text = "";
            borrar_Textbox_codcur.Text = "";


        }

        protected void li_vercursos_ServerClick(object sender, EventArgs e)
        {
            RestablecerValoresTextboxes();
        }

        #endregion

    }
}