namespace PrimerWindowsForm
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
            this.labelNumero1 = new System.Windows.Forms.Label();
            this.labelNumero2 = new System.Windows.Forms.Label();
            this.labelResultado = new System.Windows.Forms.Label();
            this.textBoxNumero1 = new System.Windows.Forms.TextBox();
            this.textBoxNumero2 = new System.Windows.Forms.TextBox();
            this.textBoxResultado = new System.Windows.Forms.TextBox();
            this.buttonSuma = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // labelNumero1
            // 
            this.labelNumero1.AutoSize = true;
            this.labelNumero1.BackColor = System.Drawing.Color.MediumSlateBlue;
            this.labelNumero1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.labelNumero1.Location = new System.Drawing.Point(53, 43);
            this.labelNumero1.Name = "labelNumero1";
            this.labelNumero1.Size = new System.Drawing.Size(58, 15);
            this.labelNumero1.TabIndex = 0;
            this.labelNumero1.Text = "Numero 1:";
            this.labelNumero1.Click += new System.EventHandler(this.label1_Click);
            // 
            // labelNumero2
            // 
            this.labelNumero2.AutoSize = true;
            this.labelNumero2.BackColor = System.Drawing.Color.MediumSlateBlue;
            this.labelNumero2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.labelNumero2.Location = new System.Drawing.Point(330, 45);
            this.labelNumero2.Name = "labelNumero2";
            this.labelNumero2.Size = new System.Drawing.Size(58, 15);
            this.labelNumero2.TabIndex = 1;
            this.labelNumero2.Text = "Numero 2:";
            this.labelNumero2.Click += new System.EventHandler(this.label2_Click);
            // 
            // labelResultado
            // 
            this.labelResultado.AutoSize = true;
            this.labelResultado.BackColor = System.Drawing.Color.MediumSlateBlue;
            this.labelResultado.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.labelResultado.Location = new System.Drawing.Point(330, 194);
            this.labelResultado.Name = "labelResultado";
            this.labelResultado.Size = new System.Drawing.Size(63, 15);
            this.labelResultado.TabIndex = 2;
            this.labelResultado.Text = "Resultado: ";
            // 
            // textBoxNumero1
            // 
            this.textBoxNumero1.Location = new System.Drawing.Point(117, 40);
            this.textBoxNumero1.MaxLength = 5;
            this.textBoxNumero1.Name = "textBoxNumero1";
            this.textBoxNumero1.Size = new System.Drawing.Size(100, 20);
            this.textBoxNumero1.TabIndex = 3;
            this.textBoxNumero1.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.textBoxNumero1_KeyPress);
            this.textBoxNumero1.Validating += new System.ComponentModel.CancelEventHandler(this.textBoxNumero1_Validating);
            // 
            // textBoxNumero2
            // 
            this.textBoxNumero2.Location = new System.Drawing.Point(394, 43);
            this.textBoxNumero2.MaxLength = 5;
            this.textBoxNumero2.Name = "textBoxNumero2";
            this.textBoxNumero2.Size = new System.Drawing.Size(100, 20);
            this.textBoxNumero2.TabIndex = 4;
            this.textBoxNumero2.Validating += new System.ComponentModel.CancelEventHandler(this.textBoxNumero1_Validating);
            // 
            // textBoxResultado
            // 
            this.textBoxResultado.Location = new System.Drawing.Point(399, 191);
            this.textBoxResultado.MaxLength = 6;
            this.textBoxResultado.Name = "textBoxResultado";
            this.textBoxResultado.Size = new System.Drawing.Size(100, 20);
            this.textBoxResultado.TabIndex = 5;
            // 
            // buttonSuma
            // 
            this.buttonSuma.Location = new System.Drawing.Point(117, 182);
            this.buttonSuma.Name = "buttonSuma";
            this.buttonSuma.Size = new System.Drawing.Size(89, 36);
            this.buttonSuma.TabIndex = 6;
            this.buttonSuma.Text = "Sumar";
            this.buttonSuma.UseVisualStyleBackColor = true;
            this.buttonSuma.Click += new System.EventHandler(this.button1_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(594, 354);
            this.Controls.Add(this.buttonSuma);
            this.Controls.Add(this.textBoxResultado);
            this.Controls.Add(this.textBoxNumero2);
            this.Controls.Add(this.textBoxNumero1);
            this.Controls.Add(this.labelResultado);
            this.Controls.Add(this.labelNumero2);
            this.Controls.Add(this.labelNumero1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labelNumero1;
        private System.Windows.Forms.Label labelNumero2;
        private System.Windows.Forms.Label labelResultado;
        private System.Windows.Forms.TextBox textBoxNumero1;
        private System.Windows.Forms.TextBox textBoxNumero2;
        private System.Windows.Forms.TextBox textBoxResultado;
        private System.Windows.Forms.Button buttonSuma;
    }
}

