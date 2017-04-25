using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WinBDDRazor.logic
{
    public class notas
    {
        public string Codalu { get; set; }
        public string Codcur { get; set; }
        public int Nota1 { get; set; }
        public int Nota2 { get; set; }
        public int Nota3 { get; set; }
        public int Media { get; set; }

        /// <summary>
        /// Variables estaticas
        /// </summary>
        /// 
        public static string _Codalu { get; set; }
        public static int _Nota1 { get; set; }
        public static int _Nota2 { get; set; }
        public static int _Nota3 { get; set; }
        public static int _Media { get; set; }

        public notas() { }

        /// <summary>
        /// Metodo que devuelve notas pasando codigo de alumno
        /// </summary>
        /// <param name="codalu">Codalu</param>
        /// <returns></returns>
        public dynamic GetNotasPorCODALU(string codalu)
        {
            using (bd.ModelOcupacional contexto = new bd.ModelOcupacional())
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

        /// <summary>
        /// Metodo que crea notas
        /// </summary>
        public void CrearNotas()
        {
            using (bd.ModelOcupacional model = new bd.ModelOcupacional())
            {

                WinBDDRazor.bd.NOTA nn = new WinBDDRazor.bd.NOTA();

                nn.COD_ALU = _Codalu;
                var x = model.ALUMNOS.SingleOrDefault(a => a.COD_ALU == _Codalu);

                nn.ALUMNO = x;
                nn.COD_CUR = x.COD_CUR;
                nn.NOTA1 = _Nota1;
                nn.NOTA2 = _Nota2;
                nn.NOTA3 = _Nota3;
                nn.MEDIA = _Media;

                model.NOTAS.Add(nn);

                model.SaveChanges();
            }
        }
    }
}