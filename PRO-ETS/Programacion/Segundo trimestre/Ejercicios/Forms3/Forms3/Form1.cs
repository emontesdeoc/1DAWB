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

namespace Forms3
{
    public partial class Form1 : MetroForm
    {
        public Form1()
        {
            InitializeComponent();

        }

        private void metroScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {
            pictureBox1.BackColor = Color.FromArgb(metroScrollBar1.Value, metroScrollBar2.Value, metroScrollBar3.Value);
            metroLabel1.Text = pictureBox1.BackColor.ToString();


        }

        private void metroScrollBar2_Scroll(object sender, ScrollEventArgs e)
        {
            pictureBox1.BackColor = Color.FromArgb(metroScrollBar1.Value, metroScrollBar2.Value, metroScrollBar3.Value);
            metroLabel1.Text = pictureBox1.BackColor.ToString();


        }

        private void metroScrollBar3_Scroll(object sender, ScrollEventArgs e)
        {
            pictureBox1.BackColor = Color.FromArgb(metroScrollBar1.Value, metroScrollBar2.Value, metroScrollBar3.Value);
            
            metroLabel1.Text = pictureBox1.BackColor.ToString();

        }

        private void metroLabel1_Click(object sender, EventArgs e)
        {

        }
        private void Form1_Load(object sender, EventArgs e)
        {

            metroLabel1.Text = pictureBox1.BackColor.ToString();
            pictureBox1.BackColor = Color.FromArgb(0, 0, 0);


        }

        private void metroButton1_Click(object sender, EventArgs e)
        {
            
        }
    }
}