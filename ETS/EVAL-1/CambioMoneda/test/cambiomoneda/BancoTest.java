/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cambiomoneda;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Emi-Laptop
 */
public class BancoTest {
    
    Banco caja1,caja2;

    public BancoTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
        
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        
        caja1 = new Banco(100, "EURO");        
        caja2 = new Banco(100, "LIBRA");
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of cambio method, of class Banco.
     */
    @Test
    public void testCambio() {
        System.out.println("cambio");
        
        float EL_ = 0.5F;
        //Banco instance = new Banco(100, "EURO");
        caja1.cambio(EL_);        
        caja2.cambio(EL_);

        // TODO review the generated test code and remove the default call to fail.
        
    }

    /**
     * Test of Suma method, of class Banco.
     */
    @Test
    public void testSuma() {
        testCambio();
        float a = 100;
        float b = 0;
        System.out.println("Suma caja 1 en EUROS");        
        System.out.println("Balance de la cuenta 1:" + caja1.Dinero());

        for (int i = 1; i <= 20; i++) {
            System.out.println("A la caja se le suma: "+a*i+ ".");
        caja1.Suma(a*i, "EURO");
        
        b = b+a*i;
        assertEquals(b+a,caja1.Dinero(),0.1f);
        
        }
        
        System.out.println("Suma caja 2 en LIBRAS");
        System.out.println("Balance de la cuenta 2:" + caja2.Dinero());
        
        float c = 100;
        float d = 0;
        for (int i = 1; i <= 20; i++) {
        caja2.Suma(100*i*2, "LIBRAS");
        d = d+c*i;
        assertEquals(d+c,caja2.Dinero(),0.1f);
        }
        
        //caja1.Suma(100, "LIBRA");
        //assertEquals(400f,caja1.Dinero(),0.1f);
        //caja2.Suma(canti, mon2);

        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of visualiza method, of class Banco.
     */
    @Test
    public void testVisualiza() {
        System.out.println("visualiza");
        
        caja1.visualiza();        
        caja2.visualiza();

        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of Dinero method, of class Banco.
     */
    @Test
    public void testDinero() {
        System.out.println("Dinero");
                
        float result = caja1.Dinero();        
        float result2 = caja2.Dinero();

        //assertEquals(expResult, result, 150.0);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
    
}
