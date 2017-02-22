using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Snake
{
    class Program
    {
        static void Main(string[] args)
        {

            Display.Marco();

            Punto p1 = new Punto(5, 10, "*");
            Punto p2 = new Punto(5, 9, "*");
            Punto p3 = new Punto(5, 8, "*");
            Punto p4 = new Punto(5, 7, "*");
            Punto p5 = new Punto(5, 6, "*");


            ConsoleKeyInfo tecla;
            
            do
            {

                tecla = Console.ReadKey(true);
                switch (tecla.Key)
                {
                    case ConsoleKey.DownArrow:
                        p5.Borrar(p5);
                        p1.Mover(p1, p1.x + 0, p1.y + 1);
                        p2.Mover(p2, p1.x, p1.y);
                        p3.Mover(p3, p2.x, p2.y);
                        p4.Mover(p4, p3.x, p3.y);
                        //p5.Borrar(p5);
                        p5.Mover(p5, p4.x, p4.y);


                        break;
                    case ConsoleKey.UpArrow:
                        p1.Mover(p1, p1.x + 0, p1.y - 1);
                        p2.Mover(p2, p1.x, p1.y);
                        p3.Mover(p3, p2.x, p2.y);
                        p4.Mover(p4, p3.x, p3.y);
                        //p5.Borrar(p5);
                        p5.Mover(p5, p4.x, p4.y);


                        break;
                    case ConsoleKey.LeftArrow:
                        p1.Mover(p1, p1.x - 1, p1.y + 0);
                        p2.Mover(p2, p1.x, p1.y);
                        p3.Mover(p3, p2.x, p2.y);
                        p4.Mover(p4, p3.x, p3.y);
                        //p5.Borrar(p5);
                        p5.Mover(p5, p4.x, p4.y);

                        break;
                    case ConsoleKey.RightArrow:
                        p1.Mover(p1, p1.x + 1, p1.y + 0);
                        p2.Mover(p2, p1.x, p1.y);
                        p3.Mover(p3, p2.x, p2.y);
                        p4.Mover(p4, p3.x, p3.y);
                        //p5.Borrar(p5);
                        p5.Mover(p5, p4.x, p4.y);
                        break;
                    default:
                        break;
                }
            } while (tecla.Key != ConsoleKey.Escape); ;



            Console.ReadLine();
        }
    }
}
