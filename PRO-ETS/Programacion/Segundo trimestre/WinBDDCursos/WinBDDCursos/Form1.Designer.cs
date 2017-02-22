namespace WinBDDCursos
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
            this.cargaAlumnos_button = new System.Windows.Forms.Button();
            this.nuevoAlumno_button = new System.Windows.Forms.Button();
            this.dataGridView_alumnos = new System.Windows.Forms.DataGridView();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_alumnos)).BeginInit();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(628, 358);
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
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Margin = new System.Windows.Forms.Padding(0);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(620, 332);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Cursos";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // buttonBorra
            // 
            this.buttonBorra.Location = new System.Drawing.Point(478, 264);
            this.buttonBorra.Name = "buttonBorra";
            this.buttonBorra.Size = new System.Drawing.Size(75, 58);
            this.buttonBorra.TabIndex = 16;
            this.buttonBorra.Text = "Borra";
            this.buttonBorra.UseVisualStyleBackColor = true;
            this.buttonBorra.Click += new System.EventHandler(this.buttonBorra_Click);
            // 
            // buttonGraba
            // 
            this.buttonGraba.Location = new System.Drawing.Point(478, 198);
            this.buttonGraba.Name = "buttonGraba";
            this.buttonGraba.Size = new System.Drawing.Size(75, 58);
            this.buttonGraba.TabIndex = 15;
            this.buttonGraba.Text = "Graba";
            this.buttonGraba.UseVisualStyleBackColor = true;
            this.buttonGraba.Click += new System.EventHandler(this.buttonGraba_Click);
            // 
            // buttonNuevo
            // 
            this.buttonNuevo.Location = new System.Drawing.Point(478, 134);
            this.buttonNuevo.Name = "buttonNuevo";
            this.buttonNuevo.Size = new System.Drawing.Size(75, 58);
            this.buttonNuevo.TabIndex = 14;
            this.buttonNuevo.Text = "Nuevo";
            this.buttonNuevo.UseVisualStyleBackColor = true;
            this.buttonNuevo.Click += new System.EventHandler(this.buttonNuevo_Click);
            // 
            // buttonCIERRA_BDD
            // 
            this.buttonCIERRA_BDD.Location = new System.Drawing.Point(478, 70);
            this.buttonCIERRA_BDD.Name = "buttonCIERRA_BDD";
            this.buttonCIERRA_BDD.Size = new System.Drawing.Size(75, 58);
            this.buttonCIERRA_BDD.TabIndex = 13;
            this.buttonCIERRA_BDD.Text = "Cierra BDD";
            this.buttonCIERRA_BDD.UseVisualStyleBackColor = true;
            this.buttonCIERRA_BDD.Click += new System.EventHandler(this.buttonCIERRA_BDD_Click);
            // 
            // buttonPRIMER_CUR
            // 
            this.buttonPRIMER_CUR.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonPRIMER_CUR.Location = new System.Drawing.Point(38, 222);
            this.buttonPRIMER_CUR.Name = "buttonPRIMER_CUR";
            this.buttonPRIMER_CUR.Size = new System.Drawing.Size(46, 23);
            this.buttonPRIMER_CUR.TabIndex = 12;
            this.buttonPRIMER_CUR.Text = "|<<";
            this.buttonPRIMER_CUR.UseVisualStyleBackColor = true;
            this.buttonPRIMER_CUR.Click += new System.EventHandler(this.buttonPRIMER_CUR_Click);
            // 
            // buttonANTERIOR_CUR
            // 
            this.buttonANTERIOR_CUR.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonANTERIOR_CUR.Location = new System.Drawing.Point(119, 222);
            this.buttonANTERIOR_CUR.Name = "buttonANTERIOR_CUR";
            this.buttonANTERIOR_CUR.Size = new System.Drawing.Size(46, 23);
            this.buttonANTERIOR_CUR.TabIndex = 11;
            this.buttonANTERIOR_CUR.Text = "<<";
            this.buttonANTERIOR_CUR.UseVisualStyleBackColor = true;
            this.buttonANTERIOR_CUR.Click += new System.EventHandler(this.buttonANTERIOR_CUR_Click);
            // 
            // buttonULTIMO_CUR
            // 
            this.buttonULTIMO_CUR.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonULTIMO_CUR.Location = new System.Drawing.Point(276, 222);
            this.buttonULTIMO_CUR.Name = "buttonULTIMO_CUR";
            this.buttonULTIMO_CUR.Size = new System.Drawing.Size(46, 23);
            this.buttonULTIMO_CUR.TabIndex = 10;
            this.buttonULTIMO_CUR.Text = ">>|";
            this.buttonULTIMO_CUR.UseVisualStyleBackColor = true;
            this.buttonULTIMO_CUR.Click += new System.EventHandler(this.buttonULTIMO_CUR_Click);
            // 
            // buttonSIG_CUR
            // 
            this.buttonSIG_CUR.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonSIG_CUR.Location = new System.Drawing.Point(196, 222);
            this.buttonSIG_CUR.Name = "buttonSIG_CUR";
            this.buttonSIG_CUR.Size = new System.Drawing.Size(46, 23);
            this.buttonSIG_CUR.TabIndex = 9;
            this.buttonSIG_CUR.Text = ">>";
            this.buttonSIG_CUR.UseVisualStyleBackColor = true;
            this.buttonSIG_CUR.Click += new System.EventHandler(this.buttonSIG_CUR_Click);
            // 
            // buttonABREBDD
            // 
            this.buttonABREBDD.Location = new System.Drawing.Point(478, 6);
            this.buttonABREBDD.Name = "buttonABREBDD";
            this.buttonABREBDD.Size = new System.Drawing.Size(75, 58);
            this.buttonABREBDD.TabIndex = 8;
            this.buttonABREBDD.Text = "Abre BDD";
            this.buttonABREBDD.UseVisualStyleBackColor = true;
            this.buttonABREBDD.Click += new System.EventHandler(this.buttonABREBDD_Click);
            // 
            // textBoxTUTOR_CUR
            // 
            this.textBoxTUTOR_CUR.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxTUTOR_CUR.Location = new System.Drawing.Point(155, 144);
            this.textBoxTUTOR_CUR.Name = "textBoxTUTOR_CUR";
            this.textBoxTUTOR_CUR.Size = new System.Drawing.Size(243, 22);
            this.textBoxTUTOR_CUR.TabIndex = 7;
            // 
            // textBoxHORAS_CUR
            // 
            this.textBoxHORAS_CUR.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxHORAS_CUR.Location = new System.Drawing.Point(155, 100);
            this.textBoxHORAS_CUR.Name = "textBoxHORAS_CUR";
            this.textBoxHORAS_CUR.Size = new System.Drawing.Size(100, 22);
            this.textBoxHORAS_CUR.TabIndex = 6;
            // 
            // textBoxDES_CURSO
            // 
            this.textBoxDES_CURSO.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxDES_CURSO.Location = new System.Drawing.Point(155, 64);
            this.textBoxDES_CURSO.Name = "textBoxDES_CURSO";
            this.textBoxDES_CURSO.Size = new System.Drawing.Size(243, 22);
            this.textBoxDES_CURSO.TabIndex = 5;
            // 
            // textBoxCOD_CUR
            // 
            this.textBoxCOD_CUR.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBoxCOD_CUR.Location = new System.Drawing.Point(155, 24);
            this.textBoxCOD_CUR.Name = "textBoxCOD_CUR";
            this.textBoxCOD_CUR.Size = new System.Drawing.Size(100, 22);
            this.textBoxCOD_CUR.TabIndex = 4;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(38, 144);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(46, 18);
            this.label4.TabIndex = 3;
            this.label4.Text = "Tutor";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(38, 104);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(52, 18);
            this.label3.TabIndex = 2;
            this.label3.Text = "Horas";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(38, 64);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(93, 18);
            this.label2.TabIndex = 1;
            this.label2.Text = "Descripción";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(38, 26);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(50, 18);
            this.label1.TabIndex = 0;
            this.label1.Text = "Curso";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.dataGridView_alumnos);
            this.tabPage2.Controls.Add(this.nuevoAlumno_button);
            this.tabPage2.Controls.Add(this.cargaAlumnos_button);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(620, 332);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Alumnos";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // cargaAlumnos_button
            // 
            this.cargaAlumnos_button.Location = new System.Drawing.Point(20, 18);
            this.cargaAlumnos_button.Name = "cargaAlumnos_button";
            this.cargaAlumnos_button.Size = new System.Drawing.Size(98, 51);
            this.cargaAlumnos_button.TabIndex = 0;
            this.cargaAlumnos_button.Text = "Carga Alumnos";
            this.cargaAlumnos_button.UseVisualStyleBackColor = true;
            this.cargaAlumnos_button.Click += new System.EventHandler(this.cargaAlumnos_button_Click);
            // 
            // nuevoAlumno_button
            // 
            this.nuevoAlumno_button.Location = new System.Drawing.Point(20, 84);
            this.nuevoAlumno_button.Name = "nuevoAlumno_button";
            this.nuevoAlumno_button.Size = new System.Drawing.Size(98, 51);
            this.nuevoAlumno_button.TabIndex = 1;
            this.nuevoAlumno_button.Text = "Nuevo";
            this.nuevoAlumno_button.UseVisualStyleBackColor = true;
            // 
            // dataGridView_alumnos
            // 
            this.dataGridView_alumnos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView_alumnos.Location = new System.Drawing.Point(134, 18);
            this.dataGridView_alumnos.Name = "dataGridView_alumnos";
            this.dataGridView_alumnos.Size = new System.Drawing.Size(477, 304);
            this.dataGridView_alumnos.TabIndex = 2;
            this.dataGridView_alumnos.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_alumnos_CellClick);
            this.dataGridView_alumnos.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView_alumnos_CellContentClick);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(627, 356);
            this.Controls.Add(this.tabControl1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_alumnos)).EndInit();
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
    }
}

