using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NumeroPerfecto
{
    class Program
    {
        static void Main(string[] args)
        {
            int n;
            n = Pregunta("Dime un numero: ");
            NumeroPerfecto(n);
        }
        /// <summary>
        /// Calcular el numero perfecto
        /// </summary>
        /// <param name="n">Valor del numero</param>
        static void NumeroPerfecto(int n)
        {
            int m, s, i;
            if (n > 0)
            {
                for (i = 1, s = 0, m = n / 2; i <= m; i++)
                {
                    if (n % i == 0)
                    {
                        s = s + i;
                    }
                }
                if (n == s)
                {
                    Console.WriteLine("El numero {0} es perfecto", n);
                }
                else
                {
                    Console.WriteLine("El numero {0} no es perfecto", n);
                }
            }
            else
            {
                Console.WriteLine("El numero introducido no es valido.");
            }
            Console.ReadLine();
        }

        /// <summary>
        /// Pregunta sobre un numero y devuelve el valor
        /// </summary>
        /// <param name="texto">Texto a mostrar</param>
        /// <returns></returns>
        static int Pregunta(string texto)
        {
            int r = 0;
            Console.WriteLine(texto);
            r = Convert.ToInt32(Console.ReadLine());
            return r;
        }
    }
}
