import java.util.*;   // Necesario para los ArrayList
import java.util.Scanner;

class tipo
{
	public int numero;
	public String nombre;
}

public class Lista1 
{
	  public static void main(String [] args)
	  {
		  int op=1;
		  Scanner rd = new Scanner(System.in);
		  ArrayList<tipo> lista = new ArrayList<tipo>();
		  do
		  {
			  System.out.println("1.- Altas");
			  System.out.println("2.- Bajas");
			  System.out.println("3.- Modificaciones");
			  System.out.println("4.- Consultas");
			  System.out.println("0.- Salir");
			  op = rd.nextInt();
			  switch(op)
			  {
			  	case 1:
			  		altas(rd, lista);
			  		break;
			  	case 2:
			  		bajas();
			  		break;
			  	case 3:
			  		modificaciones();
			  		break;
			  	case 4:
			  		consultas(lista);
			  		rd.nextByte();
			  		break;				  
			  }
			//  limpia();
			  System.out.println("\n\n\n\n\n");
		  } while (op != 0);
		  rd.close();
	  }
	  
	  public static void altas(Scanner rd, ArrayList<tipo> lista)
	  {
		  tipo registro = new tipo();
		  System.out.print("Introduzca Número: ");
		  registro.numero = rd.nextInt();
		  System.out.print("Introduzca Nombre: ");
		  registro.nombre = rd.next();
		  lista.add(registro);
	  }
	  
	  public static void bajas()
	  {
		  
	  }

	  public static void modificaciones()
	  {
		  
	  }
	  
	  public static void consultas(ArrayList<tipo> lista)
	  {
		  int i;
		  for(i = 0; i < lista.size(); i++)
		  {
			  System.out.print("Número: ");	
			  System.out.print(lista.get(i).numero);
			  System.out.print("   Nombre: ");	
			  System.out.println(lista.get(i).nombre);
		  }
		  
	  }
	  
	  public static void limpia()
	  {
		  int i;
		  for(i = 0; i < 6; i++)
			  System.out.println();
	  }
}

