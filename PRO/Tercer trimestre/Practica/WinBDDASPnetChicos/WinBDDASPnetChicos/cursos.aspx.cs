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
    }
}