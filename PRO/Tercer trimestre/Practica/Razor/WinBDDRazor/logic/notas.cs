using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WinBDDRazor.logic
{
    public class notas
    {
        // ( ͡° ͜ʖ ͡°) Do it yourself ಠ_ಠ

        public string Codalu { get; set; }
        public string Codcur { get; set; }
        public int Nota1 { get; set; }
        public int Nota2 { get; set; }
        public int Nota3 { get; set; }
        public int Media { get; set; }

        public notas() { }

        public dynamic GetNotasPorCODALU(string codalu)
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


    }
}