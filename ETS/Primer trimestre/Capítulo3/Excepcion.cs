using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleExcepcion
{
    class Program
    {
        static void Main(string[] args)
        {
            // Control de Excepciones
            int num1=10, num2=2, num3=0;
            string cad=null;
            bool er = true;
            while (er == true)
            {
                try
                {
                    num1 = Convert.ToInt32(Console.ReadLine());
                    Console.WriteLine("aaaaaaaaaaaa");
                    er = false;
                    Console.ReadLine();
                }
                catch (System.Exception e)
                {
                    Console.WriteLine("Error ");
                    Console.ReadLine();
                }
            }

            try
            {
                num3 = num1 / num2;
            }
            catch(System.DivideByZeroException e)
            {
                Console.WriteLine("Error al dividor por cero");
                Console.WriteLine("No rompe el programa, visualizamos el error que da el sistema");
                Console.WriteLine("Excepción: {0},  Código: {1} ", e.Message, e.HResult);
               // Console.ReadLine();
            }
            catch(Exception e)
            {
                Console.WriteLine("Error genérico");
                Console.WriteLine("No rompe el programa, visualizamos el error que da el sistema");
                Console.WriteLine("Excepción: {0} ", e.Message);
               // Console.ReadLine();
            }
            finally
            {
                Console.WriteLine("Este mensaje lo visualiza siempre al final");
                Console.WriteLine("No es obligatorio su uso");
                Console.ReadLine();
            }

            try
            {
                cad = "pepe";
                num3 = Convert.ToInt32(cad);
            }
            catch (System.FormatException e)
            {
                Console.WriteLine("Error de conversión de formato");
                Console.WriteLine("No rompe el programa, visualizamos el error que da el sistema");
                Console.WriteLine("Excepción: {0},  Código: {1} ", e.Message, e.HResult);
                Console.ReadLine();
            }
            catch (Exception e)
            {
                Console.WriteLine("Error genérico");
                Console.WriteLine("No rompe el programa, visualizamos el error que da el sistema");
                Console.WriteLine("Excepción: {0} ", e.Message);
                Console.ReadLine();
            }


            try
            {
                cad = "pepe";
                funciona(Convert.ToInt32(cad));  
            }
            catch (System.FormatException e)
            {
                Console.WriteLine("Error de conversión de formato");
                Console.WriteLine("No rompe el programa, visualizamos el error que da el sistema");
                Console.WriteLine("Excepción: {0},  Código: {1} ", e.Message, e.HResult);
                Console.ReadLine();
            }

        }

        static public void funciona(int valor)
        {
            Console.WriteLine(valor);
        }
    }
}
