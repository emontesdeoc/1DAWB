using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            //variables

            string texto, texto1;

            Console.Write("escribe hola");
            texto = "hola";

            texto1 = Console.ReadLine();

            if(texto1 == texto)
            {

                Console.WriteLine("pusiste hola");

            }
            else
            {
                Console.WriteLine("no pusiste hola");

            }
            Console.ReadLine();

        }
    }
}
