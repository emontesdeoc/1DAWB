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

    Banco caja1, caja2;

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
        caja1.cambio(0.5f);

        float a = 100;
        float b = caja1.Dinero();

        System.out.println("Suma caja 1 en EUROS");
        System.out.println("Balance de la cuenta 1:" + caja1.Dinero());

        for (int i = 1; i <= 5; i++) {
            a = 100;
            b = caja1.Dinero();

            System.out.println("A la caja se le suma: " + a * i + " EUROS.");
            caja1.Suma(a * i, "EURO");

            b = b + a * i;

            assertEquals(b, caja1.Dinero(), 0.1f);

        }

        a = 100;
        b = caja2.Dinero();

        System.out.println("Suma caja 2 en LIBRAS");
        System.out.println("Balance de la cuenta 1:" + caja2.Dinero());

        for (int i = 1; i <= 5; i++) {
            a = 100;
            b = caja2.Dinero();

            System.out.println("A la caja se le suma: " + a * i + " EUROS.");
            caja2.Suma(a * i, "EURO");

            b = b + (a * i / 2);

            assertEquals(b, caja2.Dinero(), 0.1f);

        }

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
