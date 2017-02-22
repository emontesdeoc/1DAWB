using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VisualizarNnumeroPares
{
    class Program
    {
        static void Main(string[] args)
        {
            int n, c, cont;
            Console.Write("Introduzca primer numero: ");
            n = Convert.ToInt32(Console.ReadLine());
            Console.Write("Introduzca cuantos numeros pares: ");
            c = Convert.ToInt32(Console.ReadLine());
            cont = 0;
            if (n % 2 == 0)
            {
                while (cont < c)
                {
                    n = n + 2;
                    Console.WriteLine(n);
                    cont++;
                }

            }
            else
            {
                n = n + 1;
                Console.WriteLine(n);
                while (cont < (c - 1))
                {
                    n = n + 2;
                    Console.WriteLine(n);
                    cont++;

                }


            }
            Console.ReadLine();

        }
    }
}
