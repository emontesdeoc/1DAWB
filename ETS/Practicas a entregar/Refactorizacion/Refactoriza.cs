using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RefactorizaConsola
{
class Program {
static void Main(string[] args)
{
int op;
double resu;
int num1;
Console.Clear();
Console.WriteLine("1.- Funcion1");
Console.WriteLine("2.- Funcion2");
Console.WriteLine("3.- Resultado");
Console.WriteLine("0.- Salir");
Console.Write("Opción: ");
op = Convert.ToInt32(Console.ReadLine());
while(op != 0)
{
switch(op)
{
case 1:
resu = funcion1();
Console.WriteLine();
Console.WriteLine("La visualización del resultado es");
Console.WriteLine("---------------------------------");
Console.WriteLine("Para ello tenemos que visualizar los valores");       Console.WriteLine("--------------------------------------------");
Console.WriteLine();
Console.WriteLine();
Console.WriteLine("Resu: {0}", resu);
Console.ReadLine();
break;
case 2:
Console.Write("\nIntroduzca num1: ");
num1 = Convert.ToInt32(Console.ReadLine());
resu = funcion2(num1);
Console.WriteLine();
Console.WriteLine("La visualización del resultado es");
Console.WriteLine("---------------------------------");
Console.WriteLine("Para ello tenemos que visualizar los valores");        Console.WriteLine("--------------------------------------------");
Console.WriteLine();
Console.WriteLine();
Console.WriteLine("Resu: {0}", resu);
Console.ReadLine();
break;
case 3:
resu = (3.1415 * 2 - 1) / 3.1415;
Console.WriteLine();
Console.WriteLine("La visualización del resultado es");
Console.WriteLine("---------------------------------");
Console.WriteLine("Para ello tenemos que visualizar los valores");       Console.WriteLine("--------------------------------------------");
Console.WriteLine();
Console.WriteLine();
Console.WriteLine("Resu: {0}", resu);
resu = (3.1415 * 3 - 1) / 3.1415;
Console.WriteLine();
Console.WriteLine("La visualización del resultado es");
Console.WriteLine("---------------------------------");
Console.WriteLine("Para ello tenemos que visualizar los valores");        Console.WriteLine("--------------------------------------------");
Console.WriteLine();
Console.WriteLine();
Console.WriteLine("Resu: {0}", resu);
resu = (3.1415 * 4 - 1) / 3.1415;
Console.WriteLine();
Console.WriteLine("La visualización del resultado es");
Console.WriteLine("---------------------------------");
Console.WriteLine("Para ello tenemos que visualizar los valores");        Console.WriteLine("--------------------------------------------");
Console.WriteLine();
Console.WriteLine();
Console.WriteLine("Resu: {0}", resu);
Console.ReadLine();
break;
}
Console.Clear();
Console.WriteLine("1.- Funcion1");
Console.WriteLine("2.- Funcion2");
Console.WriteLine("3.- Resultado");
Console.WriteLine("0.- Salir");
Console.Write("Opción: ");
op = Convert.ToInt32(Console.ReadLine());
}
}
static double funcion1()
{
double resu;
resu = 3.1415 + 3.1415;
return(resu);
}
static int funcion2(int num1)
{
if (num1 < 0)
for (int i = 0; i < 5; i++)
num1 = num1 - i;
else if (num1 == 0 || num1 == 1 || num1 == 2 || num1 == 3 || num1 == 4)
for (int i = 0; i < 5; i++)
num1 = num1 - i;
else if (num1 == 5 || num1 == 6 || num1 == 7)
for (int i = 0; i < 5; i++)
num1 = num1 - i;
else
num1 = num1 * 2;
return (num1);
}
}
}


