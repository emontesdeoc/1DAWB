using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{

    class Program
    {


        static void Main(string[] args)
        {
            bool estado = true;

            while (estado)
            {
                int c = 0;
                while (c <= 0)
                {
                    c = LeerNumero("Introduzca cantidad: ");
                }
                Fibonacci(c);
                estado = Continuar(Pregunta());
            }
        }
        /// <summary>
        /// Funcion que lee numero
        /// </summary>
        /// <param name="text">Texto para mostrar</param>
        /// <returns></returns>
        static int LeerNumero(string text)
        {
            int res = 0;
            Console.Write("\n" + text);
            res = Convert.ToInt32(Console.ReadLine());
            return res;
        }
        /// <summary>
        /// Metodo que calcula la serie de fibonacci
        /// </summary>
        /// <param name="c">Cantidad de numeros fibonacci</param>
        static void Fibonacci(int c)
        {
            int n1 = 1, n2 = 0;

            for (int i = 0; i < c; i++)
            {
                n1 = n1 + n2;
                n2 = n1 - n2;
                Console.Write(n1 + " ");
            }
        }
        /// <summary>
        /// Preguntar si quiere continuar
        /// </summary>
        /// <returns></returns>
        static int Pregunta()
        {
            int res = 0;
            Console.WriteLine("\nQuiere continuar? 1 - si ¦ 2 - no");
            res = Convert.ToInt32(Console.ReadLine());
            return res;
        }
        /// <summary>
        /// Continuar dependiendo de lo que ponga el usuario
        /// </summary>
        /// <param name="res">El numero que pone el usuario</param>
        /// <returns></returns>
        static bool Continuar(int res)
        {
            bool estado = false;
            switch (res)
            {
                default:
                    Console.WriteLine("Vuelve a empezar");
                    break;
                case 1:
                    estado = true;
                    break;
                case 2:
                    estado = false;
                    break;

            }
            return estado;
        }
    }
}

