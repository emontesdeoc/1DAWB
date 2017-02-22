using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MetroFramework.Forms;
using System.Diagnostics;

namespace _3enraya
{


    public partial class Form1 : MetroForm
    {
        public static int quienJuegaInt = Juego.quienJuega();
        List<Button> lButtons;
        List<Button> lButtonsControles;
        public static int turno = 0;
        public static int scorePC = 0;
        public static int scoreJ = 0;
        public static int scoreTie = 0;
        public static bool quienJuegaBol = false;
        public static bool JStarted = false;


        public Form1()
        {
            InitializeComponent();
        }

        public void Form1_Load(object sender, EventArgs e)
        {
            StartJuego();
        }

        public void StartJuego()
        {
            new Juego();
            ///Lista de botones del juego, del 1 al 9
            lButtons = new List<Button> { button_1, button_2, button_3, button_4, button_5, button_6, button_7, button_8, button_9 };
            ///Lista de botones de control: Jugar - maquina - X - O
            lButtonsControles = new List<Button> { metroButton1, metroButton2, metroButton3, metroButton4 };
            ///Desactiva los botones de juego
            DisableButtons();
            ///Desactiva el boton de jugar hasta que se selecciona un juegador o letra
            lButtonsControles[0].Enabled = false;
            ///Metodo de habilitar la seleccion de jugador
            EnableSeleccionJugador();
            quienJuegaInt = Juego.quienJuega();
            if (JStarted == true)
            {
                turno = 1;
            }

        }

        #region BOTONES DE JUEGO

        private void upleft_Click(object sender, EventArgs e)
        {
            CambioButton(0);
            checkPartida();
            Juego.turno(1, lButtons[0].Text);
            JuegaMaquina();
        }

        private void button_2_Click(object sender, EventArgs e)
        {
            CambioButton(1);
            checkPartida();
            Juego.turno(2, lButtons[1].Text);
            JuegaMaquina();
        }

        private void button_3_Click(object sender, EventArgs e)
        {
            CambioButton(2);
            checkPartida();
            Juego.turno(3, lButtons[2].Text);
            JuegaMaquina();
        }

        private void button_4_Click(object sender, EventArgs e)
        {
            CambioButton(3);
            checkPartida();
            Juego.turno(4, lButtons[3].Text);
            JuegaMaquina();
        }

        private void button_5_Click(object sender, EventArgs e)
        {
            CambioButton(4);
            checkPartida();
            Juego.turno(5, lButtons[4].Text);
            JuegaMaquina();
        }
        private void metroButton4_Click(object sender, EventArgs e)
        {
            CambioButton(5);
            checkPartida();
            Juego.turno(6, lButtons[5].Text);
            JuegaMaquina();
        }
        private void button_7_Click(object sender, EventArgs e)
        {
            CambioButton(6);
            checkPartida();
            Juego.turno(7, lButtons[6].Text);
            JuegaMaquina();
        }

        private void button_8_Click(object sender, EventArgs e)
        {
            CambioButton(7);
            checkPartida();
            Juego.turno(8, lButtons[7].Text);
            JuegaMaquina();

        }

        private void button_9_Click(object sender, EventArgs e)
        {
            CambioButton(8);
            Juego.turno(9, lButtons[8].Text);
            JuegaMaquina();
            //checkPartida();


        }
        #endregion

        #region BOTONES DE SELECCION
        /// <summary>
        /// Boton de JUGAR
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void metroButton1_Click(object sender, EventArgs e)
        {
            ResetButtons();
            Juego.ResetAll();
            DisableSeleccionJugador();
            JuegaMaquina();

        }
        /// <summary>
        /// Boton de seleccion de la X 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void metroButton2_Click(object sender, EventArgs e)
        {
            quienJuegaInt = 2;
            metroButton1.Enabled = true;
            DisableSeleccionJugador();
            metroLabel2.Text = "Jugador";
            turno = 0;
            quienJuegaBol = true;
            JStarted = true;
        }
        /// <summary>
        /// Boton de seleccion de O
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void metroButton3_Click(object sender, EventArgs e)
        {
            scoreJ = 0;
            scorePC = 0;
            metroLabel1.Text = "PC: 0 | J: 0 | E: 0";


        }
        /// <summary>
        /// Boton de seleccion aleatorio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void metroButton4_Click_1(object sender, EventArgs e)
        {
            quienJuegaInt = 1;
            metroButton1.Enabled = true;
            DisableSeleccionJugador();
            metroLabel2.Text = "";
            turno = 1;
            quienJuegaBol = false;
        }
        #endregion

        #region METODOS DE CONTROL DE VISTA

        /// <summary>
        /// Metodo que devuelve a los botones lo que ponen cuando se pulsa
        /// </summary>
        /// <returns>Retorna X u O</returns>
        public static string quienJuega()
        {
            string res = "";
            int calculo = quienJuegaInt % 2;
            switch (calculo)
            {
                case 0:
                    res = "X";
                    break;
                default:
                    res = "O";
                    break;
            }
            quienJuegaInt++;
            return res;
        }

        /// <summary>
        /// Metodo encargado de darle X u O y deshabilita el boton
        /// </summary>
        /// <param name="i"></param>
        private void CambioButton(int i)
        {
            lButtons[i].Text = quienJuega();
            lButtons[i].Enabled = false;
            turno++;
        }

        /// <summary>
        /// Resetea los botones, les asigna - y los habilita
        /// </summary>
        public void ResetButtons()
        {
            for (int i = 0; i < lButtons.Count; i++)
            {
                lButtons[i].Text = null;
                lButtons[i].Enabled = true;
            }
        }
        /// <summary>
        /// Deshabilitar los botones
        /// </summary>
        public void DisableButtons()
        {
            for (int i = 0; i < lButtons.Count; i++)
            {
                lButtons[i].Enabled = false;
            }
        }
        /// <summary>
        /// Deshabilitar los botones de seleccion de jugador
        /// </summary>
        public void DisableSeleccionJugador()
        {
            for (int i = 1; i < lButtonsControles.Count; i++)
            {
                lButtonsControles[i].Enabled = false;
            }
        }
        /// <summary>
        /// Habilita los botones de seleccion de letra
        /// </summary>
        public void EnableSeleccionJugador()
        {
            for (int i = 1; i < lButtonsControles.Count; i++)
            {
                lButtonsControles[i].Enabled = true;
            }

        }
        /// <summary>
        /// Metodo que mira si alguien ha ganado
        /// </summary>
        public void checkPartida()
        {
            if (Juego.Comprobar())
            {
                //this.Enabled = false;
                if (quienJuegaInt % 2 == 0)
                {
                    MessageBox.Show("Gana la Maquina", "Fin de partida", MessageBoxButtons.OK);
                    scorePC++;
                    StartJuego();
                }
                else
                {
                    MessageBox.Show("Gana el Jugador", "Fin de partida", MessageBoxButtons.OK);
                    scoreJ++;
                    StartJuego();
                }
            }
            else if (Juego.Comprobar() == false && turno == 10)
            {
                MessageBox.Show("Empate!", "Fin de partida", MessageBoxButtons.OK);
                scoreTie++;
                StartJuego();
            }
            metroLabel1.Text = "PC: " + scorePC + " | J: " + scoreJ + " | E: " + scoreTie;
        }

        public void JuegaMaquina()
        {
            if (turno % 2 != 0 && Juego.Comprobar() == false)
            {
                int a = 0;
                if (quienJuegaBol && JStarted == true)
                {
                    a = Juego.TurnoMaquina(3, false) - 1;
                    quienJuegaBol = false;
                    JStarted = false;
                }
                else
                {
                    a = Juego.TurnoMaquina(turno, true) - 1;

                }
                bool b = true;
                while (b)
                {
                    if (lButtons[a].Text == null || lButtons[a].Text == "X" && lButtons[a].Text == "O" || lButtons[a].Text == "")
                    {
                        b = false;
                        CambioButton(a);
                    }
                    else if (lButtons[a].Text == "X")
                    {
                        Juego.turno(a + 1, "X");
                        a = Juego.TurnoMaquina(turno, true) - 1;
                    }
                    else
                    {
                        a = Juego.TurnoMaquina(turno, true) - 1;
                    }
                }
            }
            checkPartida();
        }

        #endregion

        #region LABELS
        private void metroLabel2_Click(object sender, EventArgs e)
        {

        }
        #endregion

        private void metroLabel1_Click(object sender, EventArgs e)
        {
            metroLabel1.Text = "PC: " + scorePC + " | J: " + scoreJ + " | E: " + scoreTie;
        }
    }
}
