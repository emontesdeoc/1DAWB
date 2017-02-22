using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace factorial
{
    class Program
    {
        static void Main(string[] args)
        {
            int n;
            n = Pregunta("Introduce un numero: ");
            Factorial(n);
        }
        /// <summary>
        /// Pregunta sobre el numero 
        /// </summary>
        /// <param name="texto">Que preguntar</param>
        /// <returns>Devuelve el numero introducido</returns>
        static int Pregunta(string texto)
        {
            int resu = 0;
            Console.WriteLine(texto);
            resu = Convert.ToInt32(Console.ReadLine());
            return resu;
        }
        /// <summary>
        /// Realiza el factorial de u numero
        /// </summary>
        /// <param name="n">Numero</param>
        static void Factorial(int n)
        {
            int f = n;
            for (int i = 1; i < f; i++)
            {
                n = n * i;
            }
            Console.Write("El factorial de {0} es {1}", f, n);
            Console.ReadLine();
        }
    }
}
