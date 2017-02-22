namespace WinBDDCursos
{
    partial class FormAlumno
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.button_aceptar = new System.Windows.Forms.Button();
            this.button_cancelar = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.textBox5 = new System.Windows.Forms.TextBox();
            this.label_codalu = new System.Windows.Forms.Label();
            this.label_codcur = new System.Windows.Forms.Label();
            this.label_dni = new System.Windows.Forms.Label();
            this.label_apellido = new System.Windows.Forms.Label();
            this.label_nombre = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // button_aceptar
            // 
            this.button_aceptar.Location = new System.Drawing.Point(165, 311);
            this.button_aceptar.Name = "button_aceptar";
            this.button_aceptar.Size = new System.Drawing.Size(90, 34);
            this.button_aceptar.TabIndex = 0;
            this.button_aceptar.Text = "Aceptar";
            this.button_aceptar.UseVisualStyleBackColor = true;
            this.button_aceptar.Click += new System.EventHandler(this.button_aceptar_Click);
            // 
            // button_cancelar
            // 
            this.button_cancelar.Location = new System.Drawing.Point(310, 311);
            this.button_cancelar.Name = "button_cancelar";
            this.button_cancelar.Size = new System.Drawing.Size(90, 34);
            this.button_cancelar.TabIndex = 1;
            this.button_cancelar.Text = "Cancelar";
            this.button_cancelar.UseVisualStyleBackColor = true;
            this.button_cancelar.Click += new System.EventHandler(this.button_cancelar_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(232, 51);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 20);
            this.textBox1.TabIndex = 2;
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(232, 90);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(100, 20);
            this.textBox2.TabIndex = 3;
            // 
            // textBox3
            // 
            this.textBox3.Location = new System.Drawing.Point(232, 138);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(100, 20);
            this.textBox3.TabIndex = 4;
            // 
            // textBox4
            // 
            this.textBox4.Location = new System.Drawing.Point(232, 180);
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new System.Drawing.Size(241, 20);
            this.textBox4.TabIndex = 5;
            // 
            // textBox5
            // 
            this.textBox5.Location = new System.Drawing.Point(232, 231);
            this.textBox5.Name = "textBox5";
            this.textBox5.Size = new System.Drawing.Size(241, 20);
            this.textBox5.TabIndex = 6;
            // 
            // label_codalu
            // 
            this.label_codalu.AutoSize = true;
            this.label_codalu.Location = new System.Drawing.Point(66, 51);
            this.label_codalu.Name = "label_codalu";
            this.label_codalu.Size = new System.Drawing.Size(77, 13);
            this.label_codalu.TabIndex = 7;
            this.label_codalu.Text = "Codigo alumno";
            // 
            // label_codcur
            // 
            this.label_codcur.AutoSize = true;
            this.label_codcur.Location = new System.Drawing.Point(66, 97);
            this.label_codcur.Name = "label_codcur";
            this.label_codcur.Size = new System.Drawing.Size(69, 13);
            this.label_codcur.TabIndex = 8;
            this.label_codcur.Text = "Codigo curso";
            // 
            // label_dni
            // 
            this.label_dni.AutoSize = true;
            this.label_dni.Location = new System.Drawing.Point(66, 145);
            this.label_dni.Name = "label_dni";
            this.label_dni.Size = new System.Drawing.Size(26, 13);
            this.label_dni.TabIndex = 9;
            this.label_dni.Text = "DNI";
            // 
            // label_apellido
            // 
            this.label_apellido.AutoSize = true;
            this.label_apellido.Location = new System.Drawing.Point(66, 187);
            this.label_apellido.Name = "label_apellido";
            this.label_apellido.Size = new System.Drawing.Size(44, 13);
            this.label_apellido.TabIndex = 10;
            this.label_apellido.Text = "Apellido";
            // 
            // label_nombre
            // 
            this.label_nombre.AutoSize = true;
            this.label_nombre.Location = new System.Drawing.Point(66, 238);
            this.label_nombre.Name = "label_nombre";
            this.label_nombre.Size = new System.Drawing.Size(44, 13);
            this.label_nombre.TabIndex = 11;
            this.label_nombre.Text = "Nombre";
            // 
            // FormAlumno
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(539, 391);
            this.Controls.Add(this.label_nombre);
            this.Controls.Add(this.label_apellido);
            this.Controls.Add(this.label_dni);
            this.Controls.Add(this.label_codcur);
            this.Controls.Add(this.label_codalu);
            this.Controls.Add(this.textBox5);
            this.Controls.Add(this.textBox4);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.button_cancelar);
            this.Controls.Add(this.button_aceptar);
            this.Name = "FormAlumno";
            this.Text = "FormAlumno";
            this.Load += new System.EventHandler(this.FormAlumno_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button_aceptar;
        private System.Windows.Forms.Button button_cancelar;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.TextBox textBox4;
        private System.Windows.Forms.TextBox textBox5;
        private System.Windows.Forms.Label label_codalu;
        private System.Windows.Forms.Label label_codcur;
        private System.Windows.Forms.Label label_dni;
        private System.Windows.Forms.Label label_apellido;
        private System.Windows.Forms.Label label_nombre;
    }
}