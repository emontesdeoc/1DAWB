using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StructListasActualizado
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
            int t;
            do
            {
                t = ExceptionInt(" Tamaño de lista de alumnos: ");
                if (t == 0)
                {
                    Console.WriteLine(" Valor erroneo, introduzca de nuevo.");
                }
            } while (t == 0);

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
            //Genera tabla de estructura con un tamaño introducido por T
            Alumno[] alumnos = new Alumno[t];
            //Da valores default a la tabla nada mas generarse
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
            int p = ExceptionInt(" Introduzca el numero del alumno: ");
            //Si hay hueco en lista
            int d = HayHuecoEnLista(t, p, a);
            //Si existe el valor P introducido
            bool g = Existe(p, t, a);
            //Si hay hueco y existe
            if (d >= 0)
            {
                if (g)
                {
                    a[d].num = p;
                    a[d].nombre = ExceptionString(" Nuevo nombre del alumno: ");
                    while (a[d].nombre == "")
                    {
                        Console.WriteLine(" No se admite nada en el nombre.");
                        a[d].nombre = ExceptionString(" Nuevo nombre del alumno: ");
                    }
                    a[d].nota = ExceptionInt(" Nueva nota del alumno: ");
                    while (a[d].nota < 0)
                    {
                        Console.WriteLine(" No se admiten valores menores a 0.");
                        a[d].nota = ExceptionInt(" Nueva nota del alumno: ");
                    }
                    Barra();
                }
                //Si hay hueco pero hay un ID con mismo numero
                else
                {
                    Barra();
                    Console.WriteLine(" Existe un alumno con este numero");
                    Barra();
                }
            }
            //Si no hay hueco
            else
            {
                Barra();
                Console.WriteLine(" No hay hueco en la lista.");
                Barra();
            }
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
            int p = ExceptionInt(" Introduzca ID de alumno para borrar: ");
            //Busca el valor P en la lista
            int k = Buscador(t, p, a);
            //Si encuentra el alumno
            if (k >= 0)
            {
                DefaultDatosAlumnos(k, a);
                Barra();
                Console.WriteLine(" El alumno con numero {0} ha sido eliminado.", p);
                Barra();

            }
            //Si no lo encuentra
            else
            {
                Barra();
                Console.WriteLine(" No existe un alumno con el numero {0}.", p);
                Barra();
            }
            FinalizarMetodo();
        }
        /// <summary>
        /// Funcion que devuelve en que ID esta el numero introducido
        /// </summary>
        /// <param name="t">Tamaño de la tabla</param>
        /// <param name="p">Numero introducido</param>
        /// <param name="a">Estructura de tabla </param>
        /// <returns></returns>
        public static void Modificar(int t, Alumno[] a)
        {
            Console.Clear();
            Titulos(" Modificar los datos de un alumno.");
            int p = ExceptionInt(" Introduzca el numero del alumno para modificar: ");
            //Devuelve el lugar en lista donde se encuentra el numero introducido
            int d = Buscador(t, p, a);
            //Si D es mayor que 0 significa que hay hueco
            if (d >= 0 && a[d].num != 0)
            {
                //Muestra los datos del alumno seleccionado
                Titulos(" Informacion sobre el alumno seleccionado:");
                MostrarDatosAlumnos(d, a);
                //Pregunta los nuevos datos para ese alumno
                Titulos(" Nuevos datos para el alumno seleccionado:");
                PreguntarDatosAlumnos(d, a);
                Barra();
                Console.WriteLine(" Cambio en el alumno con numero {0} realizado.", p);
                Barra();
            }
            //Si D es menor que 0 significa que no existe
            else if (d < 0)
            {
                Barra();
                Console.WriteLine(" No existe un alumno con el numero {0}.", p);
                Barra();
            }
            //Si el numero introducido es 0, no hace nada
            else if (a[d].num == 0)
            {
                Barra();
                Console.WriteLine(" El numero introducido no es valido.");
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
            //Cuenta los alumnos de la lista
            int c = 0;
            for (int i = 0; i < t; i++)
            {
                //Si el numero devuelto es 0 no hace nada
                if (a[i].num != 0)
                {
                    c++;
                }

            }
            //Muestra la cantidad de alumnos
            Console.WriteLine(" Hay {0} alumnos en la lista.", c);
            Barra();
            //Bucle que muestra los alumnos en la lista completa
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
            Titulos(" Consultar los datos de un alumno.");
            int p = ExceptionInt(" Introduzca numero del alumno para consultar: ");
            Barra();
            //Metodo que devuelve donde se encuentra el numero introducido
            int d = Buscador(t, p, a);
            //Si lo devuelto es >= 0 significa que existe por lo que lo muestra
            if (d >= 0 && a[d].num != 0)
            {
                MostrarDatosAlumnos(d, a);
                Barra();
            }
            //Si devuelve < 0 es que no existe(del metodo Buscador)
            else if (d < 0)
            {
                Console.WriteLine(" No existe un alumno con el numero {0}", p);
                Barra();
            }
            //Si el numero introducido es 0, no hace nada
            else if (a[d].num == 0)
            {
                Console.WriteLine(" El numero introducido no es valido.");
                Barra();
            }

            FinalizarMetodo();
        }

        #endregion

        #region Buscadores

        /// <summary>
        /// Te devuelve el numero de lista(ID)
        /// </summary>
        /// <param name="t">Tamaño de la tabla</param>
        /// <param name="p">Numero a buscar</param>
        /// <param name="a">Tabla</param>
        /// <returns></returns>
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
        /// <summary>
        /// Funcion que devuelve un bool si existe el valor en la lista
        /// </summary>
        /// <param name="t">Tamaño de la tabla</param>
        /// <param name="p">Numero introducido</param>
        /// <param name="a">Estructura de tabla </param>
        /// <returns></returns>
        public static bool Existe(int p, int t, Alumno[] a)
        {
            bool res = false;
            //Bucle que recorre la tabla
            for (int i = 0; i < t; i++)
            {
                //Si existe algun alumno que contenga el numero devuelve verdadero y muestra mensaje
                if (p == a[i].num)
                {
                    res = false;
                    break;
                }
                //Si no encuentra devuelve falso
                else
                {
                    res = true;
                }
            }
            return res;
        }
        /// <summary>
        /// Funcion que devuelve el hueco donde hay sitio libre para introducir valores
        /// </summary>
        /// <param name="t">Tamaño de tabla</param>
        /// <param name="p">Numero introducido</param>
        /// <param name="a">Estructura de tabla</param>
        /// <returns></returns>
        public static int HayHuecoEnLista(int t, int p, Alumno[] a)
        {
            //Bucle que recorre la lista
            for (int i = 0; i < t; i++)
            {
                //Si algun numero es 0 significa que se puede agregar un alumno
                if (a[i].num == 0)
                {
                    return i;
                }
            }
            //Si no encuentra devuelve -1
            return -1;
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
        /// Pregunta los Datos de alumno
        /// </summary>
        /// <param name="i">Donde se encuentra el contadr</param>
        /// <param name="a">Estructura de tablas</param>
        public static void PreguntarDatosAlumnos(int i, Alumno[] a)
        {
            a[i].num = ExceptionInt(" Nuevo numero del alumno: ");
            a[i].nombre = ExceptionString(" Nuevo nombre del alumno: ");
            a[i].nota = ExceptionInt(" Nueva nota del alumno: ");
        }
        /// <summary>
        /// Metodo que da valores default al alumno
        /// </summary>
        /// <param name="i">ID de la lista donde pondra lso valores</param>
        /// <param name="a">Tabla</param>
        public static void DefaultDatosAlumnos(int i, Alumno[] a)
        {
            a[i].num = 0;
            a[i].nombre = "";
            a[i].nota = 0;
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

        #endregion

        #region Exceptions

        /// <summary>
        /// Excepcion para cuando se introduce un INT
        /// </summary>
        /// <param name="text">Texto a mostrar</param>
        /// <returns></returns>
        public static int ExceptionInt(string text)
        {
            bool success = false;
            int retry = 1;
            int res = 0;
            while (!success && retry > 0)
            {
                try
                {
                    res = PreguntarInt(text);
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
        /// Excepcion para cuando se introduce un STRING
        /// </summary>
        /// <param name="text">Texto a mostrar</param>
        /// <returns></returns>
        public static string ExceptionString(string text)
        {
            bool success = false;
            int retry = 1;
            string res = "";
            while (!success && retry > 0)
            {
                try
                {
                    res = PreguntarString(text);
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
                Console.WriteLine(" 6 - Ordenar");
                Console.WriteLine(" 7 - Busqueda binaria");
                Console.WriteLine(" 8 - Mezclar");
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
                case 6:
                    Ordenar(a, t);
                    break;
                case 7:
                    Console.Clear();
                    int medio = BusquedaBinaria(a); ;
                    Titulos("Busqueda binaria: ");
                    Console.Write("Los datos encontrados para el numero {0} fueron: Nombre {1} y nota {2} ", a[medio].num, a[medio].nombre, a[medio].nota);
                    FinalizarMetodo();
                    break;
                case 8:
                    Alumno[] tabla2 = new Alumno[t];
                    Alumno[] tabla3 = new Alumno[t * 2];
                    Mezclar(a, tabla2, tabla3);
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
            Console.ReadKey();
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
        /// <summary>
        /// Mensaje error
        /// </summary>
        public static void ErrorEntrar()
        {
            Console.Write(" Valor introducido erronamente, introduzca de nuevo: ");

        }
        static void Ordenar(Alumno[] tabla, int N)
        {
            Alumno temp;
            for (int i = 0; i < N; i++)
            {
                for (int j = 0; j < N - 1; j++)
                {
                    if (tabla[i].num < tabla[j].num)
                    {
                        temp.num = tabla[i].num;
                        temp.nota = tabla[i].nota;
                        temp.nombre = tabla[i].nombre;
                        tabla[i].num = tabla[j].num;
                        tabla[i].nombre = tabla[j].nombre;
                        tabla[i].nota = tabla[j].nota;
                        tabla[j].num = temp.num;
                        tabla[j].nombre = temp.nombre;
                        tabla[j].nota = temp.nota;
                    }
                }
            }
        }
        static int BusquedaBinaria(Alumno[] tabla)
        {
            int inicio = 0;
            int fin = tabla.Length;
            int medio = (fin + inicio) / 2;
            int Num = PreguntarInt("Introducir el numero que se desea buscar: ");
            while (tabla[medio].num != Num && inicio < fin)
            {
                if (tabla[medio].num < Num)
                {
                    inicio = medio + 1;
                    medio = (fin + inicio) / 2;
                }
                else
                {
                    fin = medio - 1;
                    medio = (fin + inicio) / 2;
                }
            }
            return (medio);
        }
        static void Mezclar(Alumno[] tabla, Alumno[] tabla2, Alumno[] tabla3)
        {

            for (int a = 0; a < tabla.Length; a++)
            {
                tabla2[a].num = a;
                tabla2[a].nombre = "Alumno " + a;
                tabla2[a].nota = a + 5;
            }

            Ordenar(tabla, tabla.Length);
            int stabla = 0, i = 0, tTabla = 0;
            while (i < tabla.Length && tTabla < tabla.Length)
            {
                ///Si num de tabla 1 es menor que num de tabla 2, va num 1
                if (tabla[i].num < tabla2[tTabla].num)
                {
                    tabla3[stabla].num = tabla[i].num;
                    tabla3[stabla].nombre = tabla[i].nombre;
                    tabla3[stabla].nota = tabla[i].nota;
                    stabla++;
                    i++;
                }
                ///sino va num 2
                else
                {
                    tabla3[stabla].num = tabla2[tTabla].num;
                    tabla3[stabla].nombre = tabla2[tTabla].nombre;
                    tabla3[stabla].nota = tabla2[tTabla].nota;
                    stabla++;
                    tTabla++;
                }
            }
            ///Cuando acaba, si I es igual al tamaño de tabla, significa que la tabla 1 estaba llena
            ///por lo que hay que agregar los campos que faltan de la tabla 2
            if (i == tabla.Length)
            {
                for (; tTabla < tabla.Length; tTabla++)
                {
                    tabla3[stabla].num = tabla2[tTabla].num;
                    tabla3[stabla].nombre = tabla2[tTabla].nombre;
                    tabla3[stabla].nota = tabla2[tTabla].nota;
                    stabla++;
                }
            }
            ///Si no hace lo mismo pero con tabla
            else
            {
                for (; i < tabla.Length; i++)
                {
                    tabla3[stabla].num = tabla[i].num;
                    tabla3[stabla].nombre = tabla[i].nombre;
                    tabla3[stabla].nota = tabla[i].nota;
                    stabla++;
                }
            }
            Console.Clear();
            Titulos("Tabla 3 mezclada:");
            for (int x = 0; x < tabla3.Length; x++)
            {
                Console.WriteLine("Num: {0}\t Nombre: {1}\t Nota: {2}", tabla3[x].num, tabla3[x].nombre, tabla3[x].nota);
            }
            FinalizarMetodo();

        }
    }
    #endregion

}
