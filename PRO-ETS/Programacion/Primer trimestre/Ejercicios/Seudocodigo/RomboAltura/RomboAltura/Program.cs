using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RomboAltura
{
    class Program
    {
        static void Main(string[] args)
        {

            int n = Altura("Dime la altura del rombo");
            Rombo(n);
            Console.ReadLine();

        }
        static int Altura(string text)
        {
            int res = 0;
            Console.WriteLine(text);
            res = Convert.ToInt32(Console.ReadLine());
            return res;
        }

        /// <summary>
        /// Metodo para imprimir un rombo-...
        /// </summary>
        /// <param name="n">Equivale a la altura del rombo.</param>
        static void Rombo(int n)
        {
            int c, e, a, acc, m;

            for (c = 0, acc = n, m = n * 2; c < m; c += 2, acc--)
            {
                Console.WriteLine("");
                for (e = 0; e < acc; e++)
                {
                    Console.Write(" ");
                }
                for (a = 0; a <= c; a++)
                {
                    Console.Write("*");
                }
            }
            for (c = 2, acc = m - 4; c < m; c++, acc -= 2)
            {
                Console.WriteLine("");
                for (e = 0; e < c; e++)
                {
                    Console.Write(" ");
                }
                for (a = 0; a <= acc; a++)
                {
                    Console.Write("*");
                }
                if (c > n)
                {
                    break;
                }
            }
            Console.WriteLine("");
            Console.WriteLine("Fin del rombo");

        }
    }
}
