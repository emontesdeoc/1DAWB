using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ListBox1
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

        private void button1_Click(object sender, EventArgs e)
        {
            
            listBox1.Items.Add(Convert.ToInt32(textBox1.Text));
            
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void listBox1_DoubleClick(object sender, EventArgs e)
        {
            //comboBox1.Items.Add(listBox1.SelectedItem);
            comboBox1.Items.Add(listBox1.SelectedIndex.ToString());
            comboBox1.SelectedIndex = comboBox1.Items.Count - 1;
            
            richTextBox1.Text += listBox1.Text + " ";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            richTextBox1.Clear();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            FileStream fw;
            fw = new FileStream("f1.txt", FileMode.Create, FileAccess.Write);
            richTextBox1.SaveFile(fw, RichTextBoxStreamType.PlainText);
            fw.Close();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            FileStream fr;

            if (File.Exists("f1.txt"))
            {
                fr = new FileStream("f1.txt", FileMode.Open, FileAccess.Read);
                richTextBox1.LoadFile(fr, RichTextBoxStreamType.PlainText);
                fr.Close();
            }

        }
    }
}
