using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TodoEnUno
{
    class Program
    {
        static void Main(string[] args)
        {
            int a;
            bool seguir = true;
            do
            {

                Console.WriteLine("Seguir?");
                int v = PreguntarInt("1 - Si 2 - No");
                if (v == 1)
                {
                    seguir = true;
                }
                else
                {
                    seguir = false;
                }

                do
                {
                    ImprimirMenu();
                    a = PreguntarInt("Eliga una opcion: ");
                    Console.WriteLine("----------------------");
                    Selector(a);
                    Console.Clear();

                } while (a > 5 || a <= 0);
            } while (seguir);

        }

        static void ImprimirMenu()
        {
            Console.WriteLine("Menu");
            Console.WriteLine("----------------------");
            Console.WriteLine("1 - Sumar 2 numeros");
            Console.WriteLine("2 - Sumar X numeros");
            Console.WriteLine("3 - Restar 2 numeros");
            Console.WriteLine("4 - Multiplicar 2 numeros");
            Console.WriteLine("5 - Multiplicar X numeros");
            Console.WriteLine("0 - Salir");
            Console.WriteLine("----------------------");
        }

        static int PreguntarInt(string text)
        {
            int res = 0;
            Console.Write(text);
            res = Convert.ToInt32(Console.ReadLine());
            return res;
        }

        static void Selector(int v)
        {
            switch (v)
            {
                case 1:
                    Sumar2Numeros();
                    break;

                case 2:
                    SumarXNumeros();
                    break;

                case 3:
                    Restar2Numeros();
                    break;

                case 4:
                    Multiplicar2Numeros();
                    break;

                case 5:
                    MultiplicarXNumeros();
                    break;

                default:

                    break;
            }

        }

        //Operaciones matematicas
        static void Sumar2Numeros()
        {
            int n1 = PreguntarInt("Dime numero 1: ");
            int n2 = PreguntarInt("Dime numero 2: ");
            int r = n1 + n2;
            Console.WriteLine("El resultado es {0}", r);
            Console.ReadLine();
        }
        static void Restar2Numeros()
        {
            int n1 = PreguntarInt("Dime numero 1: ");
            int n2 = PreguntarInt("Dime numero 2: ");
            int r = n1 - n2;
            Console.WriteLine("El resultado es {0}", r);
            Console.ReadLine();
        }
        static void SumarXNumeros()
        {
            int c = PreguntarInt("Cantidad de numeros a sumar?: ");
            int[] numeros = new int[c];
            int r = 0;
            for (int i = 0; i < c; i++)
            {
                numeros[i] = PreguntarInt("Dime el numero " + i + ": ");
                r = r + numeros[i];
            }
            Console.WriteLine("El resultado es {0}", r);
            Console.ReadLine();
        }
        static void Multiplicar2Numeros()
        {
            int n1 = PreguntarInt("Dime numero 1: ");
            int n2 = PreguntarInt("Dime numero 2: ");
            int r = n1 * n2;
            Console.WriteLine("El resultado es {0}", r);
            Console.ReadLine();
        }
        static void MultiplicarXNumeros()
        {
            int c = PreguntarInt("Cantidad de numeros a sumar?: ");
            int[] numeros = new int[c];
            int r = 0;
            for (int i = 0; i < c; i++)
            {
                numeros[i] = PreguntarInt("Dime el numero " + i + ": ");
                r = r * numeros[i];
            }
            Console.ReadLine();
        }
    }
}
