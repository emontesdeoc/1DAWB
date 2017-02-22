using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PruebaExamen
{
    class Program
    {
        public struct Alumno
        {
            public int num;
            public string nombre;
            public int n1;
            public int n2;
            public int n3;
            public int media;
        }
        static void Main(string[] args)
        {
            int t = PreguntarInt("Tamaño de la lista de Alumnos: ");
            Alumno[] alumnos = new Alumno[t];
            MostrarMenu(t, alumnos);
            


            Console.ReadLine();
        }
        //Generar estructura
        public static void GenerarStruct(Alumno[] a, int t)
        {
            for (int i = 0; i < t; i++)
            {
                a[i].num = 0;
                a[i].nombre = "";
                a[i].n1 = 0;
                a[i].n2 = 0;
                a[i].n3 = 0;
                a[i].media = 0;
            }
        }
        //Opciones de menu
        public static void Altas(Alumno[] a, int t)
        {
            Console.WriteLine("Agregar alumno.");
            int p = PreguntarInt("Numero de alumno: ");
            for (int i = 0; i < t; i++)
            {
                if (a[i].num == 0)
                {
                    PreguntarDatosAlumno(i, a);
                    break;
                }
                else
                {
                    Console.WriteLine("No hay hueco en la lista. ");
                }
            }
            Console.WriteLine("Pulse una tecla para continuar..");
            Console.ReadKey();
        }
        public static void Listado(Alumno[] a, int t)
        {
            for (int i = 0; i < t; i++)
            {
                MostrarDatosAlumno(i, a);
            }
            Console.WriteLine("Pulse una tecla para continuar..");
            Console.ReadKey();
        }
        public static int Buscador(int t, int p, Alumno[] a)
        {
            //Bucle que busca en toda la tabla
            for (int i = 0; i < t; i++)
            {
                //Ei el numero introducido coincide con algun numero
                if (p == a[i].num)
                {
                    //Existe y devuelve la posicion
                    return i;
                }
            }
            //No existe y devuelve -1
            return -1;

        }
        public static void MostrarMedia(Alumno[] a, int t)
        {
            int p = PreguntarInt("Numero de alumno para caluclar media");

            int d = Buscador(a, t, p);

            CalcularMedia(a[d].n1, a[d].n2, a[d].n3);
            Console.WriteLine("Pulse una tecla para continuar..");
            Console.ReadKey();
        }
        //Operaciones matematicas
        public static int CalcularMedia(int n1, int n2, int n3)
        {
            int res = (n1 + n2 + n3) / 3; ;
            return res;
        }
        //Funciones de pregunta de datos
        public static int PreguntarInt(string text)
        {
            int res = 0;
            Console.Write(text);
            res = Convert.ToInt32(Console.ReadLine());
            return res;
        }
        public static string PreguntarString(string text)
        {
            string res = "";
            Console.Write(text);
            res = Console.ReadLine();
            return res;
        }
        //Metodos
        public static void PreguntarDatosAlumno(int i, Alumno[] a)
        {
            a[i].nombre = PreguntarString("Nombre del alumno");
            a[i].n1 = PreguntarInt("Nota 1: "); ;
            a[i].n2 = PreguntarInt("Nota 2: "); ;
            a[i].n3 = PreguntarInt("Nota 3: "); ;
            a[i].media = CalcularMedia(a[i].n1, a[i].n2, a[i].n3);

        }
        public static void MostrarDatosAlumno(int i, Alumno[] a)
        {
            Console.WriteLine(a[i].num);
            Console.WriteLine(a[i].nombre);
            Console.WriteLine(a[i].n1);
            Console.WriteLine(a[i].n2);
            Console.WriteLine(a[i].n3);
            Console.WriteLine(a[i].media);
        }
        //Menu
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
                Console.WriteLine(" 2 - Calcular Media");
                Console.WriteLine(" 3 - Listado");
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
                    Altas(a, t);
                    break;
                case 2:
                    MostrarMedia(a, t);
                    break;
                case 3:
                    Listado(a,t);
                    break;
                default:
                    break;
            }
        }
    }
}
