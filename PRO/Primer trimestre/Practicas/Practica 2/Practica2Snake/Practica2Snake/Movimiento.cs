using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica2Snake
{
    public class Movimiento
    {
        public void HacerMovimiento(List<Punto> p, Punto p2)
        {
            ///Constante movimiento
            const int INC = 1;

            ///Acceso clases
            Serpiente snake = new Serpiente();
            Punto punto = new Punto();

            ConsoleKeyInfo car;

            do
            {
                ///Si come que agregue, sino que siga borrando el ultimo valor 
                if (p[0].X == p2.X && p[0].Y == p2.Y)
                {
                    ///Agregar punto a la serpiente
                    p.Add(p2);
                    ///Generar punto random para el nuevo arroba
                    Random rnd = new Random();
                    int rX = rnd.Next(2, 20);
                    int rY = rnd.Next(2, 20);
                    foreach (var f in p)
                    {
                        if (rX == f.X || rY == f.Y)
                        {
                            rX = rnd.Next(2, 20);
                            rY = rnd.Next(2, 20);
                        }
                    }
                    p2 = new Punto(rX, rY, '@');
                }
                else
                {
                    p[p.Count - 1].Visualizar(" ");

                }
                ///Cambio de valores
                Serpiente.Mapear(p);


                ///Movimiento
                car = Console.ReadKey(true);
                switch (car.Key)
                {
                    case ConsoleKey.DownArrow:
                        if (p[0].Y == 20)
                        {
                            p[0].Y = 1;
                            p[0].Mover(0, -19);
                        }
                        else
                            p[0].Mover(0, INC);
                        break;
                    case ConsoleKey.UpArrow:
                        if (p[0].Y == 1)
                        {
                            p[0].Mover(0, 19);
                        }
                        else
                            p[0].Mover(0, -INC);
                        break;
                    case ConsoleKey.LeftArrow:
                        if (p[0].X == 1)
                        {
                            p[0].Mover(49, 0);
                        }
                        else
                            p[0].Mover(-INC, 0);
                        break;
                    case ConsoleKey.RightArrow:
                        if (p[0].X == 49)
                        {
                            p[0].X = 1;
                            p[0].Mover(-48, 0);
                        }
                        else
                            p[0].Mover(INC, 0);
                        break;
                    default:
                        break;
                }


            } while (car.Key != ConsoleKey.Escape);
        }
    }
}
