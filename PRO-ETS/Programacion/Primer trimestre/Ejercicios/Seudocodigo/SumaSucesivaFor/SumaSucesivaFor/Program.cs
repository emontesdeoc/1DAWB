using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SumaSucesivaFor
{
    class Program
    {
        static void Main(string[] args)
        {
            int n1, n2, r, i;
            n1 = 2;
            n2 = 4;

            for(i = 1, r = 0; i <= n2; i++)
            {
                r = r + n1;

            }
            Console.WriteLine(r);
            Console.ReadLine();
        }
    }
}
