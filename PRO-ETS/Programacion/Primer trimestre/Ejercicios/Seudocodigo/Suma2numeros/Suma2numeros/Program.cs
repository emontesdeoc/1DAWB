using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Suma2numeros
{
    class Program
    {
        static void Main(string[] args)
        {
            int n1, n2, r;

            Console.WriteLine("Introduzca numero 1: ");
            n1 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Introduzca numero 1: ");
            n2 = Convert.ToInt32(Console.ReadLine());

            r = n1 + n2;

            Console.WriteLine("El resultado es: " + r);
            Console.ReadLine();
        }
    }
}
