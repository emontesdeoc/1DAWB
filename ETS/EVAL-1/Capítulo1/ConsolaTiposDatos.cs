using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsolaTiposDatos
{
    class Program
    {
        static void Main(string[] args)
        {
            bool verdad;
            byte octeto;
            char caracter;
            decimal numdecimal;
            double numdoble, numdoble_2;
            int entero32, entero32_2;
            long entero64;
            sbyte octetoSigno;
            short entero16;
            float numsingle;
            string cadena;
            uint entero32SinSigno;
            ulong entero64SinSigno;
            ushort entero16SinSigno;
            DateTime fechaHora;

            verdad = true;
            Console.WriteLine("Booleano: " + verdad);
            octeto = 255;
            Console.WriteLine("Byte: " + octeto);
           // La línea siguiente da error de compilación
           // octeto = 256;
           // Console.WriteLine("Byte: " + octeto);
           // Otro error 256 no es un char
           // caracter = 256;
           // Console.WriteLine("caracter: " + caracter);
            caracter = Convert.ToChar(97);
            Console.WriteLine("caracter: " + caracter);
            octeto = Convert.ToByte('a');
            Console.WriteLine("byte: " + octeto);
            caracter = 'a';
            Console.WriteLine("caracter: " + caracter);
            entero16SinSigno= 60000;
            Console.WriteLine("entero16SinSigno: " + entero16SinSigno);
           // Da error
           // entero16SinSigno = -1;
           // Console.WriteLine("entero16SinSigno: " + entero16SinSigno);

            entero32 = 10;
            numdoble = 3.0;
            entero32_2 = 3;
            numdoble_2 = entero32 / numdoble;
            Console.WriteLine("Resultado:  " + numdoble_2);
            numdoble_2 = entero32 / entero32_2;
            Console.WriteLine("Resultado:  " + numdoble_2);
           // Da error en las asignaciones: numdecimal = 17.5  y  numdoble = numdecimal;  no puede convertir impícitamente
           // numdecimal = 17.5;
           // numdoble = numdecimal;
           // Console.WriteLine("numdoble:  " + numdoble);
            Console.WriteLine("Resultado:  " + numdoble_2);
            // Así ya no da el error en la asignación: numdoble = numdecimal;  
            numdecimal = Convert.ToDecimal(17.5);   //  17.5  por defecto es double
            numdoble = (double)numdecimal;   // casting para convertir el valor pasado de decimal a double
            Console.WriteLine("numdoble:  " + numdoble);
            fechaHora = DateTime.Now;
            Console.WriteLine("Fecha: {0}/{1}/{2}", fechaHora.Day, fechaHora.Month, fechaHora.Year);
            Console.WriteLine("Hora: {0}:{1}:{2}", fechaHora.Hour, fechaHora.Minute, fechaHora.Second);
 
            Console.ReadLine();
        }
    }
}
