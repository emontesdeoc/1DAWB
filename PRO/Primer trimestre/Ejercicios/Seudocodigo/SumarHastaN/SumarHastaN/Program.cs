using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SumarHastaN
{
    class Program
    {
        static void Main(string[] args)
        {
            int n, f;
            n = 0;
            Console.Write("Introduzca numero final:  ");
            f = Convert.ToInt32(Console.ReadLine());

            while (n < f)
            {

                n = n + 1;
                Console.WriteLine(n);

            }
            Console.ReadLine();


        }
    }
}
