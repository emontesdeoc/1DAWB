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
        Notas n;
        public Form1()
        {
            InitializeComponent();
            nuevo = 0;
            panel1.Visible = false;
            textBox_codalu_filter.Visible = false;
        }


        private void buttonABREBDD_Click(object sender, EventArgs e)
        {
            ///Intenta conectar con la base de datos
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
            ///Instanciamos los cursos, alumnos y notas
            curso = new Cursos(BDD.sqlconexion, BDD.datasetBDD);
            alumno = new Alumnos(BDD.sqlconexion, BDD.datasetBDD);
            n = new Notas(BDD.sqlconexion, BDD.datasetBDD);
            ///Rellena el curso
            rellenaCurso();
        }

        /// <summary>
        /// Metodo que rellena los cursos
        /// </summary>
        void rellenaCurso()
        {
            textBoxCOD_CUR.Text = curso.Cod_Cur;
            textBoxDES_CURSO.Text = curso.Descripcion;
            textBoxHORAS_CUR.Text = curso.Horas.ToString();
            textBoxTUTOR_CUR.Text = curso.Tutor;
        }

        /// <summary>
        /// Cierra la conexion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonCIERRA_BDD_Click(object sender, EventArgs e)
        {
            BDD.cerrarConexion();
        }

        /// <summary>
        /// Boton que muestra el primer curso
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonPRIMER_CUR_Click(object sender, EventArgs e)
        {
            curso.primero();
            rellenaCurso();
        }

        /// <summary>
        /// Boton que muestra el curso anterior
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonANTERIOR_CUR_Click(object sender, EventArgs e)
        {
            curso.anterior();
            rellenaCurso();
        }

        /// <summary>
        /// Metdo que muestra el curso siguiente
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonSIG_CUR_Click(object sender, EventArgs e)
        {
            curso.siguiente();
            rellenaCurso();
        }

        /// <summary>
        /// Metodo que muestra el ultimo curso
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonULTIMO_CUR_Click(object sender, EventArgs e)
        {
            curso.ultimo();
            rellenaCurso();
        }

        /// <summary>
        /// Crea un nuevo curso
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonNuevo_Click(object sender, EventArgs e)
        {
            nuevo = 1;
            textBoxCOD_CUR.Clear();
            textBoxDES_CURSO.Clear();
            textBoxHORAS_CUR.Clear();
            textBoxTUTOR_CUR.Clear();
        }

        /// <summary>
        /// Graba un nuevo curso
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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

        /// <summary>
        /// Borra el curso
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonBorra_Click(object sender, EventArgs e)
        {
            curso.Borra();
            buttonSIG_CUR.PerformClick();
        }


        /// <summary>
        /// Carga los alumnos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void cargaAlumnos_button_Click(object sender, EventArgs e)
        {
            ///Datasource es la tabla de alumnos
            dataGridView_alumnos.DataSource = alumno.tablaAlumnos;
            dataGridView_alumnos.ReadOnly = true;
            dataGridView_alumnos.AllowUserToAddRows = false;
            dataGridView_alumnos.AllowUserToDeleteRows = false;
            ((Button)sender).Enabled = false;
        }

        /// <summary>
        /// Metodo que carga las columnas de datagridview y crea los botones
        /// </summary>
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

        /// <summary>
        /// Metodo que edita o borra los alumnos en el datagridview
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dataGridView_alumnos_CellClick(object sender, DataGridViewCellEventArgs e)
        {

            int fila = e.RowIndex;
            int c = e.ColumnIndex;
            ///Utilizamos e.columindex para determinar donde se ha pulsado
            if (e.ColumnIndex == 5)
            {
                ///Crea un nuevo formulario para editar
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
                            0, fila);

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
                ///Crea un nuevo formulario para eliminar
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

        /// <summary>
        /// Crea un nuevo alumno, muestra un nuevo formulario donde se ingresan los datos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
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
                        1, 0);

                    dataGridView_alumnos.Update();
                }
                catch (Exception a)
                {

                    MessageBox.Show(a.Message);
                }
            }


        }

        /// <summary>
        /// Carga en el combobox los cursos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_loadcursos_Click(object sender, EventArgs e)
        {
            //Cursos a = new Cursos(BDD.sqlconexion, BDD.datasetBDD);

            comboBox_cursos.DataSource = curso.Tabla();
            comboBox_cursos.DisplayMember = "DESCRIPCION";
            comboBox_cursos.ValueMember = "COD_CUR";

        }

        /// <summary>
        /// Metodo que muestra en el datagridview los alumnos del curso seleccionado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void comboBox_cursos_SelectedValueChanged(object sender, EventArgs e)
        {

            RestartDataGridAlumnos();

            //Estilo datagridview cursos
            datagrid_cursos.ReadOnly = true;
            datagrid_cursos.AllowUserToAddRows = false;
            datagrid_cursos.AllowUserToDeleteRows = false;

            //Ocultar columnas innecesarias
            datagrid_cursos.Columns[0].Visible = false;
            datagrid_cursos.Columns[1].Visible = false;
            datagrid_cursos.Columns[2].Visible = false;

            //Actualizar datagrid
            datagrid_cursos.Refresh();

        }

        /// <summary>
        /// Crea notas borra toda la tabla, llamando a un metodo que borra todo de la tabla nota, y lueo por cada alumno crea sus notas
        /// todas a 0 incluyendo la media
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_CreaNotas_Click(object sender, EventArgs e)
        {

            panel1.Refresh();
            panel1.Visible = false;


            //Primera parte, borrar tabla
            //Notas n = new Notas(BDD.sqlconexion, BDD.datasetBDD);

            //Llama al metodo DeleteNotasTabla que borra toda los campos de la tabla Notas
            n.DeleteNotasTabla();

            //Segunda parte, obtener alumnos

            DataView dv;
            //La vista es de la tabla alumnos, ya que necesitamos la cantidad de alumnos para mas adelante acceder a los alumnos
            dv = new DataView(alumno.Tabla());

            //Tercera parte, crear notas

            for (int i = 0; i < dv.Count; i++)
            {
                //Agrega notas por cantidad de alumnos, saltando de fila y obteniendo la columna de COD_CUR y COD_ALU
                n.GrabarAlumno(dv[i][0].ToString(), dv[i][1].ToString(), 0, 0, 0, 0, 1);
            }

            //Muestra messagebox
            MessageBox.Show("Notas generadas.", "Notas");

            //Limpia valores textbox
            txtbox_nota1.Text = "0";
            txtbox_nota2.Text = "0";
            txtbox_nota3.Text = "0";
            txtbox_media.Text = "0";

            RestartDataGridAlumnos();

        }

        /// <summary>
        /// Calcula la media con los textboxes del panel de nueva nota
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_calcmedia_Click(object sender, EventArgs e)
        {
            txtbox_media.Text = ((Convert.ToInt32(txtbox_nota1.Text) + Convert.ToInt32(txtbox_nota2.Text) + Convert.ToInt32(txtbox_nota3.Text)) / 3).ToString();
        }

        /// <summary>
        /// Graba la nota, dependiendo si hay que actualizar o crear directamente, actualmente solo actualiza ya que todos los alumnos
        /// tienen nota 0 en sus campos, pero en el caso de que no hubiera nota, las crearia.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_grabarnota_Click(object sender, EventArgs e)
        {
            //Notas n = new Notas(BDD.sqlconexion, BDD.datasetBDD);

            //Coge el cod alu del datagridview
            n.COD_ALU = datagrid_cursos.SelectedRows[0].Cells[0].Value.ToString();

            //Nueva vista para la table de notas
            DataView dv;
            dv = new DataView(n.Tabla());

            //Filtra y devuelve 1 nota
            dv.RowFilter = "COD_ALU = '" + n.COD_ALU + "'";


            //Si la vista de alumno es 0, no tiene nota, por lo que la tiene que crear
            if (dv.Count == 0 && txtbox_nota1.Text != "" && txtbox_nota2.Text != "" && txtbox_nota3.Text != "" && txtbox_media.Text != "")
            {
                //Graba la nota
                n.GrabarAlumno(datagrid_cursos.SelectedRows[0].Cells[0].Value.ToString(), datagrid_cursos.SelectedRows[0].Cells[1].Value.ToString(), Convert.ToInt32(txtbox_nota1.Text), Convert.ToInt32(txtbox_nota2.Text), Convert.ToInt32(txtbox_nota3.Text), Convert.ToInt32(txtbox_media.Text), 1);
                //Muestra message box
                MessageBox.Show("Nota añadida.", "Notas");
            }
            //Si la vista de alumno es mayor a 0, significa que tiene una nota, porlo que la actualiza
            else if (dv.Count > 0 && txtbox_nota1.Text != "" && txtbox_nota2.Text != "" && txtbox_nota3.Text != "" && txtbox_media.Text != "")
            {
                //Actualiza la nota
                n.GrabarAlumno(datagrid_cursos.SelectedRows[0].Cells[0].Value.ToString(), datagrid_cursos.SelectedRows[0].Cells[1].Value.ToString(), Convert.ToInt32(txtbox_nota1.Text), Convert.ToInt32(txtbox_nota2.Text), Convert.ToInt32(txtbox_nota3.Text), Convert.ToInt32(txtbox_media.Text), 0);
                //Muestra message box
                MessageBox.Show("Nota actualizada.", "Notas");
            }
            else
            {
                //Mesage box cuando hay error en los campos
                MessageBox.Show("Campos erroneos", "Notas");

            }

        }

        /// <summary>
        /// Cuando pulsas en la celda del datagridview de alumnos por curso
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void datagrid_cursos_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //Pulsa la columna -1
            if (e.ColumnIndex == -1)
            {
                //Habilita panel
                panel1.Visible = true;

                //Crea vista
                DataView dv;
                dv = new DataView(n.Tabla());
                //Filtra vista de notas, devuelve 1 alumno
                dv.RowFilter = "COD_ALU = '" + datagrid_cursos.SelectedRows[0].Cells[0].Value.ToString() + "'";

                //Si la vista es 0, no existe
                if (dv.Count == 0)
                {
                    txtbox_nota1.Text = "";
                    txtbox_nota2.Text = "";
                    txtbox_nota3.Text = "";
                    txtbox_media.Text = "";
                }
                //Si la vista no es cero, actualiza los textboxes en el panel
                else
                {
                    txtbox_nota1.Text = dv[0]["NOTA1"].ToString();
                    txtbox_nota2.Text = dv[0]["NOTA2"].ToString();
                    txtbox_nota3.Text = dv[0]["NOTA3"].ToString();
                    txtbox_media.Text = dv[0]["MEDIA"].ToString();
                }

            }

        }

        /// <summary>
        /// Reinicia el datagrid con una nueva vista, luego de haber hecho cambios en la tablaCursos.
        /// </summary>
        private void RestartDataGridAlumnos()
        {
            string f = "COD_CUR = '" + curso.tablaCursos.Rows[comboBox_cursos.SelectedIndex][0].ToString() + "'";

            DataView dv;
            dv = new DataView(alumno.Tabla(), f, "DNI Desc", DataViewRowState.CurrentRows);
            datagrid_cursos.DataSource = dv;

        }

        /// <summary>
        /// Experimental ########################
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void textBox_codalu_filter_TextChanged(object sender, EventArgs e)
        {
            //Notas n = new Notas(BDD.sqlconexion, BDD.datasetBDD);

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
