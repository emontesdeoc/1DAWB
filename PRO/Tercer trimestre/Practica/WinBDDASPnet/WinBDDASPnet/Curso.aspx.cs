using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WinBDDASPnet
{
    public partial class Curso : System.Web.UI.Page
    {
        static int i = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            

        }



        protected void btnPrimerCurso_Click(object sender, EventArgs e)
        {

            i = CambioCurso(0);
        }

        protected void btnAnteriorCurso_Click(object sender, EventArgs e)
        {

            i = CambioCurso(i - 1);
        }

        protected void btnSiguienteCurso_Click(object sender, EventArgs e)
        {

            i = CambioCurso(i + 1);
        }

        protected void btnUltimoCurso_Click(object sender, EventArgs e)
        {

            i = CambioCurso(int.MaxValue);
        }

        private int CambioCurso(int newI)
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var vcursos = from p in model.CURSOS
                              select new { codcur = p.COD_CUR, desc = p.DESCRIPCION, horas = p.HORAS, tutor = p.TUTOR };

                int vcursosCount = vcursos.Count();
                if (newI < 0)
                {
                    newI = 0;
                }
                if (newI >= vcursosCount)
                {
                    newI = vcursosCount - 1;
                }

                textboxCodCur.Text = vcursos.ToList()[newI].codcur.ToString();
                textboxDescripcion.Text = vcursos.ToList()[newI].desc.ToString();
                textboxHoras.Text = vcursos.ToList()[newI].horas.ToString();
                textboxTutor.Text = vcursos.ToList()[newI].tutor.ToString();
            }
            return newI;
        }

    }
}