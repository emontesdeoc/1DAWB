using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Snake
{
    public class Punto
    {
        public int x, y;
        public string s;
        public Punto(int x, int y, string s)
        {
            this.x = x;
            this.y = y;
            this.s = s;
            Mostrar(this);
        }
        public void Mover(Punto p, int newX, int newY)
        {
            p.x = newX;
            p.y = newY;
            p.s = "*";
            Mostrar(p);

        }
        public void Mostrar(Punto p)
        {
            Console.SetCursorPosition(p.x, p.y);
            Console.Write(p.s);
        }
        public void Borrar(Punto p)
        {
            Console.SetCursorPosition(p.x,p.y);
            Console.Write(" ");

        }
    }
}
