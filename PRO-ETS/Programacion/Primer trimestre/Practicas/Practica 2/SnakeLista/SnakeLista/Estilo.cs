using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SnakeLista
{
    class Estilo
    {
        public static void SetColores()
        {
            Console.BackgroundColor = ConsoleColor.White;
            Console.ForegroundColor = ConsoleColor.Black;

        }

        public static void ColorReset()
        {
            Console.ResetColor();
            Console.BackgroundColor = ConsoleColor.White;
            Console.ForegroundColor = ConsoleColor.Black;
        }
        public static void SetRainbow()
        {
            Console.ForegroundColor = Rainbow();

        }
        public static ConsoleColor Rainbow()
        {
            Random rnd = new Random();
            int random = rnd.Next(0, 10);

            switch (random)
            {
                case 1:
                    return ConsoleColor.Blue;
                case 2:
                    return ConsoleColor.Red;
                case 3:
                    return ConsoleColor.Cyan;
                case 4:
                    return ConsoleColor.Magenta;
                case 5:
                    return ConsoleColor.DarkGreen;
                case 6:
                    return ConsoleColor.DarkGray;
                case 7:
                    return ConsoleColor.DarkYellow;
                case 8:
                    return ConsoleColor.DarkMagenta;
                case 9:
                    return ConsoleColor.DarkGray;
                case 10:
                    return ConsoleColor.Green;
            }
            return ConsoleColor.Red;
        }
    }
}
