using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleException1
{
    class Program
    {
        static void Main(string[] args)
        {
            int num, edad;
            bool error = false;
            do
            {
                Console.Clear();
                Console.Write("Introduzca número: ");
                try
                {
                    num = Convert.ToInt32(Console.ReadLine());
                    error = false;
                }
                catch (FormatException e)
                {
                    Console.Write("Error de aceptación, pulse una tecla e introduzca de nuevo el número");
                    error = true;
                    Console.ReadLine();
                }
            } while (error == true);

            Console.Write("\n\nIntroduzca edad: ");
            try
            {
                edad = Convert.ToInt32(Console.ReadLine());
                if (edad >= 0 && edad < 18)
                    throw new Exception("Debe ser mayor de edad");               
                else if(edad < 0)
                    throw new ExceptionNueva("Debe ser mayor de edad");
            }
            catch (FormatException e)
            {
                Console.Write("Error de aceptación, pulse una tecla e introduzca de nuevo la edad");
            }
            catch(ExceptionNueva e)
            {
                Console.Write(e.Message);
                Console.ReadLine();
            }
            catch(Exception e)
            {
                Console.Write(e.Message);
                Console.ReadLine();
            }
        }
    }

    class ExceptionNueva: Exception
    {
        public ExceptionNueva(string mensaje) : base(mensaje)
        {
          
        }
    }
}

