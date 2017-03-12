using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Refactorizacion
{
    class Program
    {
        static void Main(string[] args)
        {

            Calculos();

        }

        static void Calculos()
        {
            int op = MostrarMenu();
            do
            {
                int num1;
                double resu;

                switch (op)
                {
                    case 1:
                        resu = funcion1();
                        TextoResultado(resu.ToString());
                        break;
                    case 2:
                        Console.Write("\nIntroduzca num1: ");
                        num1 = Convert.ToInt32(Console.ReadLine());
                        resu = funcion2(num1);
                        TextoResultado(resu.ToString());
                        break;
                    case 3:
                        resu = (3.1415 * 2 - 1) / 3.1415;
                        TextoResultado(resu.ToString());
                        resu = (3.1415 * 3 - 1) / 3.1415;
                        TextoResultado(resu.ToString());
                        resu = (3.1415 * 4 - 1) / 3.1415;
                        TextoResultado(resu.ToString());
                        break;
                }
            } while (MostrarMenu() != 0);

        }

        static double funcion1()
        {
            double resu;
            resu = 3.1415 + 3.1415;
            return (resu);
        }

        static int funcion2(int num1)
        {
            if (num1 < 0)
                for (int i = 0; i < 5; i++)
                    num1 = num1 - i;
            else if (num1 >= 0 && num1 <= 4)
                for (int i = 0; i < 5; i++)
                    num1 = num1 - i;
            else if (num1 >= 5 && num1 <= 7)
                for (int i = 0; i < 5; i++)
                    num1 = num1 - i;
            else
                num1 = num1 * 2;
            return (num1);
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
            Console.ReadLine();
        }

        static int MostrarMenu()
        {
            int a = 0;

            Console.Clear();
            Console.WriteLine("1.- Funcion1");
            Console.WriteLine("2.- Funcion2");
            Console.WriteLine("3.- Resultado");
            Console.WriteLine("0.- Salir");
            Console.Write("Opción: ");

            a = Convert.ToInt32(Console.ReadLine());

            return a;

        }
    }
}


