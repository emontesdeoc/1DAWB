using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SnakeLista
{
    public class Punto
    {
        /// <summary>
        /// Coordenadas del punto
        /// </summary>
        public int x, y;
        /// <summary>
        /// Letra a mostrar
        /// </summary>
        public string s;
        public Punto()
        {

        }
        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="x">X incial</param>
        /// <param name="y">Y inicial</param>
        /// <param name="s">Letra a mostrar</param>
        public Punto(int x, int y, string s)
        {
            this.x = x;
            this.y = y;
            this.s = s;
            Mostrar(s);
        }
        /// <summary>
        /// Metodo que se encarga de crear la lista de puntos dandole yo unos valores
        /// </summary>
        /// <returns></returns>
        public List<Punto> CrearLista()
        {
            //Utilizando la clase randomizer para generar un punto aleatorio donde aparecera la serpiente
            Random rnd = new Random();
            int newX = 0;
            int newY = 0;
            //Si gene

            newX = rnd.Next(10, 30);
            newY = rnd.Next(11, 19);

            List<Punto> ListaPuntos = new List<Punto> {
            new Punto(newX, newY + 5, "°"),
            new Punto(newX, newY + 4, "°"),
            new Punto(newX, newY + 3, "°"),
            new Punto(newX, newY + 2, "°"),
            new Punto(newX, newY + 1, "°"),
            new Punto(newX, newY + 0, "°"),
            };
            return ListaPuntos;
        }
        public void GenerarArroba(List<Punto> a, bool borrar = true)
        {
            Random rnd = new Random();
            int newX2 = 0;
            int newY2 = 0;
            newX2 = rnd.Next(2, Display.anchura - 1);
            newY2 = rnd.Next(Display.max + 1, Display.max + 15);
            if (borrar)
            {
                //Borra el punto
                a[0].Borrar();
                a[0].Mostrar("°");
            }
            //Genera un punto random
            a[0].MoverPunto(a[0], newX2, newY2);
        }
        public List<Punto> CrearArrobas()
        {
            //Utilizando la clase randomizer para generar un punto aleatorio donde aparecera la serpiente

            Random rnd = new Random();
            List<Punto> ListaArrobas = new List<Punto> {
            new Punto(5, 20, "@"),
            };
            return ListaArrobas;
        }
        /// <summary>
        /// Metodo que mueve el punto
        /// </summary>
        /// <param name="p">Lista de puntos</param>
        /// <param name="newX">Nuevo X donde estara el punto</param>
        /// <param name="newY">Nueva Y donde estara el punto</param>
        public void Mover(int newX, int newY)
        {
            this.x = newX;
            this.y = newY;
            this.s = "°";
            Mostrar("°");
        }
        public void MoverPunto(Punto p, int newX, int newY)
        {
            this.x = newX;
            this.y = newY;
            this.s = "*";
            Mostrar("@");
        }
        /// <summary>
        /// Cambia los valores de los puntos por el siguiente, 
        /// asi se consigue hacer efecto de serpiente, este metodo se llama cuando se han mostrado los 
        /// valores anteriores
        /// </summary>
        /// <param name="p"></param>
        public void Remap(List<Punto> p)
        {
            for (int i = p.Count - 1; i > 0; i--)
            {
                p[i].y = p[i - 1].y;
                p[i].x = p[i - 1].x;
            }
        }
        /// <summary>
        /// Muestra el punto
        /// </summary>
        /// <param name="p">Lista de puntos</param>
        /// <param name="s"></param>
        public void Mostrar(string s)
        {
            Console.SetCursorPosition(this.x, this.y);
            Console.Write(s);
        }

        public void Borrar()
        {
            Console.SetCursorPosition(this.x, this.y);
            Console.Write(" ");

        }

    }
}
