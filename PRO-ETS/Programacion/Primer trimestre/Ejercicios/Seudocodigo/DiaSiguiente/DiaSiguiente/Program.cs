using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DiaSiguiente
{
    class Program
    {
        static void Main(string[] args)
        {
            int d, m, a, ms, dias;
            d = Preguntar("Introduzca dia: ");
            m = Preguntar("Introduzca mes: ");
            a = Preguntar("Introduzca año: ");
            ms = m;
            dias = GetDiasMes(m, 0, a);
            CambiarAño(d, a, m, dias, ms);
        }
        /// <summary>
        /// Preguntar sobre un entero
        /// </summary>
        /// <param name="texto">Que preguntar</param>
        /// <returns></returns>
        static int Preguntar(string texto)
        {
            int res = 0;
            Console.Write(texto);
            res = Convert.ToInt32(Console.ReadLine());
            return res;
        }
        /// <summary>
        /// Obtener dias del mes
        /// </summary>
        /// <param name="m">Mes</param>
        /// <param name="dias">Dias(=0)</param>
        /// <param name="a">Año para calcular si febrero es biciesto</param>
        /// <returns></returns>
        static int GetDiasMes(int m, int dias, int a)
        {
            int ms = m;

            switch (ms)
            {
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    dias = 31;
                    break;
                case 2:
                    if ((a % 4 == 0) && (a % 100 != 0) || (a % 400 == 0))
                    {
                        dias = 29;
                    }
                    else { dias = 28; }
                    break;
                case 4:
                case 6:
                case 9:
                case 11:
                    dias = 30;
                    break;
            }
            return dias;
        }
        /// <summary>
        /// Cambiar año
        /// </summary>
        /// <param name="d">Dia</param>
        /// <param name="a">Año</param>
        /// <param name="m">Mes</param>
        /// <param name="dias">Dias del mes actual</param>
        /// <param name="ms">Mes siguiente</param>
        static void CambiarAño(int d, int a, int m, int dias, int ms)
        {

            int ds = d + 1;
            int aas = a;
            if (ds > dias)
            {
                ms = m;
                ds = 1;

                if (ms == 12)
                {
                    ms = 1;
                    aas++;
                }
                else
                {
                    ms++;
                }
            }
            Console.WriteLine("El dia siguiente es el " + ds + "/" + ms + "/" + aas);
            Console.ReadLine();

        }
    }
}
