using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MinimoComunMultiplo
{
    class Program
    {
        static void Main(string[] args)
        {
            int num1, num2, resu, contador;
            contador = 1;

            Console.Write("Introduzca numero 1: ");
            num1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Introduzca numero 2: ");
            num2 = Convert.ToInt32(Console.ReadLine());
            resu = num1;

            while (contador < resu)
            {
                resu = num1 * contador;
                if (resu % num2 == 0)
                {
                    contador = resu;
                }
                else //if (resu % num2 != 0)
                {
                    contador++;
                }
            }
            Console.WriteLine("El minimo comun multiplo es: " + resu);
            Console.ReadLine();

        }
    }
}
