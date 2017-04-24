using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WinBDDRazor.logic
{
    public class cursos
    {
        // ( ͡° ͜ʖ ͡°) Do it yourself ಠ_ಠ

        public static int posi { get; set; }
        public static string Codcur { get; set; }
        public static string Descripcion { get; set; }
        public static int Horas { get; set; }
        public static string Tutor { get; set; }

        /// <summary>
        /// Constructor vacio
        /// </summary>
        public cursos()
        {
        }

        /// <summary>
        /// Constructor, pide valor pero no se utiliza.
        /// </summary>
        /// <param name="i">Cualquier numero</param>
        public cursos(int i)
        {
            CURSO c = GetCursoByPOSI();

            Codcur = c.COD_CUR;
            Descripcion = c.DESCRIPCION;
            Horas = Convert.ToInt32(c.HORAS);
            Tutor = c.TUTOR;
        }

        /// <summary>
        /// Metodo que me devuelve un curso pasando un codcur
        /// </summary>
        /// <param name="CODCUR">Codigo de curso</param>
        /// <returns></returns>
        public WinBDDRazor.CURSO GetCursoByPOSI()
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {

                if (posi > model.CURSOS.Count() - 1)
                {
                    posi = model.CURSOS.Count() - 1;
                }
                if (posi < 0)
                {
                    posi = 0;
                }

                var vcursos = (from c in model.CURSOS
                               select c).OrderBy(x => x.COD_CUR).Skip(posi).Take(1).First();
                return vcursos;

            }
        }

        /// <summary>
        /// Metodo que crea un curso
        /// </summary>
        public void NuevoCurso()
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                CURSO c = new CURSO();

                c.COD_CUR = Codcur;
                c.DESCRIPCION = Descripcion;
                c.HORAS = Horas;
                c.TUTOR = Tutor;

                model.CURSOS.Add(c);

                model.SaveChanges();
            }
        }

        /// <summary>
        /// Metodo que actualiza un curso
        /// </summary>
        public void ActualizarCurso()
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var c = model.CURSOS.SingleOrDefault(x => x.COD_CUR == Codcur);

                c.DESCRIPCION = Descripcion;
                c.HORAS = Horas;
                c.TUTOR = Tutor;

                model.SaveChanges();
            }

        }

        /// <summary>
        /// Metodo que borra un curso
        /// </summary>
        public void BorrarCurso()
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var c = model.CURSOS.SingleOrDefault(x => x.COD_CUR == Codcur);
                model.CURSOS.Remove(c);
                model.SaveChanges();
            }

        }

        public List<CURSO> GetAllCursos()
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var vcurso = (from c in model.CURSOS
                              select c).ToList();
                return vcurso;
            }
        }
    }
}