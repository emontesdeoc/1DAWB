using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Media3Numeros
{
    class Program
    {
        static void Main(string[] args)
        {
            int n1, n2, n3, m;

            Console.Write("Introduzca numero 1: ");
            n1 = Convert.ToInt32(Console.ReadLine());

            Console.Write("Introduzca numero 2: ");
            n2 = Convert.ToInt32(Console.ReadLine());

            Console.Write("Introduzca numero 3: ");
            n3 = Convert.ToInt32(Console.ReadLine());

            m = (n1 + n2 + n3) / 3;

            Console.WriteLine("La media entre {0}, {1} y {2} es {3}", n1, n2, n3, m);
            Console.ReadLine();
        }
    }
}
