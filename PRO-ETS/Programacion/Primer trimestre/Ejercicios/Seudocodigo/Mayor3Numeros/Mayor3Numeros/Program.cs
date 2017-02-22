using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mayor3Numeros
{
    class Program
    {
        static void Main(string[] args)
        {
            int n1, n2, n3;

            Console.WriteLine("Introduzca el numero 1: ");
            n1 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Introduzca el numero 2: ");
            n2 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Introduzca el numero 3: ");
            n3 = Convert.ToInt32(Console.ReadLine());

            if (n1 > n2 && n1 > n3)
            {

                Console.WriteLine("El mayor es el " + n1);

            }
            else
            {
                if (n2 > n3)
                {

                    Console.WriteLine("El mayor es el " + n2);
                }
                else
                {

                    Console.WriteLine("El mayor es el " + n3);
                }


            }
            Console.ReadLine();
        }
    }
}
