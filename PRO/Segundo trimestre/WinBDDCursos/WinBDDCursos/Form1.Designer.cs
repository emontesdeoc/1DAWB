﻿namespace WinBDDCursos
{
    partial class Form1
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.buttonBorra = new System.Windows.Forms.Button();
            this.buttonGraba = new System.Windows.Forms.Button();
            this.buttonNuevo = new System.Windows.Forms.Button();
            this.buttonCIERRA_BDD = new System.Windows.Forms.Button();
            this.buttonPRIMER_CUR = new System.Windows.Forms.Button();
            this.buttonANTERIOR_CUR = new System.Windows.Forms.Button();
            this.buttonULTIMO_CUR = new System.Windows.Forms.Button();
            this.buttonSIG_CUR = new System.Windows.Forms.Button();
            this.buttonABREBDD = new System.Windows.Forms.Button();
            this.textBoxTUTOR_CUR = new System.Windows.Forms.TextBox();
            this.textBoxHORAS_CUR = new System.Windows.Forms.TextBox();
            this.textBoxDES_CURSO = new System.Windows.Forms.TextBox();
            this.textBoxCOD_CUR = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.dataGridView_alumnos = new System.Windows.Forms.DataGridView();
            this.nuevoAlumno_button = new System.Windows.Forms.Button();
            this.cargaAlumnos_button = new System.Windows.Forms.Button();
            this.tabNotas = new System.Windows.Forms.TabPage();
            this.textBox_codalu_filter = new System.Windows.Forms.TextBox();
            this.btn_loadcursos = new System.Windows.Forms.Button();
            this.datagrid_cursos = new System.Windows.Forms.DataGridView();
            this.panel1 = new System.Windows.Forms.Panel();
            this.txtbox_media = new System.Windows.Forms.TextBox();
            this.txtbox_nota3 = new System.Windows.Forms.TextBox();
            this.txtbox_nota2 = new System.Windows.Forms.TextBox();
            this.txtbox_nota1 = new System.Windows.Forms.TextBox();
            this.btn_grabarnota = new System.Windows.Forms.Button();
            this.btn_calcmedia = new System.Windows.Forms.Button();
            this.label10 = new System.Windows.Forms.Label();
            this.lbl_media = new System.Windows.Forms.Label();
            this.lbl_nota3 = new System.Windows.Forms.Label();
            this.lbl_nota2 = new System.Windows.Forms.Label();
            this.lbl_nota1 = new System.Windows.Forms.Label();
            this.btn_CreaNotas = new System.Windows.Forms.Button();
            this.comboBox_cursos = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_alumnos)).BeginInit();
            this.tabNotas.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.datagrid_cursos)).BeginInit();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabNotas);
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(837, 441);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.buttonBorra);
            this.tabPage1.Controls.Add(this.buttonGraba);
            this.tabPage1.Controls.Add(this.buttonNuevo);
            this.tabPage1.Controls.Add(this.buttonCIERRA_BDD);
            this.tabPage1.Controls.Add(this.buttonPRIMER_CUR);
            this.tabPage1.Controls.Add(this.buttonANTERIOR_CUR);
            this.tabPage1.Controls.Add(this.buttonULTIMO_CUR);
            this.tabPage1.Controls.Add(this.buttonSIG_CUR);
            this.tabPage1.Controls.Add(this.buttonABREBDD);
            this.tabPage1.Controls.Add(this.textBoxTUTOR_CUR);
            this.tabPage1.Controls.Add(this.textBoxHORAS_CUR);
            this.tabPage1.Controls.Add(this.textBoxDES_CURSO);
            this.tabPage1.Controls.Add(this.textBoxCOD_CUR);
            this.tabPage1.Controls.Add(this.label4);
            this.tabPage1.Controls.Add(this.label3);
            this.tabPage1.Controls.Add(this.label2);
            this.tabPage1.Controls.Add(this.label1);
            this.tabPage1.Location = new System.Drawing.Point(4, 25);
            this.tabPage1.Margin = new System.Windows.Forms.Padding(0);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tabPage1.Size = new System.Drawing.Size(829, 412);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Cursos";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // buttonBorra
            // 
            this.buttonBorra.Location = new System.Drawing.Point(637, 325);
            this.buttonBorra.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonBorra.Name = "buttonBorra";
            this.buttonBorra.Size = new System.Drawing.Size(100, 71);
            this.buttonBorra.TabIndex = 16;
            this.buttonBorra.Text = "Borra";
            this.buttonBorra.UseVisualStyleBackColor = true;
            this.buttonBorra.Click += new System.EventHandler(this.buttonBorra_Click);
            // 
            // buttonGraba
            // 
            this.buttonGraba.Location = new System.Drawing.Point(637, 244);
            this.buttonGraba.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonGraba.Name = "buttonGraba";
            this.buttonGraba.Size = new System.Drawing.Size(100, 71);
            this.buttonGraba.TabIndex = 15;
            this.buttonGraba.Text = "Graba";
            this.buttonGraba.UseVisualStyleBackColor = true;
            this.buttonGraba.Click += new System.EventHandler(this.buttonGraba_Click);
            // 
            // buttonNuevo
            // 
            this.buttonNuevo.Location = new System.Drawing.Point(637, 165);
            this.buttonNuevo.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonNuevo.Name = "buttonNuevo";
            this.buttonNuevo.Size = new System.Drawing.Size(100, 71);
            this.buttonNuevo.TabIndex = 14;
            this.buttonNuevo.Text = "Nuevo";
            this.buttonNuevo.UseVisualStyleBackColor = true;
            this.buttonNuevo.Click += new System.EventHandler(this.buttonNuevo_Click);
            // 
            // buttonCIERRA_BDD
            // 
            this.buttonCIERRA_BDD.Location = new System.Drawing.Point(637, 86);
            this.buttonCIERRA_BDD.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonCIERRA_BDD.Name = "buttonCIERRA_BDD";
            this.buttonCIERRA_BDD.Size = new System.Drawing.Size(100, 71);
            this.buttonCIERRA_BDD.TabIndex = 13;
            this.buttonCIERRA_BDD.Text = "Cierra BDD";
            this.buttonCIERRA_BDD.UseVisualStyleBackColor = true;
            this.buttonCIERRA_BDD.Click += new System.EventHandler(this.buttonCIERRA_BDD_Click);
            // 
            // buttonPRIMER_CUR
            // 
            this.buttonPRIMER_CUR.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonPRIMER_CUR.Location = new System.Drawing.Point(51, 273);
            this.buttonPRIMER_CUR.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonPRIMER_CUR.Name = "buttonPRIMER_CUR";
            this.buttonPRIMER_CUR.Size = new System.Drawing.Size(61, 28);
            this.buttonPRIMER_CUR.TabIndex = 12;
            this.buttonPRIMER_CUR.Text = "|<<";
            this.buttonPRIMER_CUR.UseVisualStyleBackColor = true;
            this.buttonPRIMER_CUR.Click += new System.EventHandler(this.buttonPRIMER_CUR_Click);
            // 
            // buttonANTERIOR_CUR
            // 
            this.buttonANTERIOR_CUR.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonANTERIOR_CUR.Location = new System.Drawing.Point(159, 273);
            this.buttonANTERIOR_CUR.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonANTERIOR_CUR.Name = "buttonANTERIOR_CUR";
            this.buttonANTERIOR_CUR.Size = new System.Drawing.Size(61, 28);
            this.buttonANTERIOR_CUR.TabIndex = 11;
            this.buttonANTERIOR_CUR.Text = "<<";
            this.buttonANTERIOR_CUR.UseVisualStyleBackColor = true;
            this.buttonANTERIOR_CUR.Click += new System.EventHandler(this.buttonANTERIOR_CUR_Click);
            // 
            // buttonULTIMO_CUR
            // 
            this.buttonULTIMO_CUR.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonULTIMO_CUR.Location = new System.Drawing.Point(368, 273);
            this.buttonULTIMO_CUR.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonULTIMO_CUR.Name = "buttonULTIMO_CUR";
            this.buttonULTIMO_CUR.Size = new System.Drawing.Size(61, 28);
            this.buttonULTIMO_CUR.TabIndex = 10;
            this.buttonULTIMO_CUR.Text = ">>|";
            this.buttonULTIMO_CUR.UseVisualStyleBackColor = true;
            this.buttonULTIMO_CUR.Click += new System.EventHandler(this.buttonULTIMO_CUR_Click);
            // 
            // buttonSIG_CUR
            // 
            this.buttonSIG_CUR.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonSIG_CUR.Location = new System.Drawing.Point(261, 273);
            this.buttonSIG_CUR.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonSIG_CUR.Name = "buttonSIG_CUR";
            this.buttonSIG_CUR.Size = new System.Drawing.Size(61, 28);
            this.buttonSIG_CUR.TabIndex = 9;
            this.buttonSIG_CUR.Text = ">>";
            this.buttonSIG_CUR.UseVisualStyleBackColor = true;
            this.buttonSIG_CUR.Click += new System.EventHandler(this.buttonSIG_CUR_Click);
            // 
            // buttonABREBDD
            // 
            this.buttonABREBDD.Location = new System.Drawing.Point(637, 7);
            this.buttonABREBDD.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.buttonABREBDD.Name = "buttonABREBDD";
            this.buttonABREBDD.Size = new System.Drawing.Size(100, 71);
            this.buttonABREBDD.TabIndex = 8;
            this.buttonABREBDD.Text = "Abre BDD";
            this.buttonABREBDD.UseVisualStyleBackColor = true;
            this.buttonABREBDD.Click += new System.EventHandler(this.buttonABREBDD_Click);
            // 
            // textBoxTUTOR_CUR
            // 
            this.textBoxTUTOR_CUR.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxTUTOR_CUR.Location = new System.Drawing.Point(207, 177);
            this.textBoxTUTOR_CUR.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.textBoxTUTOR_CUR.Name = "textBoxTUTOR_CUR";
            this.textBoxTUTOR_CUR.Size = new System.Drawing.Size(323, 26);
            this.textBoxTUTOR_CUR.TabIndex = 7;
            // 
            // textBoxHORAS_CUR
            // 
            this.textBoxHORAS_CUR.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxHORAS_CUR.Location = new System.Drawing.Point(207, 123);
            this.textBoxHORAS_CUR.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.textBoxHORAS_CUR.Name = "textBoxHORAS_CUR";
            this.textBoxHORAS_CUR.Size = new System.Drawing.Size(132, 26);
            this.textBoxHORAS_CUR.TabIndex = 6;
            // 
            // textBoxDES_CURSO
            // 
            this.textBoxDES_CURSO.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxDES_CURSO.Location = new System.Drawing.Point(207, 79);
            this.textBoxDES_CURSO.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.textBoxDES_CURSO.Name = "textBoxDES_CURSO";
            this.textBoxDES_CURSO.Size = new System.Drawing.Size(323, 26);
            this.textBoxDES_CURSO.TabIndex = 5;
            // 
            // textBoxCOD_CUR
            // 
            this.textBoxCOD_CUR.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxCOD_CUR.Location = new System.Drawing.Point(207, 30);
            this.textBoxCOD_CUR.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.textBoxCOD_CUR.Name = "textBoxCOD_CUR";
            this.textBoxCOD_CUR.Size = new System.Drawing.Size(132, 26);
            this.textBoxCOD_CUR.TabIndex = 4;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(51, 177);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(55, 22);
            this.label4.TabIndex = 3;
            this.label4.Text = "Tutor";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(51, 128);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(62, 22);
            this.label3.TabIndex = 2;
            this.label3.Text = "Horas";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(51, 79);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(112, 22);
            this.label2.TabIndex = 1;
            this.label2.Text = "Descripción";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(51, 32);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(61, 22);
            this.label1.TabIndex = 0;
            this.label1.Text = "Curso";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.dataGridView_alumnos);
            this.tabPage2.Controls.Add(this.nuevoAlumno_button);
            this.tabPage2.Controls.Add(this.cargaAlumnos_button);
            this.tabPage2.Location = new System.Drawing.Point(4, 25);
            this.tabPage2.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tabPage2.Size = new System.Drawing.Size(829, 412);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Alumnos";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // dataGridView_alumnos
            // 
            this.dataGridView_alumnos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView_alumnos.Location = new System.Drawing.Point(179, 22);
            this.dataGridView_alumnos.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.dataGridView_alumnos.Name = "dataGridView_alumnos";
            this.dataGridView_alumnos.Size = new System.Drawing.Size(636, 374);
            this.dataGridView_alumnos.TabIndex = 2;
            this.dataGridView_alumnos.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_alumnos_CellClick);
            this.dataGridView_alumnos.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_alumnos_CellContentClick);
            // 
            // nuevoAlumno_button
            // 
            this.nuevoAlumno_button.Location = new System.Drawing.Point(27, 103);
            this.nuevoAlumno_button.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.nuevoAlumno_button.Name = "nuevoAlumno_button";
            this.nuevoAlumno_button.Size = new System.Drawing.Size(131, 63);
            this.nuevoAlumno_button.TabIndex = 1;
            this.nuevoAlumno_button.Text = "Nuevo";
            this.nuevoAlumno_button.UseVisualStyleBackColor = true;
            this.nuevoAlumno_button.Click += new System.EventHandler(this.nuevoAlumno_button_Click);
            // 
            // cargaAlumnos_button
            // 
            this.cargaAlumnos_button.Location = new System.Drawing.Point(27, 22);
            this.cargaAlumnos_button.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.cargaAlumnos_button.Name = "cargaAlumnos_button";
            this.cargaAlumnos_button.Size = new System.Drawing.Size(131, 63);
            this.cargaAlumnos_button.TabIndex = 0;
            this.cargaAlumnos_button.Text = "Carga Alumnos";
            this.cargaAlumnos_button.UseVisualStyleBackColor = true;
            this.cargaAlumnos_button.Click += new System.EventHandler(this.cargaAlumnos_button_Click);
            // 
            // tabNotas
            // 
            this.tabNotas.Controls.Add(this.textBox_codalu_filter);
            this.tabNotas.Controls.Add(this.btn_loadcursos);
            this.tabNotas.Controls.Add(this.datagrid_cursos);
            this.tabNotas.Controls.Add(this.panel1);
            this.tabNotas.Controls.Add(this.btn_CreaNotas);
            this.tabNotas.Controls.Add(this.comboBox_cursos);
            this.tabNotas.Controls.Add(this.label5);
            this.tabNotas.Location = new System.Drawing.Point(4, 25);
            this.tabNotas.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tabNotas.Name = "tabNotas";
            this.tabNotas.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.tabNotas.Size = new System.Drawing.Size(829, 412);
            this.tabNotas.TabIndex = 2;
            this.tabNotas.Text = "Notas";
            this.tabNotas.UseVisualStyleBackColor = true;
            // 
            // textBox_codalu_filter
            // 
            this.textBox_codalu_filter.Location = new System.Drawing.Point(248, 33);
            this.textBox_codalu_filter.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.textBox_codalu_filter.Name = "textBox_codalu_filter";
            this.textBox_codalu_filter.Size = new System.Drawing.Size(132, 22);
            this.textBox_codalu_filter.TabIndex = 6;
            this.textBox_codalu_filter.TextChanged += new System.EventHandler(this.textBox_codalu_filter_TextChanged);
            // 
            // btn_loadcursos
            // 
            this.btn_loadcursos.Location = new System.Drawing.Point(48, 33);
            this.btn_loadcursos.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btn_loadcursos.Name = "btn_loadcursos";
            this.btn_loadcursos.Size = new System.Drawing.Size(161, 28);
            this.btn_loadcursos.TabIndex = 5;
            this.btn_loadcursos.Text = "Cargar cursos";
            this.btn_loadcursos.UseVisualStyleBackColor = true;
            this.btn_loadcursos.Click += new System.EventHandler(this.btn_loadcursos_Click);
            // 
            // datagrid_cursos
            // 
            this.datagrid_cursos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.datagrid_cursos.Location = new System.Drawing.Point(43, 151);
            this.datagrid_cursos.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.datagrid_cursos.Name = "datagrid_cursos";
            this.datagrid_cursos.Size = new System.Drawing.Size(339, 223);
            this.datagrid_cursos.TabIndex = 4;
            this.datagrid_cursos.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.datagrid_cursos_CellClick);
            this.datagrid_cursos.Click += new System.EventHandler(this.datagrid_cursos_Click);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.txtbox_media);
            this.panel1.Controls.Add(this.txtbox_nota3);
            this.panel1.Controls.Add(this.txtbox_nota2);
            this.panel1.Controls.Add(this.txtbox_nota1);
            this.panel1.Controls.Add(this.btn_grabarnota);
            this.panel1.Controls.Add(this.btn_calcmedia);
            this.panel1.Controls.Add(this.label10);
            this.panel1.Controls.Add(this.lbl_media);
            this.panel1.Controls.Add(this.lbl_nota3);
            this.panel1.Controls.Add(this.lbl_nota2);
            this.panel1.Controls.Add(this.lbl_nota1);
            this.panel1.Location = new System.Drawing.Point(441, 33);
            this.panel1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(348, 341);
            this.panel1.TabIndex = 3;
            // 
            // txtbox_media
            // 
            this.txtbox_media.Location = new System.Drawing.Point(156, 206);
            this.txtbox_media.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txtbox_media.Name = "txtbox_media";
            this.txtbox_media.Size = new System.Drawing.Size(132, 22);
            this.txtbox_media.TabIndex = 10;
            this.txtbox_media.TextChanged += new System.EventHandler(this.txtbox_media_TextChanged);
            // 
            // txtbox_nota3
            // 
            this.txtbox_nota3.Location = new System.Drawing.Point(156, 159);
            this.txtbox_nota3.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txtbox_nota3.Name = "txtbox_nota3";
            this.txtbox_nota3.Size = new System.Drawing.Size(132, 22);
            this.txtbox_nota3.TabIndex = 9;
            this.txtbox_nota3.TextChanged += new System.EventHandler(this.txtbox_nota3_TextChanged);
            // 
            // txtbox_nota2
            // 
            this.txtbox_nota2.Location = new System.Drawing.Point(156, 114);
            this.txtbox_nota2.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txtbox_nota2.Name = "txtbox_nota2";
            this.txtbox_nota2.Size = new System.Drawing.Size(132, 22);
            this.txtbox_nota2.TabIndex = 8;
            // 
            // txtbox_nota1
            // 
            this.txtbox_nota1.Location = new System.Drawing.Point(156, 65);
            this.txtbox_nota1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txtbox_nota1.Name = "txtbox_nota1";
            this.txtbox_nota1.Size = new System.Drawing.Size(132, 22);
            this.txtbox_nota1.TabIndex = 7;
            // 
            // btn_grabarnota
            // 
            this.btn_grabarnota.Location = new System.Drawing.Point(189, 265);
            this.btn_grabarnota.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btn_grabarnota.Name = "btn_grabarnota";
            this.btn_grabarnota.Size = new System.Drawing.Size(100, 46);
            this.btn_grabarnota.TabIndex = 6;
            this.btn_grabarnota.Text = "Grabar notas";
            this.btn_grabarnota.UseVisualStyleBackColor = true;
            this.btn_grabarnota.Click += new System.EventHandler(this.btn_grabarnota_Click);
            // 
            // btn_calcmedia
            // 
            this.btn_calcmedia.Location = new System.Drawing.Point(61, 265);
            this.btn_calcmedia.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btn_calcmedia.Name = "btn_calcmedia";
            this.btn_calcmedia.Size = new System.Drawing.Size(100, 48);
            this.btn_calcmedia.TabIndex = 5;
            this.btn_calcmedia.Text = "Calcular media";
            this.btn_calcmedia.UseVisualStyleBackColor = true;
            this.btn_calcmedia.Click += new System.EventHandler(this.btn_calcmedia_Click);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(152, 12);
            this.label10.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(55, 17);
            this.label10.TabIndex = 4;
            this.label10.Text = "Alumno";
            // 
            // lbl_media
            // 
            this.lbl_media.AutoSize = true;
            this.lbl_media.Location = new System.Drawing.Point(57, 209);
            this.lbl_media.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbl_media.Name = "lbl_media";
            this.lbl_media.Size = new System.Drawing.Size(46, 17);
            this.lbl_media.TabIndex = 3;
            this.lbl_media.Text = "Media";
            // 
            // lbl_nota3
            // 
            this.lbl_nota3.AutoSize = true;
            this.lbl_nota3.Location = new System.Drawing.Point(57, 162);
            this.lbl_nota3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbl_nota3.Name = "lbl_nota3";
            this.lbl_nota3.Size = new System.Drawing.Size(50, 17);
            this.lbl_nota3.TabIndex = 2;
            this.lbl_nota3.Text = "Nota 3";
            // 
            // lbl_nota2
            // 
            this.lbl_nota2.AutoSize = true;
            this.lbl_nota2.Location = new System.Drawing.Point(57, 118);
            this.lbl_nota2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbl_nota2.Name = "lbl_nota2";
            this.lbl_nota2.Size = new System.Drawing.Size(50, 17);
            this.lbl_nota2.TabIndex = 1;
            this.lbl_nota2.Text = "Nota 2";
            // 
            // lbl_nota1
            // 
            this.lbl_nota1.AutoSize = true;
            this.lbl_nota1.Location = new System.Drawing.Point(57, 69);
            this.lbl_nota1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lbl_nota1.Name = "lbl_nota1";
            this.lbl_nota1.Size = new System.Drawing.Size(50, 17);
            this.lbl_nota1.TabIndex = 0;
            this.lbl_nota1.Text = "Nota 1";
            // 
            // btn_CreaNotas
            // 
            this.btn_CreaNotas.Location = new System.Drawing.Point(281, 102);
            this.btn_CreaNotas.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btn_CreaNotas.Name = "btn_CreaNotas";
            this.btn_CreaNotas.Size = new System.Drawing.Size(100, 28);
            this.btn_CreaNotas.TabIndex = 2;
            this.btn_CreaNotas.Text = "Crea notas";
            this.btn_CreaNotas.UseVisualStyleBackColor = true;
            this.btn_CreaNotas.Click += new System.EventHandler(this.btn_CreaNotas_Click);
            // 
            // comboBox_cursos
            // 
            this.comboBox_cursos.FormattingEnabled = true;
            this.comboBox_cursos.Location = new System.Drawing.Point(97, 102);
            this.comboBox_cursos.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.comboBox_cursos.Name = "comboBox_cursos";
            this.comboBox_cursos.Size = new System.Drawing.Size(160, 24);
            this.comboBox_cursos.TabIndex = 1;
            this.comboBox_cursos.SelectedIndexChanged += new System.EventHandler(this.comboBox_cursos_SelectedIndexChanged);
            this.comboBox_cursos.SelectedValueChanged += new System.EventHandler(this.comboBox_cursos_SelectedValueChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(44, 108);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(45, 17);
            this.label5.TabIndex = 0;
            this.label5.Text = "Curso";
            this.label5.Click += new System.EventHandler(this.label5_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(836, 438);
            this.Controls.Add(this.tabControl1);
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_alumnos)).EndInit();
            this.tabNotas.ResumeLayout(false);
            this.tabNotas.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.datagrid_cursos)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.Button buttonPRIMER_CUR;
        private System.Windows.Forms.Button buttonANTERIOR_CUR;
        private System.Windows.Forms.Button buttonULTIMO_CUR;
        private System.Windows.Forms.Button buttonSIG_CUR;
        private System.Windows.Forms.Button buttonABREBDD;
        private System.Windows.Forms.TextBox textBoxTUTOR_CUR;
        private System.Windows.Forms.TextBox textBoxHORAS_CUR;
        private System.Windows.Forms.TextBox textBoxDES_CURSO;
        private System.Windows.Forms.TextBox textBoxCOD_CUR;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Button buttonCIERRA_BDD;
        private System.Windows.Forms.Button buttonNuevo;
        private System.Windows.Forms.Button buttonGraba;
        private System.Windows.Forms.Button buttonBorra;
        private System.Windows.Forms.DataGridView dataGridView_alumnos;
        private System.Windows.Forms.Button nuevoAlumno_button;
        private System.Windows.Forms.Button cargaAlumnos_button;
        private System.Windows.Forms.TabPage tabNotas;
        private System.Windows.Forms.DataGridView datagrid_cursos;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btn_CreaNotas;
        private System.Windows.Forms.ComboBox comboBox_cursos;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btn_loadcursos;
        private System.Windows.Forms.TextBox txtbox_media;
        private System.Windows.Forms.TextBox txtbox_nota3;
        private System.Windows.Forms.TextBox txtbox_nota2;
        private System.Windows.Forms.TextBox txtbox_nota1;
        private System.Windows.Forms.Button btn_grabarnota;
        private System.Windows.Forms.Button btn_calcmedia;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label lbl_media;
        private System.Windows.Forms.Label lbl_nota3;
        private System.Windows.Forms.Label lbl_nota2;
        private System.Windows.Forms.Label lbl_nota1;
        private System.Windows.Forms.TextBox textBox_codalu_filter;
    }
}

