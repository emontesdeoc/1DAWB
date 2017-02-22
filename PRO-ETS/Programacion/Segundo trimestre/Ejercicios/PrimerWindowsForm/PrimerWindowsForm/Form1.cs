using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PrimerWindowsForm
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            textBoxResultado.Text = (Convert.ToInt32(textBoxNumero1.Text) + Convert.ToInt32(textBoxNumero2.Text)).ToString();
        }

        private void textBoxNumero1_Validating(object sender, CancelEventArgs e)
        {
            TextBox auxBox = (TextBox)sender;
            try
            {
                Convert.ToInt32(auxBox.Text);
                auxBox.BackColor = Color.LightGreen;

            }
            catch (FormatException)
            {
                MessageBox.Show("Error", "Titulo");
                auxBox.BackColor = Color.Tomato;
                auxBox.SelectAll();
                auxBox.Focus();

            }


        }

        private void textBoxNumero1_KeyPress(object sender, KeyPressEventArgs e)
        {
            TextBox auxBox = (TextBox)sender;
            
            if (e.KeyChar == (char)ConsoleKey.Enter)
            {
                this.SelectNextControl((Control)sender, true, true, true, true);
            }
        }
    }
}
