using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WinBDDCursos
{
    public partial class FormAlumno : Form
    {
        public FormAlumno()
        {
            InitializeComponent();
        }

        private void button_aceptar_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.OK;
        }

        private void button_cancelar_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
        }

        private void FormAlumno_Load(object sender, EventArgs e)
        {
            
        }
    }
}
