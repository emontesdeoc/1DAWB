using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoverPunto
{
    class Movement
    {
        /// <summary>
        /// Punto X actual
        /// </summary>
        public static int currentX;
        /// <summary>
        /// Punto Y actual
        /// </summary>
        public static int currentY;
        /// <summary>
        /// Nuevo punto X
        /// </summary>
        public static int newX;
        /// <summary>
        /// Nuevo punto Y
        /// </summary>
        public static int newY;

        /// <summary>
        /// Menu para realizar movimiento
        /// </summary>
        public static void MoverOpciones()
        {
            ConsoleKeyInfo tecla;
            RandomPunto();
            do
            {
                tecla = Console.ReadKey(true);
                switch (tecla.Key)
                {
                    case ConsoleKey.DownArrow:
                        MoverAbajo(newX, newY);
                        break;
                    case ConsoleKey.UpArrow:
                        MoverArriba(newX, newY);
                        break;
                    case ConsoleKey.LeftArrow:
                        MoverIzquierda(newX, newY);
                        break;
                    case ConsoleKey.RightArrow:
                        Moverderecha(newX, newY);
                        break;
                    default:
                        break;
                }
            } while (tecla.Key != ConsoleKey.Escape); ;
        }

        /// <summary>
        /// Genera un punto random
        /// </summary>
        public static void RandomPunto()
        {
            Random rnd = new Random();

            int newX = rnd.Next(0, Display.anchura);
            int newY = rnd.Next(0, Display.altura);
            Display.EscribirPunto("@", newX, newY);
            currentX = newX;
            currentY = newY;
        }
        /// <summary>
        /// Mover punto para abajo
        /// </summary>
        /// <param name="x">Punto X actual</param>
        /// <param name="y">Punto Y actual</param>
        public static void MoverAbajo(int x, int y)
        {
            if (currentY == Display.altura)
            {
                Display.EscribirPunto(" ", currentX, currentY);
                currentY = 1;
                MoverAbajo(newX, newY);
            }
            else
            {
                Display.EscribirPunto(" ", currentX, currentY);
                currentX = currentX + 0;
                currentY = currentY + 1;
                Display.EscribirPunto("@", currentX, currentY);
            }
        }
        /// <summary>
        /// Mover punto para arriba
        /// </summary>
        /// <param name="x">Punto X actual</param>
        /// <param name="y">Punto Y actual</param>
        public static void MoverArriba(int x, int y)
        {
            if (currentY == 1)
            {
                Display.EscribirPunto(" ", currentX, currentY);
                currentY = Display.altura;
                MoverArriba(newX, newY);
            }
            else
            {
                Display.EscribirPunto(" ", currentX, currentY);
                Display.EscribirPunto("@", currentX + 0, currentY - 1);
                currentX = currentX + 0;
                currentY = currentY - 1;
            }

        }
        /// <summary>
        /// Mover punto para la izquierda
        /// </summary>
        /// <param name="x">Punto X actual</param>
        /// <param name="y">Punto Y actual</param>
        public static void MoverIzquierda(int x, int y)
        {
            if (currentX == 1)
            {
                Display.EscribirPunto(" ", currentX, currentY);
                currentX = Display.anchura;
                MoverIzquierda(newX, newY);
            }
            else
            {
                Display.EscribirPunto(" ", currentX, currentY);
                Display.EscribirPunto("@", currentX - 1, currentY + 0);
                currentX = currentX - 1;
                currentY = currentY + 0;
            }

        }
        /// <summary>
        /// Mover punto para la derecha
        /// </summary>
        /// <param name="x">Punto X actual</param>
        /// <param name="y">Punto Y actual</param>
        public static void Moverderecha(int x, int y)
        {
            if (currentX == Display.anchura)
            {
                Display.EscribirPunto(" ", currentX, currentY);
                currentX = 1;
                Moverderecha(newX, newY);
            }
            else
            {
                Display.EscribirPunto(" ", currentX, currentY);
                currentX = currentX + 1;
                currentY = currentY + 0;
                Display.EscribirPunto("@", currentX, currentY);
            }

        }

    }
}
