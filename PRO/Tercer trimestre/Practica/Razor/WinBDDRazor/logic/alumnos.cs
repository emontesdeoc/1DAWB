using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WinBDDRazor.logic
{
    public class alumnos
    {
        // ( ͡° ͜ʖ ͡°) Do it yourself ಠ_ಠ

        public static string Codalu { get; set; }
        public static string Codcur { get; set; }
        public static string Dni { get; set; }
        public static string Nombre { get; set; }
        public static string Apellido { get; set; }

        /// <summary>
        /// Constructor vacio
        /// </summary>
        public alumnos() { }

        /// <summary>
        /// Metodo que devuelve todos los alumnos
        /// </summary>
        /// <returns></returns>
        public List<ALUMNO> GetAllAlumnos()
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var valumnos = (from a in model.ALUMNOS
                                select a).ToList();
                return valumnos;
            }
        }

        /// <summary>
        /// Metodo que crea un alumno
        /// </summary>
        public void CrearAlumno()
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                ALUMNO a = new ALUMNO();

                a.COD_ALU = Codalu;
                a.COD_CUR = Codcur;
                a.DNI = Dni;
                a.APELLIDOS = Apellido;
                a.NOMBRE = Nombre;

                model.ALUMNOS.Add(a);
                model.SaveChanges();
            }

        }

        /// <summary>
        /// Metodo que actualiza el alumno
        /// </summary>
        public void ActualizaAlumno()
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var a = model.ALUMNOS.SingleOrDefault(x => x.COD_ALU == Codalu);

                a.COD_CUR = Codcur;
                a.DNI = Dni;
                a.APELLIDOS = Apellido;
                a.NOMBRE = Nombre;

                model.SaveChanges();
            }

        }

        /// <summary>
        /// Metodo que borra un alumno
        /// </summary>
        public void BorrarAlumno()
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var a = model.ALUMNOS.SingleOrDefault(x => x.COD_ALU == Codalu);
                model.ALUMNOS.Remove(a);
                model.SaveChanges();
            }

        }

        /// <summary>
        /// Metodo que devuelve todos los alumnos sin notas
        /// </summary>
        /// <returns></returns>
        public List<ALUMNO> GetAllAlumnosSinNota()
        {
            using (ModelOcupacional model = new ModelOcupacional())
            {
                var valumnos = (from a in model.ALUMNOS
                                where a.NOTAS.Count() == 0
                                select a).ToList();
                return valumnos;
            }
        }
    }
}