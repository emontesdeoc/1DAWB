using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Refactorizacion
{
    class Program
    {
        const double pi = 3.1415;

        static void Main(string[] args)
        {
            Calculos();

        }

        static void Calculos()
        {

            int a;
            do
            {
                switch (a = MostrarMenu())
                {
                    case 1:
                        TextoResultado(Funcion1().ToString());
                        Console.ReadLine();
                        break;
                    case 2:
                        Console.Write("\nIntroduzca num1: ");
                        TextoResultado(Funcion2(Convert.ToInt32(Console.ReadLine())).ToString());
                        Console.ReadLine();
                        break;
                    case 3:
                        for (int i = 2; i <= 4; i++)
                        {
                            TextoResultado(((pi * i - 1) / pi).ToString());
                        }
                        Console.ReadLine();
                        break;
                }
            } while (a != 0);

        }

        static double Funcion1()
        {
            return (pi * 2);
        }

        static int Funcion2(int num1)
        {
            int aux = num1;
            if (aux < 8)
                for (int i = 0; i <= 5; i++)
                    aux = aux - i;
            else
                aux = aux * 2;

            return (aux);
        }

        static void TextoResultado(string txt)
        {

            Console.WriteLine();
            Console.WriteLine("La visualización del resultado es");
            Console.WriteLine("---------------------------------");
            Console.WriteLine("Para ello tenemos que visualizar los valores");
            Console.WriteLine("--------------------------------------------");
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("Resu: {0}", txt);

        }

        static int MostrarMenu()
        {
            Console.Clear();
            Console.WriteLine("1.- Funcion1");
            Console.WriteLine("2.- Funcion2");
            Console.WriteLine("3.- Resultado");
            Console.WriteLine("0.- Salir");
            Console.Write("Opción: ");

            return Convert.ToInt32(Console.ReadLine());

        }
    }
}


