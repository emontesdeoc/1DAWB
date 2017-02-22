using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mayor2Numeros
{
    class Program
    {
        static void Main(string[] args)
        {

            int n1, n2;

            Console.WriteLine("Introduzca numero 1: ");
            n1 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Introduzca numero 2: ");
            n2 = Convert.ToInt32(Console.ReadLine());

            if (n1 > n2) { Console.WriteLine("El mayor es " + n1); } else { Console.WriteLine("El mayor es " + n2); }
            Console.ReadLine();
        }
    }
}
