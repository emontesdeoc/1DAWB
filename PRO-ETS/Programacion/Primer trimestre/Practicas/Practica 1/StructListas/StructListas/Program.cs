using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StructListas
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
            public int n1;
        }
        static void Main(string[] args)
        {
            Console.WriteLine("----------------------------------");
            int t = PreguntarInt("Tamaño de lista de Alumnos: ");
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
                alumnos[i].n1 = 0;
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
            bool NoHayHuecoEnLista = false;
            bool v = false;
            int i = 0;
            Console.Clear();
            Console.WriteLine("-----------------------------------------");
            Console.WriteLine("Dar de alta a un alumno.");
            Console.WriteLine("-----------------------------------------");

            for (i = 0; i < t; i++)
            {
                if (a[i].num == 0)
                {
                    a[i].num = PreguntarInt("Numero del alumno: ");
                    a[i].nombre = PreguntarString("Nombre del alumno: ");
                    a[i].n1 = PreguntarInt("Nota del alumno: ");
                    Console.WriteLine("-----------------------------------------");
                    Console.WriteLine("Usuario añadido a la lista.");
                    Console.WriteLine("-----------------------------------------");
                    NoHayHuecoEnLista = false;
                    i = t;
                }
                else
                {
                    NoHayHuecoEnLista = true;
                }
            }
            v = NoHayHuecoEnLista;
            if (v == true)
            {
                Console.WriteLine("No quedan mas huecos en la lista para rellenar.");
                Console.WriteLine("----------------------------------");
                Console.WriteLine("Operacion realizada, pulse una tecla para continuar...");
                v = true;
            }
            if (v == false)
            {
                Console.WriteLine("¿Desea introducir otro alumno?");
                int p = PreguntarInt("1 - Si | 2 - No : ");
                switch (p)
                {
                    case 1:
                        Altas(t, a);
                        
                        break;
                    case 2:
                        Console.WriteLine("----------------------------------");
                        Console.WriteLine("Operacion realizada, pulse una tecla para continuar...");
                        break;
                    default:
                        break;
                }
                //Altas(t, a);
            }
            Console.ReadLine();
        }
        /// <summary>
        /// Borrar de la tabla introduciendo el numero de alumno
        /// </summary>
        /// <param name="t">Tamaño de la tabla</param>
        /// <param name="a"Estructura</param>
        public static void Bajas(int t, Alumno[] a)
        {
            bool NoHayRegistro = false;
            bool Repetir = false;
            bool v = false;
            Console.Clear();
            Console.WriteLine("----------------------------------");
            Console.WriteLine("Dar de baja a un alumno.");
            Console.WriteLine("----------------------------------");
            int p = PreguntarInt("Introduzca ID de alumno para borrar: ");

            for (int i = 0; i < t; i++)
            {
                if (p == a[i].num)
                {
                    a[i].num = 0;
                    a[i].nombre = "";
                    a[i].n1 = 0;
                    Console.WriteLine("----------------------------------");
                    Console.WriteLine("El alumno con numero {0} ha sido eliminado.", p);
                    Console.WriteLine("----------------------------------");
                    NoHayRegistro = false;
                    Repetir = true;
                    i = t;
                }
                else
                {
                    NoHayRegistro = true;
                }
            }
            v = NoHayRegistro;
            if (v == true)
            {
                Console.WriteLine("----------------------------------");
                Console.WriteLine("No se ha encontrado el registo con el numero {0}.", p);
                Console.WriteLine("----------------------------------");
                Console.WriteLine("¿Desea intentarlo de nuevo?");
                int n = PreguntarInt("1 - Si | 2 - No : ");
                switch (n)
                {
                    case 1:
                        Bajas(t, a);
                        break;
                    case 2:
                        Console.WriteLine("----------------------------------");
                        break;
                }
            }
            if (v == false && Repetir == true)
            {
                Console.WriteLine("¿Desea eliminar otro alumno de la lista?");
                int n = PreguntarInt("1 - Si | 2 - No : ");
                switch (n)
                {
                    case 1:
                        Bajas(t, a);
                        break;
                    case 2:
                        Console.WriteLine("----------------------------------");
                        Console.WriteLine("Operacion realizada, pulse una tecla para continuar...");
                        break;
                }
            }

            Console.ReadLine();
        }
        public static void Modificar(int t, Alumno[] a)
        {
            Console.Clear();
            Console.WriteLine("-----------------------------------------");
            Console.WriteLine("Modificar un alumno.");
            Console.WriteLine("-----------------------------------------");
            int p = PreguntarInt("Introduzca el numero del alumno para modificar: ");
            bool ExisteRegistro = false;
            for (int i = 0; i < t; i++)
            {

                if (p == a[i].num)
                {
                    Console.WriteLine("-----------------------------------------");
                    Console.WriteLine("Informacion sobre el alumno seleccionado:");
                    Console.WriteLine("-----------------------------------------");
                    Console.WriteLine("Numero del alumno: " + a[i].num);
                    Console.WriteLine("Nombre del alumno: " + a[i].nombre);
                    Console.WriteLine("Nota del alumno: " + a[i].n1);
                    Console.WriteLine("-----------------------------------------");
                    Console.WriteLine("Nuevos datos para el alumno seleccionado:");
                    Console.WriteLine("-----------------------------------------");
                    a[i].num = PreguntarInt("Nuevo numero del alumno:");
                    a[i].nombre = PreguntarString("Nuevo nombre del alumno: ");
                    a[i].n1 = PreguntarInt("Nueva nota del alumno: ");
                    Console.WriteLine("-----------------------------------------");
                    Console.WriteLine("Cambio en el alumno con numero {0} realizado.", p);
                    ExisteRegistro = true;
                    i = t;
                }
                else
                {
                    ExisteRegistro = false;
                }
            }
            if (ExisteRegistro == false)
            {
                Console.WriteLine("-----------------------------------------");
                Console.WriteLine("No existe alumno con ese numero {0}", p);
            }
            Console.WriteLine("-----------------------------------------");
            Console.WriteLine("¿Quiere hacer otro cambio?");
            int n = PreguntarInt("1 - Si | 2 - No : ");
            switch (n)
            {
                case 1:
                    Modificar(t, a);
                    break;
                case 2:
                    Console.WriteLine("----------------------------------");
                    Console.WriteLine("Operacion realizada, pulse una tecla para continuar...");
                    break;
            }

            Console.ReadLine();
        }
        /// <summary>
        /// Mostrar todos los valores a la tabla
        /// </summary>
        /// <param name="t">Tamaño de la tabla</param>
        /// <param name="a"Estructura</param>
        public static void Listados(int t, Alumno[] a)
        {
            Console.Clear();
            Console.WriteLine("-----------------------------------------");
            Console.WriteLine("Listado de alumnos.");
            Console.WriteLine("-----------------------------------------");
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
            Console.WriteLine("Hay {0} alumnos en la lista.", c);
            Console.WriteLine("-----------------------------------------");

            for (int i = 0; i < t; i++)
            {
                Console.WriteLine("ID en lista: {0}", i);
                Console.WriteLine("Numero del alumno: " + a[i].num);
                Console.WriteLine("Nombre del alumno: " + a[i].nombre);
                Console.WriteLine("Nota del alumno: " + a[i].n1);
                Console.WriteLine("-----------------------------------------");
            }
            Console.WriteLine("Operacion realizada, pulse una tecla para continuar...");
            Console.ReadLine();
        }
        /// <summary>
        /// Preguntar por un alumno introduciendo un numero
        /// </summary>
        /// <param name="t">Tamaño de la tabla</param>
        /// <param name="a"Estructura</param>
        public static void Consulta(int t, Alumno[] a)
        {
            Console.Clear();
            Console.WriteLine("-----------------------------------------");
            Console.WriteLine("Consultar un alumno.");
            Console.WriteLine("-----------------------------------------");
            int p = PreguntarInt("Introduzca numero del alumno para consultar: ");
            Console.WriteLine("-----------------------------------------");
            bool NoHayRegistro = false;
            bool v = false;

            for (int i = 0; i < t; i++)
            {
                if (p == a[i].num)
                {
                    Console.WriteLine("ID en lista: {0}", i);
                    Console.WriteLine("Numero del alumno: " + a[i].num);
                    Console.WriteLine("Nombre del alumno: " + a[i].nombre);
                    Console.WriteLine("Nota del alumno: " + a[i].n1);
                    Console.WriteLine("-----------------------------------------");
                    NoHayRegistro = false;
                    i = t;
                }
                else
                {
                    NoHayRegistro = true;
                }
            }
            v = NoHayRegistro;
            if (v == true)
            {
                Console.WriteLine("No se ha encontrado el registo con el numero {0}.", p);
                Console.WriteLine("-----------------------------------------");
                Console.WriteLine("¿Desea intentarlo de nuevo?");
                int d = PreguntarInt("1 - Si | 2 - No : ");
                switch (d)
                {
                    case 1:
                        Consulta(t, a);
                        break;
                    case 2:
                        Console.WriteLine("-----------------------------------------");
                        Console.WriteLine("Operacion realizada, pulse una tecla para continuar...");
                        break;
                }
            }
            if (v == false)
            {
                Console.WriteLine("¿Desea hacer otra consulta?");
                int n = PreguntarInt("1 - Si | 2 - No : ");
                switch (n)
                {
                    case 1:
                        Consulta(t, a);
                        break;
                    case 2:
                        Console.WriteLine("-----------------------------------------");
                        Console.WriteLine("Operacion realizada, pulse una tecla para continuar...");
                        break;
                }

            }

            Console.ReadLine();
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
            res = Convert.ToInt32(Console.ReadLine());
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
            res = Console.ReadLine();
            return res;
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
                Console.WriteLine("Menu");
                Console.WriteLine("-------------------------");
                Console.WriteLine("1 - Altas");
                Console.WriteLine("2 - Bajas");
                Console.WriteLine("3 - Modificaciones");
                Console.WriteLine("4 - Consutas");
                Console.WriteLine("5 - Listados");
                Console.WriteLine("0 - Salir");
                Console.WriteLine("-------------------------");

                e = PreguntarInt("Seleccione una opcion: ");
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

        #endregion


    }
}

