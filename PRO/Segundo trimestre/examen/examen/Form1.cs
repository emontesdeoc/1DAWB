using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace examen
{
    public partial class Form1 : Form
    {
        fichero f1;
        List<string> l1;
        List<tipo> l2;
        List<string> npartidos;

        public Form1()
        {
            InitializeComponent();
        }

        private void numericUpDown6_ValueChanged(object sender, EventArgs e)
        {

        }

        private void listBox1_DoubleClick(object sender, EventArgs e)
        {
            ///Asignar el valor del textbox desde el listtextbox
            txtbox_jugador1.Text = listBox1.SelectedItem.ToString();
        }

        private void txtbox_jugador1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            //Creacion del archivo
            SetListas();

            try
            {
                f1 = new fichero("atp.dat", l1, l2);
            }
            catch (Exception e1)
            {
                MessageBox.Show(e1.Message);
                return;
            }
            //Guardando los datos
            try
            {
                if (f1.abre())
                {
                    f1.fin();
                    carga(npartidos);
                    f1.escribe(npartidos);
                }
            }
            catch (Exception e1)
            {
                MessageBox.Show(e1.Message);
            }
            finally
            {
                f1.cierra();
            }
        }
        /// <summary>
        /// Carga de archivos en lista
        /// </summary>
        /// <param name="npartidos">lista de carga</param>
        void carga(List<string> npartidos)
        {
            int j1s = CalcularSetsJugador1();
            int j2s = CalcularSetsJugador2();

            npartidos.Clear();
            npartidos.Add(partido_numericUpDown.Text);
            npartidos.Add(txtbox_jugador1.Text);
            npartidos.Add(comboBox_jugador2.SelectedItem.ToString());
            npartidos.Add(j1s.ToString());
            npartidos.Add(j2s.ToString());
        }

        private void partido_numericUpDown_ValueChanged(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// Metodo que calcula los sets ganados por el jugador 1
        /// </summary>
        /// <returns></returns>
        private int CalcularSetsJugador1()
        {
            int res = 0;
            if (jugador_numericUpDown_set1.Value == 6)
            {
                res++;
            }
            if (jugador_numericUpDown_set2.Value == 6)
            {
                res++;
            }
            if (jugador_numericUpDown_set3.Value == 6)
            {
                res++;
            }
            return res;
        }
        /// <summary>
        /// Metodo que calcula los sets ganados por el jugador 2
        /// </summary>
        /// <returns></returns>
        private int CalcularSetsJugador2()
        {
            int res = 0;
            if (jugador2_numericUpDown_set1.Value == 6)
            {
                res++;
            }
            if (jugador2_numeric_set2.Value == 6)
            {
                res++;
            }
            if (jugador2_numericUpDown_set3.Value == 6)
            {
                res++;
            }
            return res;
        }
        /// <summary>
        /// Boton que carga los valores del fichero en el datagridview1
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button2_Click(object sender, EventArgs e)
        {
            int i = 0;
            List<string> caja1;
            caja1 = new List<string>();
            SetListas();
            f1 = new fichero("atp.dat", l1, l2);
            f1.abre();
            dataGridView1.Rows.Clear();
            for (i = 0; i < f1.numRegistros; i++)
            {
                caja1.Clear();
                try
                {
                    caja1 = f1.lee();
                    dataGridView1.Rows.Add(caja1[0], caja1[1], caja1[2], caja1[3], caja1[4]);

                }
                catch (Exception e1)
                {
                    MessageBox.Show(e1.Message);
                }
            }
            f1.cierra();
        }
        /// <summary>
        /// Metodo para cargas las listas de valores predefinidos
        /// </summary>
        private void SetListas()
        {
            l1 = new List<string>();
            l2 = new List<tipo>();
            npartidos = new List<string>();

            l1.Add("partido");
            l1.Add("jugador1");
            l1.Add("jugador2");
            l1.Add("sets1");
            l1.Add("sets2");

            l2.Add(tipo.entero);
            l2.Add(tipo.cadena);
            l2.Add(tipo.cadena);
            l2.Add(tipo.entero);
            l2.Add(tipo.entero);
        }
        /// <summary>
        /// Funcion encargado de elegir el texto del combobox y cargar los datos en el datagridview
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void comboBox_jugador_SelectedIndexChanged(object sender, EventArgs e)
        {
            int i = 0;
            List<string> caja1;
            caja1 = new List<string>();
            SetListas();
            f1 = new fichero("atp.dat", l1, l2);
            f1.abre();
            //if (dataGridView2.Rows.Count == 0)
            //{
            //    dataGridView2.Rows.Clear();
            //}
            int grandslams = 0;

            string nombre = comboBox_jugador.SelectedItem.ToString();
            for (i = 0; i < f1.numRegistros; i++)
            {
                caja1.Clear();
                caja1 = f1.lee();

                if (caja1[1] == comboBox_jugador.SelectedItem.ToString())
                {
                    if (caja1[3] == "2" || caja1[3] == "3")
                    {
                        grandslams++;

                    }
                }
                if (caja1[2] == comboBox_jugador.SelectedItem.ToString())
                {
                    if (caja1[4] == "2" || caja1[4] == "3")
                    {
                        grandslams++;

                    }
                }
            }
            addnew(nombre, grandslams);

            f1.cierra();
        }
        /// <summary>
        /// Metodo que añade al datagridview2
        /// </summary>
        /// <param name="n">nombre del tenista</param>
        /// <param name="g">partidos ganados</param>
        private void addnew(string n, int g)
        {
            dataGridView2.Rows.Add(n, g);
        }
        /// <summary>
        /// Metodo que ordena el datagridview
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_ordena_Click(object sender, EventArgs e)
        {
            dataGridView2.Sort(dataGridView2.Columns[1], ListSortDirection.Descending);
        }

        private void jugador2_numericUpDown_set2_Click(object sender, EventArgs e)
        {





        }
    }
}

