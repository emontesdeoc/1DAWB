using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StructListasSimple
{
    class Program
    {

        //altas
        //bajas
        //modificaciones
        //consultas
        //listados
        //borrar todo by ayosinho
        public struct Alumno
        {
            public int num;
            public string nombre;
            public int nota;
        }
        static void Main(string[] args)
        {
            Titulos(" Estructura tipo tabla para alumnos.");
            int t = PreguntarInt(" Tamaño de lista de alumnos: ");
            Alumno[] a = GenerarStructVacio(t);
            MostrarMenu(t, a);
        }

        #region GenerarStruct

        /// <summary>
        /// Generar la estructura y darle valores por defecto
        /// </summary>
        /// <param name="t">Tamaño de la tabla</param>
        /// <returns></returns>
        public static Alumno[] GenerarStructVacio(int t)
        {
            Alumno[] alumnos = new Alumno[t];

            for (int i = 0; i < t; i++)
            {
                alumnos[i].num = 0;
                alumnos[i].nombre = "";
                alumnos[i].nota = 0;
            }
            return alumnos;
        }

        #endregion

        #region MetodosLista

        /// <summary>
        /// Agregar valores a la tabla
        /// </summary>
        /// <param name="t">Tamaño de la tabla</param>
        /// <param name="a"Estructura</param>
        public static void Altas(int t, Alumno[] a)
        {
            Console.Clear();
            Titulos(" Dar de alta a un alumno");
            bool n = false, d = false;
            int p = 0;

            bool success = false;
            bool successnota = false;
            int retry = 1;

            while (!success && retry > 0)
            {
                try
                {
                    p = PreguntarInt(" Nuevo numero para el alumno: ");
                    success = true;
                }
                catch (Exception)
                {
                    ErrorEntrar();
                    retry++;
                }
            }

            for (int i = 0; i < t; i++)
            {
                if (p == a[i].num)
                {
                    Barra();
                    Console.WriteLine(" Ya existe un alumno con el numero {0}.", p);
                    Barra();
                    MostrarDatosAlumnos(i, a);
                    Barra();
                    n = false;
                    break;
                }
                else
                {
                    d = true;
                }
            }
            if (d)
            {
                for (int i = 0; i < t; i++)
                {
                    if (a[i].num == 0)
                    {
                        a[i].num = p;
                        success = false;
                        successnota = false;
                        retry = 1;

                        while (!success && retry > 0)
                        {
                            try
                            {
                                a[i].nombre = PreguntarString(" Nuevo nombre del alumno: ");
                                success = true;
                            }
                            catch (Exception)
                            {
                                ErrorEntrar();
                                retry++;
                            }
                        }
                        while (!successnota && retry > 0)
                        {
                            try
                            {
                                a[i].nota = PreguntarInt(" Nueva nota del alumno: ");
                                successnota = true;
                            }
                            catch (Exception)
                            {
                                ErrorEntrar();
                                retry++;
                            }
                        }
                        Titulos(" Usuario añadido a la lista.");
                        n = false;
                        break;
                    }
                    else if (a[i].num != 0)
                    {
                        n = true;
                    }
                }
                if (n == true)
                {
                    Barra();
                    Console.WriteLine(" No hay lugar en la lista para nuevos alumnos: ");
                    Barra();
                }
            }
            //altas

            FinalizarMetodo();
        }
        /// <summary>
        /// Borrar de la tabla introduciendo el numero de alumno
        /// </summary>
        /// <param name="t">Tamaño de la tabla</param>
        /// <param name="a"Estructura</param>
        public static void Bajas(int t, Alumno[] a)
        {
            Console.Clear();
            Titulos(" Dar de baja a un alumno.");
            int p = PreguntarInt(" Introduzca ID de alumno para borrar: ");
            bool n = false;

            for (int i = 0; i < t; i++)
            {
                if (p == a[i].num)
                {
                    DefaultDatosAlumnos(i, a);
                    Barra();
                    Console.WriteLine(" El alumno con numero {0} ha sido eliminado.", p);
                    Barra();
                    n = false;
                    break;
                }
                else
                {
                    n = true;
                }
            }

            for (int i = 0; i < t; i++)
            {
                if (p == a[i].num)
                {
                    //existe
                    break;
                }
                else
                {
                    //no existe
                }
            }
            if (n == true)
            {
                Barra();
                Console.WriteLine(" No existe un alumno con el numero {0}.", p);
                Barra();
            }
            FinalizarMetodo();
        }
        public static void Modificar(int t, Alumno[] a)
        {

            int[] tabla = new int[5];

            Console.Clear();
            Titulos(" Modificar los datos de un alumno.");
            int p = PreguntarInt(" Introduzca el numero del alumno para modificar: ");
            bool k = false;
            for (int i = 0; i < t; i++)
            {
                if (p == a[i].num)
                {
                    Titulos(" Informacion sobre el alumno seleccionado:");
                    MostrarDatosAlumnos(i, a);
                    Titulos(" Nuevos datos para el alumno seleccionado:");
                    PreguntarDatosAlumnos(i, a);
                    Barra();
                    Console.WriteLine(" Cambio en el alumno con numero {0} realizado.", p);
                    Barra();
                    k = false;
                    break;
                }
                else
                {
                    k = true;
                }
            }
            if (k)
            {
                Barra();
                Console.WriteLine(" No existe un alumno con el numero {0}, o el numero introducido es incorrecto", p);
                Barra();
            }
            FinalizarMetodo();
        }
        /// <summary>
        /// Mostrar todos los valores a la tabla
        /// </summary>
        /// <param name="t">Tamaño de la tabla</param>
        /// <param name="a"Estructura</param>
        public static void Listados(int t, Alumno[] a)
        {
            Console.Clear();
            Titulos(" Listado de alumnos.");
            int c = 0;
            for (int i = 0; i < t; i++)
            {
                if (a[i].num == 0)
                {
                }
                else
                {
                    c++;
                }
            }
            Console.WriteLine(" Hay {0} alumnos en la lista.", c);
            Barra();

            for (int i = 0; i < t; i++)
            {
                MostrarDatosAlumnos(i, a);
                Barra();
            }
            FinalizarMetodo();
        }
        /// <summary>
        /// Preguntar por un alumno introduciendo un numero
        /// </summary>
        /// <param name="t">Tamaño de la tabla</param>
        /// <param name="a"Estructura</param>
        public static void Consulta(int t, Alumno[] a)
        {
            Console.Clear();
            bool n = false;
            Titulos(" Consultar los datos de un alumno.");
            int p = PreguntarInt(" Introduzca numero del alumno para consultar: ");
            Barra();

            for (int i = 0; i < t; i++)
            {
                if (p == a[i].num)
                {
                    MostrarDatosAlumnos(i, a);
                    Barra();
                    n = false;
                    break;
                }
                else
                {
                    n = true;
                }
            }
            if (n)
            {
                Console.WriteLine(" No existe un alumno con el numero {0}", p);
                Barra();
            }
            FinalizarMetodo();
        }

        #endregion

        #region PreguntarValores

        /// <summary>
        /// Preguntar un enter
        /// </summary>
        /// <param name="text">Texto a mostrar</param>
        /// <returns></returns>
        public static int PreguntarInt(string text)
        {
            int res = 0;
            Console.Write(text);
            bool success = false;
            int retry = 1;

            while (!success && retry > 0)
            {
                try
                {
                    res = Convert.ToInt32(Console.ReadLine());
                    success = true;
                }
                catch (Exception)
                {
                    ErrorEntrar();
                    retry++;
                }
            }
            return res;
        }
        /// <summary>
        /// Preguntar una cadena de texto
        /// </summary>
        /// <param name="text">Texto a mostrar</param>
        /// <returns></returns>
        public static string PreguntarString(string text)
        {
            string res = "";
            Console.Write(text);
            bool success = false;
            int retry = 1;

            while (!success && retry > 0)
            {
                try
                {
                    res = Console.ReadLine();
                    success = true;
                }
                catch (Exception)
                {
                    ErrorEntrar();
                    retry++;
                }
            }
            return res;
        }
        /// <summary>
        /// Muestra los datos de los alumnos
        /// </summary>
        /// <param name="i">Numero i que va a leer</param>
        /// <param name="a">de que estructura tipo tabla /param>
        public static void MostrarDatosAlumnos(int i, Alumno[] a)
        {
            Console.WriteLine(" ID en lista: {0}", i);
            Console.WriteLine(" Numero del alumno: " + a[i].num);
            Console.WriteLine(" Nombre del alumno: " + a[i].nombre);
            Console.WriteLine(" Nota del alumno: " + a[i].nota);
        }
        /// <summary>
        /// Pregunta los Datos de alumno
        /// </summary>
        /// <param name="i">Donde se encuentra el contadr</param>
        /// <param name="a">Estructura de tablas</param>
        public static void PreguntarDatosAlumnos(int i, Alumno[] a)
        {
            bool success = false;
            bool success1 = false;
            bool success2 = false;
            int retry = 1;

            while (!success && retry > 0)
            {
                try
                {
                    a[i].num = PreguntarInt(" Nuevo numero del alumno: ");
                    success = true;
                }
                catch (Exception)
                {
                    ErrorEntrar();
                    retry++;
                }
            }
            while (!success1 && retry > 0)
            {
                try
                {
                    a[i].nombre = PreguntarString(" Nuevo nombre del alumno: ");
                    success1 = true;
                }
                catch (Exception)
                {
                    ErrorEntrar();
                    retry++;
                }
            }
            while (!success2 && retry > 0)
            {
                try
                {
                    a[i].nota = PreguntarInt(" Nueva nota del alumno: ");
                    success2 = true;
                }
                catch (Exception)
                {
                    ErrorEntrar();
                    retry++;
                }
            }


        }
        public static void DefaultDatosAlumnos(int i, Alumno[] a)
        {
            a[i].num = 0;
            a[i].nombre = "";
            a[i].nota = 0;
        }
        #endregion

        #region Menu

        /// <summary>
        /// Mostrar el menu
        /// </summary>
        /// <param name="t">Tamaño de tabla</param>
        /// <param name="a">Estructura</param>
        public static void MostrarMenu(int t, Alumno[] a)
        {
            int e = 0;
            do
            {
                Console.Clear();
                Console.WriteLine("-------------------------");
                Console.WriteLine(" Menu");
                Console.WriteLine("-------------------------");
                Console.WriteLine(" 1 - Altas");
                Console.WriteLine(" 2 - Bajas");
                Console.WriteLine(" 3 - Modificaciones");
                Console.WriteLine(" 4 - Consutas");
                Console.WriteLine(" 5 - Listados");
                Console.WriteLine(" 0 - Salir");
                Console.WriteLine("-------------------------");

                e = PreguntarInt(" Seleccione una opcion: ");
                SeleccionarFuncion(e, t, a);
            } while (e != 0);
        }
        /// <summary>
        /// Seleccionador de casos en el menu
        /// </summary>
        /// <param name="e">Eleccion</param>
        /// <param name="t">Tamaño de la tabla</param>
        /// <param name="a">Estructura</param>
        public static void SeleccionarFuncion(int e, int t, Alumno[] a)
        {
            switch (e)
            {
                case 0:
                    break;
                case 1:
                    Altas(t, a);
                    break;
                case 2:
                    Bajas(t, a);
                    break;
                case 3:
                    Modificar(t, a);
                    break;
                case 4:
                    Consulta(t, a);
                    break;
                case 5:
                    Listados(t, a);
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// Finalizar funciones con Console.Writeline
        /// </summary>
        public static void FinalizarMetodo()
        {
            Console.WriteLine(" Operacion realizada, pulse una tecla...");
            Console.ReadLine();
        }
        /// <summary>
        /// Metodo para embellecer los titulos
        /// </summary>
        /// <param name="text"></param>
        public static void Titulos(string text)
        {
            Console.WriteLine("-----------------------------------------");
            Console.WriteLine(text);
            Console.WriteLine("-----------------------------------------");
        }
        /// <summary>
        /// Simple barra separadora
        /// </summary>
        public static void Barra()
        {
            Console.WriteLine("-----------------------------------------");
        }
        public static void ErrorEntrar()
        {
            Console.Write(" No hay lugar en la lista para nuevos alumnos: ");

        }
    }
    #endregion


}


