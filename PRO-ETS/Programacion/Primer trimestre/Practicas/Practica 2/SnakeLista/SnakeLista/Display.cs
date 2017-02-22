using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SnakeLista
{
    class Display
    {
        public static int origAltura, altura;
        public static int origAnchura, anchura;
        public static int max = 10;

        /// <summary>
        /// Detecta el tamaño de la consola
        /// </summary>
        public static void TamañoConsola()
        {
            origAltura = Console.WindowHeight;
            origAnchura = Console.WindowWidth;

            altura = origAltura / 2;
            anchura = origAnchura / 2;
        }
        /// <summary>
        /// Genera el marco
        /// </summary>
        public static void Marco()
        {
            Estilo.SetColores();
            Console.Clear();
            TamañoConsola();
            Console.SetWindowSize(62, 35);
            Console.CursorVisible = false;
            Display.Titulo();

            ///Se posiciona donde empezara a escribir
            
            
            ///Primera linea del marco
            Console.SetCursorPosition(0, max);
            Console.Write("╔");

            for (int i = 0; i < anchura; i++)
            {
                Console.Write("═");
            }
            Console.Write("╗");

            ///Contorno lateral del marco
            for (int i = 0; i < altura; i++)
            {
                Console.WriteLine("");
                Console.Write("║");
                for (int o = 0; o < anchura; o++)
                {
                    Console.Write(" ");
                }
                Console.Write("║");
            }
            ///Ultima linea del marco
            Console.WriteLine("");
            Console.Write("╚");

            for (int i = 0; i < anchura; i++)
            {
                Console.Write("═");
            }
            Console.Write("╝");
            Console.SetCursorPosition(0, 26);

            Footer();


        }
        /// <summary>
        /// Genera el titulo 
        /// </summary>
        public static void Titulo()
        {
            Console.Write("╔");
            for (int i = 0; i < anchura; i++)
            {
                Console.Write("═");
            }
            Console.Write("╗");
            Console.WriteLine("");
            Console.WriteLine("║\t ######  ##    ##    ###    ##    ## ########\t     ║");
            Console.WriteLine("║\t##    ## ###   ##   ## ##   ##   ##  ##\t\t     ║  ");
            Console.WriteLine("║\t##       ####  ##  ##   ##  ##  ##   ##\t\t     ║  ");
            Console.WriteLine("║\t ######  ## ## ## ##     ## #####    ######\t     ║ ");
            Console.WriteLine("║\t      ## ##  #### ######### ##  ##   ##\t\t     ║    ");
            Console.WriteLine("║\t##    ## ##   ### ##     ## ##   ##  ##\t\t     ║  ");
            Console.WriteLine("║\t ######  ##    ## ##     ## ##    ## ########\t     ║");
            Console.Write("╚");

            for (int i = 0; i < anchura; i++)
            {
                Console.Write("═");
            }
            Console.Write("╝");
        }
        /// <summary>
        /// Genera el footer
        /// </summary>
        public static void Footer()
        {

            Console.WriteLine("");
            Console.WriteLine("");

            Console.Write("╔");

            for (int i = 0; i < anchura; i++)
            {
                Console.Write("═");
            }
            Console.Write("╗");
            Console.WriteLine("");
            Console.WriteLine("║\t\t\t\t\t\t\t     ║");
            Console.WriteLine("║\t\t\t\t Flechas para mover \t     ║");
            Console.WriteLine("║\t Puntuacion: {0}\t\t\t\t\t     ║", Movement.score);
            Console.WriteLine("║\t\t\t\t Escape para salir \t     ║");
            Console.WriteLine("║\t\t\t\t\t\t\t     ║");

            Console.Write("╚");

            for (int i = 0; i < anchura; i++)
            {
                Console.Write("═");
            }
            Console.Write("╝");
        }
    }
}
