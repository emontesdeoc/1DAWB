using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Serie
{
    class Program
    {
        public static void Main(string[] args)
        {
            //variables
            int n, d, contador, cantidad; //par;
            //inicializacion
            cantidad = 0;
            contador = 0;
            n = 0;
            d = 0;
            //programa
            Console.Write("Seleccione una cantidad: ");
            cantidad = Convert.ToInt32(Console.ReadLine());
            //bucle hasta que llegue a la cantidad
            while (contador < cantidad)
            {
                //par = contador % 2;
                //si es par suma n
                if (contador % 2 == 0)
                {
                    n = n + 1;
                    Console.WriteLine(n + "/" + d);
                    contador++;
                }
                //si no es par suma d
                else
                {
                    d = d + 1;
                    Console.WriteLine(n + "/" + d);
                    contador++;
                }
            }
            Console.WriteLine("Fin!");
            Console.ReadLine();

        }
    }
}
