using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica2Snake
{
    public class Juego
    {
        public void Iniciar()
        {
            
            Console.CursorVisible = false;
            ///Acceso clases
            Serpiente snake = new Serpiente();
            Punto punto = new Punto();

            ///Creacion primer arroba
            Punto p2 = new Punto(20, 15, '@');

            List<Punto> p = snake.CrearPuntos();
            ///Movimiento
            new Movimiento().HacerMovimiento(p,p2);
            
        }
    }
}
