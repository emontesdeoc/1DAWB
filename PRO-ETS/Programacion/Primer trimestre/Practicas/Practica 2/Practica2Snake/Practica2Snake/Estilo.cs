using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica2Snake
{
    class Estilo
    {
        public static void Marco()
        {
            Console.Write("╔");
            for (int x = 0; x < 52; x++)
            {
                Console.Write("═");
            }
            Console.Write("╗");
            for (int y = 0; y < 20; y++)
            {
                Console.WriteLine("");
                Console.Write("║");
                for (int x = 0; x < 50; x++)
                {
                    Console.Write(" ");
                }
                Console.Write("║");
            }
            Console.WriteLine("");
            Console.Write("╚");
            for (int i = 0; i < 52; i++)
            {
                Console.Write("═");
            }
            Console.Write("╝");
        }
    }
}
