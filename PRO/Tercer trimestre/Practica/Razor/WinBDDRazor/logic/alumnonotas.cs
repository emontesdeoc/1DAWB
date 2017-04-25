using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WinBDDRazor.logic
{
    public class alumnonotas
    {
        public static string _Codalu { get; set; }
        public string Codalu { get; set; }
        public string Codcur { get; set; }
        public string Apellidos { get; set; }
        public string Nombre { get; set; }
        public string Dni { get; set; }
        public int Nota1 { get; set; }
        public static int _Nota1 { get; set; }
        public int Nota2 { get; set; }
        public static int _Nota2 { get; set; }
        public int Nota3 { get; set; }
        public static int _Nota3 { get; set; }
        public int Media { get; set; }
        public static int _Media { get; set; }


        public alumnonotas() { }

        /// <summary>
        /// Funcion que devuelve una lista de alumnos y sus cursos
        /// </summary>
        /// <returns></returns>
        public List<alumnonotas> GetListaAlumnosNotas()
        {
            List<alumnonotas> Lista = new List<alumnonotas>();

            foreach (dynamic item in GetNotasTodos())
            {
                alumnonotas an = new alumnonotas()
                {
                    Codalu = item.COD_ALU,
                    Codcur = item.COD_CUR,
                    Apellidos = item.APELLIDOS,
                    Nombre = item.NOMBRE,
                    Dni = item.DNI,
                    Nota1 = item.NOTA1,
                    Nota2 = item.NOTA2,
                    Nota3 = item.NOTA3,
                    Media = item.MEDIA
                };
                Lista.Add(an);
            }
            return Lista;
        }

        /// <summary>
        /// Metodo dinamico para rellenar la lista de alumnonostas
        /// </summary>
        /// <returns></returns>
        public dynamic GetNotasTodos()
        {
            using (bd.ModelOcupacional contexto = new bd.ModelOcupacional())
            {

                var nota = (from n in contexto.NOTAS
                            join a in contexto.ALUMNOS
                            on n.COD_ALU equals a.COD_ALU
                            orderby a.COD_ALU
                            select new
                            {
                                APELLIDOS = a.APELLIDOS,
                                NOMBRE = a.NOMBRE,
                                DNI = a.DNI,
                                COD_ALU = a.COD_ALU,
                                COD_CUR = a.COD_CUR,
                                NOTA1 = n.NOTA1,
                                NOTA2 = n.NOTA2,
                                NOTA3 = n.NOTA3,
                                MEDIA = n.MEDIA
                            });

                return (nota.ToList());
            }
        }

        /// <summary>
        /// Metodo que actualiza notas
        /// </summary>
        public void ActualizaNota()
        {
            using (bd.ModelOcupacional model = new bd.ModelOcupacional())
            {
                var n = model.NOTAS.SingleOrDefault(x => x.COD_ALU == _Codalu);

                n.NOTA1 = _Nota1;
                n.NOTA2 = _Nota2;
                n.NOTA3 = _Nota3;
                n.MEDIA = _Media;

                model.SaveChanges();
            }

        }

        /// <summary>
        /// Metodo que actualiza notas
        /// </summary>
        public void BorarNota()
        {
            using (bd.ModelOcupacional model = new bd.ModelOcupacional())
            {
                var n = model.NOTAS.SingleOrDefault(x => x.COD_ALU == _Codalu);
                model.NOTAS.Remove(n);
                model.SaveChanges();
            }

        }
    }
}