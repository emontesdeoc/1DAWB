using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NumeroPrimos
{
    class Program
    {
        static void Main(string[] args)
        {
            int cont, maximo, num;

            Console.WriteLine("Introduza numero maximo de primos: ");
            maximo = Convert.ToInt32(Console.ReadLine());
            num = 0;
            cont = 0;
            while(cont < maximo)
            {

                if(num / 1 == num && num / num == 0)
                {
                    Console.WriteLine(num);
                    num++;
                    cont++;

                }
                else
                {
                    num++;


                }

            }
            Console.ReadLine();

        }
    }
}
