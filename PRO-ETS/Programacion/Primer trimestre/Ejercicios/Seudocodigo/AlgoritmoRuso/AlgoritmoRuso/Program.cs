using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlgoritmoRuso
{
    class Program
    {
        static void Main(string[] args)
        {
            int pf, sf, ac;

            Console.Write("Introduzca PF: ");
            pf = Convert.ToInt32(Console.ReadLine());
            Console.Write("Introduzca SF: ");
            sf = Convert.ToInt32(Console.ReadLine());
            ac = 0;

            while (sf > 0)
            {

                if (sf % 2 != 0)
                {
                    ac = ac + pf;
                }
                pf = pf * 2;
                sf = sf / 2;

            }
            Console.WriteLine("El resultado es: " + ac);
            Console.ReadLine();
        }
    }
}
