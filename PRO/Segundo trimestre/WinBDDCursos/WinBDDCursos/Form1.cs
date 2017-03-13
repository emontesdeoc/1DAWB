using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WinBDDCursos
{
    public partial class Form1 : Form
    {
        BDD_Conexion BDD;
        Cursos curso;
        Alumnos alumno;
        int nuevo;
        public Form1()
        {
            InitializeComponent();
            nuevo = 0;
            panel1.Visible = false;
        }


        private void buttonABREBDD_Click(object sender, EventArgs e)
        {
            try
            {
                BDD = new BDD_Conexion();
                if (BDD.abrirConexion())
                {
                    MessageBox.Show("Conexión realizada correctamente");
                }
                else
                {
                    MessageBox.Show("Error al abrir la Base de Datos");
                    return;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Error de conexión");
                return;
            }
            curso = new Cursos(BDD.sqlconexion, BDD.datasetBDD);
            alumno = new Alumnos(BDD.sqlconexion, BDD.datasetBDD);
            rellenaCurso();
        }

        void rellenaCurso()
        {
            textBoxCOD_CUR.Text = curso.Cod_Cur;
            textBoxDES_CURSO.Text = curso.Descripcion;
            textBoxHORAS_CUR.Text = curso.Horas.ToString();
            textBoxTUTOR_CUR.Text = curso.Tutor;
        }

        private void buttonCIERRA_BDD_Click(object sender, EventArgs e)
        {
            BDD.cerrarConexion();
        }

        private void buttonPRIMER_CUR_Click(object sender, EventArgs e)
        {
            curso.primero();
            rellenaCurso();
        }

        private void buttonANTERIOR_CUR_Click(object sender, EventArgs e)
        {
            curso.anterior();
            rellenaCurso();
        }

        private void buttonSIG_CUR_Click(object sender, EventArgs e)
        {
            curso.siguiente();
            rellenaCurso();
        }

        private void buttonULTIMO_CUR_Click(object sender, EventArgs e)
        {
            curso.ultimo();
            rellenaCurso();
        }

        private void buttonNuevo_Click(object sender, EventArgs e)
        {
            nuevo = 1;
            textBoxCOD_CUR.Clear();
            textBoxDES_CURSO.Clear();
            textBoxHORAS_CUR.Clear();
            textBoxTUTOR_CUR.Clear();
        }

        private void buttonGraba_Click(object sender, EventArgs e)
        {
            if (textBoxCOD_CUR.Text.Length == 0)
            {
                MessageBox.Show("El campo Curso debe estar relleno");
                return;
            }
            if (textBoxDES_CURSO.Text.Length == 0)
            {
                MessageBox.Show("El campo Descripcion debe estar relleno");
                return;
            }
            if (textBoxHORAS_CUR.Text.Length == 0)
            {
                MessageBox.Show("El campo Horas debe estar relleno");
                return;
            }
            if (textBoxTUTOR_CUR.Text.Length == 0)
            {
                MessageBox.Show("El campo Tutor debe estar relleno");
                return;
            }

            try
            {
                curso.graba(textBoxCOD_CUR.Text, textBoxDES_CURSO.Text, textBoxHORAS_CUR.Text, textBoxTUTOR_CUR.Text, nuevo);
            }
            catch (Exception)
            {
                MessageBox.Show("No se ha podido completar la operación");
            }
            nuevo = 0;
        }

        private void buttonBorra_Click(object sender, EventArgs e)
        {
            curso.Borra();
            buttonSIG_CUR.PerformClick();
        }

        private void cargaAlumnos_button_Click(object sender, EventArgs e)
        {
            dataGridView_alumnos.DataSource = alumno.tablaAlumnos;
            dataGridView_alumnos.ReadOnly = true;
            dataGridView_alumnos.AllowUserToAddRows = false;
            dataGridView_alumnos.AllowUserToDeleteRows = false;
            ((Button)sender).Enabled = false;
        }

        private void cargaColumnasAlumno()
        {

            dataGridView_alumnos.AutoGenerateColumns = false;

            DataGridViewTextBoxColumn col1;
            DataGridViewTextBoxColumn col2;
            DataGridViewTextBoxColumn col3;
            DataGridViewTextBoxColumn col4;
            DataGridViewTextBoxColumn col5;
            DataGridViewButtonColumn col6;
            DataGridViewButtonColumn col7;

            col1 = new DataGridViewTextBoxColumn();
            col2 = new DataGridViewTextBoxColumn();
            col3 = new DataGridViewTextBoxColumn();
            col4 = new DataGridViewTextBoxColumn();
            col5 = new DataGridViewTextBoxColumn();
            col6 = new DataGridViewButtonColumn();
            col7 = new DataGridViewButtonColumn();


            col1.HeaderText = "CODIGO ALUMNO";
            col1.Name = "CODIGO_ALUMNO";
            col1.DataPropertyName = "COD_ALU";
            col1.Width = 70;
            col1.ReadOnly = true;
            dataGridView_alumnos.Columns.Add(col1);

            col2.HeaderText = "CODIGO CURSO";
            col2.Name = "CODIGO_CURSO";
            col2.DataPropertyName = "COD_CUR";
            col2.Width = 70;
            col2.ReadOnly = true;
            dataGridView_alumnos.Columns.Add(col2);

            col3.HeaderText = "DNI";
            col3.Name = "DNI";
            col3.DataPropertyName = "DNI";
            col3.Width = 70;
            col3.ReadOnly = true;
            dataGridView_alumnos.Columns.Add(col3);

            col4.HeaderText = "APELLIDOS";
            col4.Name = "APELLIDOS";
            col4.DataPropertyName = "APELLIDOS";
            col4.Width = 140;
            col4.ReadOnly = true;
            dataGridView_alumnos.Columns.Add(col4);

            col5.HeaderText = "NOMBRE";
            col5.Name = "NOMBRE";
            col5.DataPropertyName = "NOMBRE";
            col5.Width = 70;
            col5.ReadOnly = true;
            dataGridView_alumnos.Columns.Add(col5);

            col6.HeaderText = "";
            col6.Name = "MODIFICAR";
            col6.FlatStyle = FlatStyle.Standard;
            col6.UseColumnTextForButtonValue = true;
            col6.Text = "Editar";
            col6.Width = 70;
            dataGridView_alumnos.Columns.Add(col6);

            col7.HeaderText = "";
            col7.Name = "ELIMINAR";
            col7.FlatStyle = FlatStyle.Standard;
            col7.UseColumnTextForButtonValue = true;
            col7.Text = "Eliminar";
            col7.Width = 70;
            dataGridView_alumnos.Columns.Add(col7);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            cargaColumnasAlumno();
        }

        private void dataGridView_alumnos_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }



        private void dataGridView_alumnos_CellClick(object sender, DataGridViewCellEventArgs e)
        {

            int fila = e.RowIndex;
            int c = e.ColumnIndex;
            if (e.ColumnIndex == 5)
            {
                FormAlumno f = new FormAlumno();
                f.Controls["textBox1"].Text = dataGridView_alumnos.Rows[e.RowIndex].Cells[0].Value.ToString();
                f.Controls["textBox1"].Enabled = false;
                f.Controls["textBox2"].Text = dataGridView_alumnos.Rows[e.RowIndex].Cells[1].Value.ToString();
                f.Controls["textBox2"].Enabled = false;
                f.Controls["textBox3"].Text = dataGridView_alumnos.Rows[e.RowIndex].Cells[2].Value.ToString();
                f.Controls["textBox4"].Text = dataGridView_alumnos.Rows[e.RowIndex].Cells[3].Value.ToString();
                f.Controls["textBox5"].Text = dataGridView_alumnos.Rows[e.RowIndex].Cells[4].Value.ToString();

                if (f.ShowDialog() == DialogResult.OK)
                {
                    try
                    {
                        alumno.graba(dataGridView_alumnos.Rows[e.RowIndex].Cells[0].Value.ToString(),
                            dataGridView_alumnos.Rows[e.RowIndex].Cells[1].Value.ToString(),
                            f.Controls["textBox3"].Text.ToString(),
                            f.Controls["textBox4"].Text.ToString(),
                            f.Controls["textBox5"].Text.ToString(),
                            0);

                        dataGridView_alumnos.Rows[e.RowIndex].Cells[2].Value = f.Controls["textBox3"].Text;
                        dataGridView_alumnos.Rows[e.RowIndex].Cells[3].Value = f.Controls["textBox4"].Text;
                        dataGridView_alumnos.Rows[e.RowIndex].Cells[4].Value = f.Controls["textBox5"].Text;
                    }
                    catch (Exception a)
                    {

                        MessageBox.Show(a.Message);
                    }
                }

            }
            if (e.ColumnIndex == 6)
            {

                FormAlumno f = new FormAlumno();
                f.Controls["textBox1"].Text = dataGridView_alumnos.Rows[e.RowIndex].Cells[0].Value.ToString();
                f.Controls["textBox1"].Enabled = false;
                f.Controls["textBox2"].Text = dataGridView_alumnos.Rows[e.RowIndex].Cells[1].Value.ToString();
                f.Controls["textBox2"].Enabled = false;
                f.Controls["textBox3"].Text = dataGridView_alumnos.Rows[e.RowIndex].Cells[2].Value.ToString();
                f.Controls["textBox3"].Enabled = false;
                f.Controls["textBox4"].Text = dataGridView_alumnos.Rows[e.RowIndex].Cells[3].Value.ToString();
                f.Controls["textBox4"].Enabled = false;
                f.Controls["textBox5"].Text = dataGridView_alumnos.Rows[e.RowIndex].Cells[4].Value.ToString();
                f.Controls["textBox5"].Enabled = false;


                if (f.ShowDialog() == DialogResult.OK)
                {
                    try
                    {
                        alumno.COD_ALU = dataGridView_alumnos.Rows[e.RowIndex].Cells[0].Value.ToString();
                        alumno.COD_CUR = dataGridView_alumnos.Rows[e.RowIndex].Cells[1].Value.ToString();
                        alumno.Borra();
                    }
                    catch (Exception a)
                    {

                        MessageBox.Show(a.Message);
                    }
                }

            }

        }

        private void nuevoAlumno_button_Click(object sender, EventArgs e)
        {
            FormAlumno f = new FormAlumno();

            if (f.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    alumno.graba(f.Controls["textbox1"].Text.ToString(),
                        f.Controls["textbox2"].Text.ToString(),
                        f.Controls["textBox3"].Text.ToString(),
                        f.Controls["textBox4"].Text.ToString(),
                        f.Controls["textBox5"].Text.ToString(),
                        1);

                    dataGridView_alumnos.Update();
                }
                catch (Exception a)
                {

                    MessageBox.Show(a.Message);
                }
            }


        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void comboBox_cursos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btn_loadcursos_Click(object sender, EventArgs e)
        {
            Cursos a = new Cursos(BDD.sqlconexion, BDD.datasetBDD);

            comboBox_cursos.DataSource = a.Tabla();
            comboBox_cursos.DisplayMember = "DESCRIPCION";
            comboBox_cursos.ValueMember = "COD_CUR";

        }

        private void comboBox_cursos_SelectedValueChanged(object sender, EventArgs e)
        {

            string f = "COD_CUR = '" + curso.tablaCursos.Rows[comboBox_cursos.SelectedIndex][0].ToString() + "'";

            DataView dv;
            dv = new DataView(alumno.Tabla(), f, "DNI Desc", DataViewRowState.CurrentRows);
            datagrid_cursos.DataSource = dv;

            //Estilo datagridview cursos
            datagrid_cursos.ReadOnly = true;
            datagrid_cursos.AllowUserToAddRows = false;
            datagrid_cursos.AllowUserToDeleteRows = false;

            datagrid_cursos.Columns[0].Visible = false;
            datagrid_cursos.Columns[1].Visible = false;
            datagrid_cursos.Columns[2].Visible = false;

            datagrid_cursos.Refresh();

        }

        private void datagrid_cursos_Click(object sender, EventArgs e)
        {


        }

        private void btn_CreaNotas_Click(object sender, EventArgs e)
        {

            //Primera parte, borrar tabla
            Notas n = new Notas(BDD.sqlconexion, BDD.datasetBDD);

            n.DeleteNotasTabla();
            //Segunda parte, obtener alumnos

            DataView dv;
            dv = new DataView(alumno.Tabla());

            //Tercera parte, crear notas

            for (int i = 0; i < dv.Count; i++)
            {
                n.graba(dv[i][0].ToString(), dv[i][1].ToString(), 0, 0, 0, 0, 1);
            }

            MessageBox.Show("Notas generadas.", "Notas");

            //Limpia valores textbox

            txtbox_nota1.Text = "0";
            txtbox_nota2.Text = "0";
            txtbox_nota3.Text = "0";
            txtbox_media.Text = "0";

        }

        private void btn_calcmedia_Click(object sender, EventArgs e)
        {
            txtbox_media.Text = ((Convert.ToInt32(txtbox_nota1.Text) + Convert.ToInt32(txtbox_nota2.Text) + Convert.ToInt32(txtbox_nota3.Text)) / 3).ToString();
        }

        private void btn_grabarnota_Click(object sender, EventArgs e)
        {
            Notas n = new Notas(BDD.sqlconexion, BDD.datasetBDD);

            //Coge el cod alu del datagridview

            n.COD_ALU = datagrid_cursos.SelectedRows[0].Cells[0].Value.ToString();


            //Nueva vista para la table de notas
            DataView dv;
            dv = new DataView(n.Tabla());

            //Filtra y devuelve 1
            dv.RowFilter = "COD_ALU = '" + n.COD_ALU + "'";


            //Si vista.count = 0 no hay nada, crea nota
            if (dv.Count == 0 && txtbox_nota1.Text != "" && txtbox_nota2.Text != "" && txtbox_nota3.Text != "" && txtbox_media.Text != "")
            {
                n.graba(datagrid_cursos.SelectedRows[0].Cells[0].Value.ToString(), datagrid_cursos.SelectedRows[0].Cells[1].Value.ToString(), Convert.ToInt32(txtbox_nota1.Text), Convert.ToInt32(txtbox_nota2.Text), Convert.ToInt32(txtbox_nota3.Text), Convert.ToInt32(txtbox_media.Text), 1);
                MessageBox.Show("Nota añadida.", "Notas");
            }
            //Si vista.count > 0 hay nota, actualiza nota
            else if (dv.Count > 0 && txtbox_nota1.Text != "" && txtbox_nota2.Text != "" && txtbox_nota3.Text != "" && txtbox_media.Text != "")
            {
                n.graba(datagrid_cursos.SelectedRows[0].Cells[0].Value.ToString(), datagrid_cursos.SelectedRows[0].Cells[1].Value.ToString(), Convert.ToInt32(txtbox_nota1.Text), Convert.ToInt32(txtbox_nota2.Text), Convert.ToInt32(txtbox_nota3.Text), Convert.ToInt32(txtbox_media.Text), 0);
                MessageBox.Show("Nota actualizada.", "Notas");
            }
            else
            {
                MessageBox.Show("Campos erroneos", "Notas");

            }

        }

        private void datagrid_cursos_CellClick(object sender, DataGridViewCellEventArgs e)
        {

            if (e.ColumnIndex == -1)
            {
                //Habilita panel
                panel1.Visible = true;

                Notas n = new Notas(BDD.sqlconexion, BDD.datasetBDD);

                //Pilla el cod alu del datagridview
                n.COD_ALU = datagrid_cursos.SelectedRows[0].Cells[0].Value.ToString();

                string f = "COD_ALU = '" + n.COD_ALU + "'";

                //Crea vista
                DataView dv;
                dv = new DataView(n.Tabla());
                //Filtra vista de notas, devuelve 1 alumno
                dv.RowFilter = f;

                if (dv.Count == 0)
                {
                    txtbox_nota1.Text = "";
                    txtbox_nota2.Text = "";
                    txtbox_nota3.Text = "";
                    txtbox_media.Text = "";
                }
                else
                {
                    txtbox_nota1.Text = dv[0]["NOTA1"].ToString();
                    txtbox_nota2.Text = dv[0]["NOTA2"].ToString();
                    txtbox_nota3.Text = dv[0]["NOTA3"].ToString();
                    txtbox_media.Text = dv[0]["MEDIA"].ToString();
                }

            }

        }

        private void txtbox_nota1_Validating(object sender, CancelEventArgs e)
        {
            int parsedValue;
            if (!int.TryParse(txtbox_nota1.Text, out parsedValue))
            {
                MessageBox.Show("Aqui solo numeros!");
                txtbox_nota1.Focus();
                return;
            }
        }

        private void txtbox_nota2_Validating(object sender, CancelEventArgs e)
        {
            int parsedValue;
            if (!int.TryParse(txtbox_nota2.Text, out parsedValue))
            {
                MessageBox.Show("Aqui solo numeros!");
                txtbox_nota2.Focus();
                return;
            }
        }

        private void txtbox_nota3_TextChanged(object sender, EventArgs e)
        {
            int parsedValue;
            if (!int.TryParse(txtbox_nota3.Text, out parsedValue))
            {
                MessageBox.Show("Aqui solo numeros!");
                txtbox_nota3.Focus();
                return;
            }
        }

        private void txtbox_media_TextChanged(object sender, EventArgs e)
        {
            int parsedValue;
            if (!int.TryParse(txtbox_media.Text, out parsedValue))
            {
                MessageBox.Show("Aqui solo numeros!");
                txtbox_media.Focus();
                return;
            }
        }

        private void textBox_codalu_filter_TextChanged(object sender, EventArgs e)
        {
            Notas n = new Notas(BDD.sqlconexion, BDD.datasetBDD);

            string f = "MEDIA >= " + 6 + "";

            DataView dv;
            dv = new DataView(n.Tabla());
            dv.RowFilter = f;

            foreach (DataGridViewRow dtRow in datagrid_cursos.Rows)
            {
                for (int i = 0; i < dv.Count; i++)
                {
                    string a = dv[i]["MEDIA"].ToString();

                    if (Convert.ToInt32(dv[0]["MEDIA"].ToString()) < Convert.ToInt32(6))
                    {
                        datagrid_cursos.Rows.Remove(dtRow);

                    }
                    else
                    {
                        //datagrid_cursos.Rows.Remove(dtRow);
                    }

                }

                datagrid_cursos.Refresh();
            }
        }
    }
}
