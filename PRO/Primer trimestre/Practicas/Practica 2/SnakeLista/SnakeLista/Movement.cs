using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SnakeLista
{
    class Movement
    {
        public static int score = 0;
        private Punto objp = new Punto();
        private List<Punto> p;
        private List<Punto> a;

        ConsoleKeyInfo tecla;

        public void Iniciar()
        {
            p = objp.CrearLista();
            Estilo.SetRainbow();
            a = objp.CrearArrobas();
            Estilo.ColorReset();
            p[p.Count - 1].Borrar();

            do
            {
                //Remapea los valores de los puntos
                objp.Remap(p);
                execMove(CheckCome());
            } while (tecla.Key != ConsoleKey.Escape);
        }

        private bool CheckCome()
        {
            bool res = false;
            if (p[0].x == a[0].x && p[0].y == a[0].y)
            {
                ///Cambios
                score++;
                res = true;
                p.Add(new Punto(a[0].x, a[0].y, "@"));
                ///COME, por lo que llama a GenerarArroba dandole verdadero
                Estilo.SetRainbow();
                objp.GenerarArroba(a, true);
                ///Estilo
                Estilo.ColorReset();
                Console.SetCursorPosition(0, 26);
                Display.Footer();
            }
            return res;
        }
        /// <summary>
        /// Metodo encargado de transformar las pulsaciones de la teclas en movimientos 
        /// </summary>
        private void execMove(bool come)
        {
            //Deja el cursor en la primera posicion
            Console.SetCursorPosition(p[0].x, p[0].y);
            tecla = Console.ReadKey(true);
            switch (tecla.Key)
            {
                case ConsoleKey.DownArrow:
                    Move("down", p, come);
                    break;
                case ConsoleKey.UpArrow:
                    Move("up", p, come);
                    break;
                case ConsoleKey.LeftArrow:
                    Move("left", p, come);
                    break;
                case ConsoleKey.RightArrow:
                    Move("right", p, come);
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// Metodo que se encarga de realizar los movimientos
        /// </summary>
        /// <param name="t">Tecla</param>
        /// <param name="p">Punto</param>
        /// <param name="a">Booleano de si comio o no un arroba</param>
        private void Move(string t, List<Punto> p, bool a)
        {
            switch (t)
            {
                case "left":
                    if (p[0].x == 1)
                    {
                        p[0].Mover(p[0].x, p[0].y);
                        p[0].x = Display.anchura;
                    }
                    else
                    {
                        p[0].Mover(p[0].x - 1, p[0].y);
                    }
                    break;
                case "right":
                    if (p[0].x == Display.anchura)
                    {
                        p[0].Mover(p[0].x, p[0].y);
                        p[0].x = 1;
                    }
                    else
                    {
                        p[0].Mover(p[0].x + 1, p[0].y);
                    }
                    break;
                case "up":
                    if (p[0].y == Display.max + 1)
                    {
                        p[0].Mover(p[0].x, p[0].y);
                        p[0].y = Display.altura + Display.max;
                    }
                    else
                    {
                        p[0].Mover(p[0].x, p[0].y - 1);
                    }
                    break;
                case "down":
                    if (p[0].y == Display.altura + Display.max)
                    {
                        p[0].Mover(p[0].x, p[0].y);
                        p[0].y = Display.max + 1;
                    }
                    else
                    {
                        p[0].Mover(p[0].x, p[0].y + 1);
                    }
                    break;
            }
            if (!a)
            {
                
                p[p.Count - 1].Mostrar(" ");

            }
        }

    }
}
