using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RaizDeNumero
{
    class Program
    {
        static void Main(string[] args)
        {
            int num, contador, impar;
            Console.Write("Introduzca numero: ");
            num = Convert.ToInt32(Console.ReadLine());
            contador = 0;
            impar = 1;

            while(contador <= num)
            {
                num = num - impar;
                impar = impar + 2;
                contador++;
            }
            Console.WriteLine("La raiz es: " + contador);
            Console.ReadLine();
            
        }
    }
}
