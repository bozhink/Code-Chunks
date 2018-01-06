namespace WindowsFormsApplication2
{
    partial class Form1
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
            this.StartMapForce = new System.Windows.Forms.Button();
            this.openCompletePO = new System.Windows.Forms.Button();
            this.newMapping = new System.Windows.Forms.Button();
            this.shutdownMapForce = new System.Windows.Forms.Button();
            this.generateCppCode = new System.Windows.Forms.Button();
            this.checkBoxEventOnOff = new System.Windows.Forms.CheckBox();
            this.listBoxMessages = new System.Windows.Forms.ListBox();
            this.SuspendLayout();
            // 
            // StartMapForce
            // 
            this.StartMapForce.Location = new System.Drawing.Point(26, 24);
            this.StartMapForce.Name = "StartMapForce";
            this.StartMapForce.Size = new System.Drawing.Size(120, 29);
            this.StartMapForce.TabIndex = 0;
            this.StartMapForce.Text = "Start MapForce";
            this.StartMapForce.UseVisualStyleBackColor = true;
            this.StartMapForce.Click += new System.EventHandler(this.StartMapForce_Click);
            // 
            // openCompletePO
            // 
            this.openCompletePO.Location = new System.Drawing.Point(60, 94);
            this.openCompletePO.Name = "openCompletePO";
            this.openCompletePO.Size = new System.Drawing.Size(185, 29);
            this.openCompletePO.TabIndex = 1;
            this.openCompletePO.Text = "Open CompletePO.mfd";
            this.openCompletePO.UseVisualStyleBackColor = true;
            this.openCompletePO.Click += new System.EventHandler(this.openCompletePO_Click);
            // 
            // newMapping
            // 
            this.newMapping.Location = new System.Drawing.Point(60, 59);
            this.newMapping.Name = "newMapping";
            this.newMapping.Size = new System.Drawing.Size(185, 29);
            this.newMapping.TabIndex = 2;
            this.newMapping.Text = "Create new mapping";
            this.newMapping.UseVisualStyleBackColor = true;
            this.newMapping.Click += new System.EventHandler(this.newMapping_Click);
            // 
            // shutdownMapForce
            // 
            this.shutdownMapForce.Location = new System.Drawing.Point(26, 215);
            this.shutdownMapForce.Name = "shutdownMapForce";
            this.shutdownMapForce.Size = new System.Drawing.Size(120, 29);
            this.shutdownMapForce.TabIndex = 4;
            this.shutdownMapForce.Text = "Shutdown MapForce";
            this.shutdownMapForce.UseVisualStyleBackColor = true;
            this.shutdownMapForce.Click += new System.EventHandler(this.shutdownMapForce_Click);
            // 
            // generateCppCode
            // 
            this.generateCppCode.Location = new System.Drawing.Point(60, 129);
            this.generateCppCode.Name = "generateCppCode";
            this.generateCppCode.Size = new System.Drawing.Size(185, 29);
            this.generateCppCode.TabIndex = 5;
            this.generateCppCode.Text = " Generate C++ code";
            this.generateCppCode.UseVisualStyleBackColor = true;
            this.generateCppCode.Click += new System.EventHandler(this.generateCppCode_Click);
            // 
            // checkBoxEventOnOff
            // 
            this.checkBoxEventOnOff.AutoSize = true;
            this.checkBoxEventOnOff.Location = new System.Drawing.Point(60, 176);
            this.checkBoxEventOnOff.Name = "checkBoxEventOnOff";
            this.checkBoxEventOnOff.Size = new System.Drawing.Size(194, 17);
            this.checkBoxEventOnOff.TabIndex = 7;
            this.checkBoxEventOnOff.Text = "OnDocumentOpened Event On/Off";
            this.checkBoxEventOnOff.TextImageRelation = System.Windows.Forms.TextImageRelation.TextAboveImage;
            this.checkBoxEventOnOff.UseVisualStyleBackColor = true;
            this.checkBoxEventOnOff.CheckedChanged += new System.EventHandler(this.checkBoxEventOnOff_CheckedChanged);
            // 
            // listBoxMessages
            // 
            this.listBoxMessages.FormattingEnabled = true;
            this.listBoxMessages.HorizontalScrollbar = true;
            this.listBoxMessages.Location = new System.Drawing.Point(271, 24);
            this.listBoxMessages.Name = "listBoxMessages";
            this.listBoxMessages.Size = new System.Drawing.Size(405, 225);
            this.listBoxMessages.TabIndex = 8;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(699, 270);
            this.Controls.Add(this.listBoxMessages);
            this.Controls.Add(this.checkBoxEventOnOff);
            this.Controls.Add(this.generateCppCode);
            this.Controls.Add(this.shutdownMapForce);
            this.Controls.Add(this.newMapping);
            this.Controls.Add(this.openCompletePO);
            this.Controls.Add(this.StartMapForce);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button StartMapForce;
        private System.Windows.Forms.Button openCompletePO;
        private System.Windows.Forms.Button newMapping;
        private System.Windows.Forms.Button shutdownMapForce;
        private System.Windows.Forms.Button generateCppCode;
        private System.Windows.Forms.CheckBox checkBoxEventOnOff;
        private System.Windows.Forms.ListBox listBoxMessages;
    }
}

