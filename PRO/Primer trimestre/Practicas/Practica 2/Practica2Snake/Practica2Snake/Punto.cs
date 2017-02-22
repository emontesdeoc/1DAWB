using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica2Snake
{
    public class Punto
    {
        private int x, y;
        private char caracter;
        private int finx, finy;

        public Punto(int x1, int y1, char car1)
        {
            x = x1;
            y = y1;
            caracter = car1;
            finx = 50;
            finy = 20;
            Visualizar();
        }
        public Punto()
        { }
        public void Visualizar()
        {
            Console.SetCursorPosition(x, y);
            Console.Write(caracter);
        }
        public void Visualizar(string a)
        {
            Console.SetCursorPosition(x, y);
            Console.Write(a);
        }
        public void Borrar()
        {
            Console.SetCursorPosition(x, y);
            Console.Write(' ');
        }
        public void Mover(int incx, int incy)
        {
            //Borrar();
            x += incx;
            y += incy;
            Visualizar();

        }
        public int X { get { return x; } set { x = value; } }
        public int Y { get { return y; } set { y = value; } }
    }
}
