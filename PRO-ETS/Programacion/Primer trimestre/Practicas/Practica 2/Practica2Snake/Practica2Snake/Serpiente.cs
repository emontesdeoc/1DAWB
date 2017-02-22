using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica2Snake
{
    public class Serpiente
    {
        /// <summary>
        /// Crea la serpiente
        /// </summary>
        /// <returns></returns>
        public List<Punto> CrearPuntos()
        {
            int newX = 10;
            int newY = 10;

            List<Punto> ListaPuntos = new List<Punto>();
            Punto p1 = new Punto();

            for (int i = 5 + 1; i > 0; i--)
            {
                p1 = new Punto(newX, newY + i, '°');
                ListaPuntos.Add(p1);
            }
            return ListaPuntos;
        }
        public static void Mapear(List<Punto> p)
        {
            for (int i = p.Count - 1; i > 0; i--)
            {
                p[i].Y = p[i - 1].Y;
                p[i].X = p[i - 1].X;
            }
        }
    }
}
