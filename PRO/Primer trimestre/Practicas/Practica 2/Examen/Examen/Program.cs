using System;
using System.Collections.Generic;
using System.Text;

namespace DiaSiguiente
{
    class Program
    {
        static void Main(string[] args)
        {
            int dd, mm, aa;
            int dds, mms, aas;
            int[] tabla = new int[12] { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
            Console.Write("Introduzca Día: ");
            dd = Convert.ToInt32(Console.ReadLine());
            Console.Write("Introduzca Mes: ");
            mm = Int32.Parse(Console.ReadLine());
            Console.Write("Introduzca Año: ");
            aa = Convert.ToInt32(Console.ReadLine());
            if ((aa % 4 == 0) && (aa % 100 != 0) || (aa % 400 == 0))
                tabla[1] = 29;
            if (comprueba(dd, mm, aa, tabla) == false)
            {
                Console.WriteLine("Fecha errónea");
                Console.ReadLine();
                return;
            }
            dds = dd + 1;
            mms = mm;
            aas = aa;
            if (dds > tabla[mm - 1])
            {
                dds = 1;
                if (mms == 12)
                {
                    mms = 1;
                    aas++;
                }
                else
                    mms++;
            }
            Console.WriteLine("\n\n\n");
            Console.Write("Fecha:  ");
            Console.Write("{0} - {1} - {2}", dds, mms, aas);
            Console.ReadLine();
        }

        static bool comprueba(int dd, int mm, int aa, int[] tabla)
        {
            bool valor = true;
            if (mm < 1 || mm > 12)
                valor = false;
            else
               if (dd < 1 || dd > tabla[mm - 1])
                valor = false;
            return (valor);
        }
    }
}
