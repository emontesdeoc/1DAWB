using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoverPunto
{
    class Display
    {
        public static int origAltura, altura;
        public static int origAnchura, anchura;

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
            Console.Clear();
            TamañoConsola();
            //Console.SetWindowSize(anchura, altura);

            for (int i = 0; i < anchura + 2; i++)
            {
                Console.Write("*");

            }
            for (int i = 0; i < altura; i++)
            {
                Console.WriteLine("");
                Console.Write("*");
                for (int o = 0; o < anchura; o++)
                {
                    Console.Write(" ");
                    
                }
                Console.Write("*");

            }
            Console.WriteLine("");
            for (int i = 0; i < anchura + 2; i++)
            { 
                Console.Write("*");
            }

        }
        /// <summary>
        /// Escribe el punto en la cnosola
        /// </summary>
        /// <param name="s">Que escribir</param>
        /// <param name="x">Posicion de la X</param>
        /// <param name="y">Posicion de la Y</param>
        public static void EscribirPunto(string s, int x, int y)
        {
            Console.SetCursorPosition(x, y);
            Console.Write(s);
          

        }

    }
}
