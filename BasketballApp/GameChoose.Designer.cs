namespace BasketballApp
{
    partial class GameChoose
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(GameChoose));
            this.listView1 = new System.Windows.Forms.ListView();
            this.GAME = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.DATE = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.AGONISTIKI = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.HOMETM = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.AWAYTM = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.REFEREE1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.REFEREE2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.REFEREE3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.ARENA = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.HOMECOACH = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.AWAYCOACH = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // listView1
            // 
            this.listView1.BackColor = System.Drawing.Color.AliceBlue;
            this.listView1.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.GAME,
            this.DATE,
            this.AGONISTIKI,
            this.HOMETM,
            this.AWAYTM,
            this.REFEREE1,
            this.REFEREE2,
            this.REFEREE3,
            this.ARENA,
            this.HOMECOACH,
            this.AWAYCOACH});
            this.listView1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.listView1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(161)));
            this.listView1.FullRowSelect = true;
            this.listView1.GridLines = true;
            this.listView1.Location = new System.Drawing.Point(12, 142);
            this.listView1.Name = "listView1";
            this.listView1.Size = new System.Drawing.Size(969, 332);
            this.listView1.TabIndex = 0;
            this.listView1.UseCompatibleStateImageBehavior = false;
            this.listView1.View = System.Windows.Forms.View.Details;
            // 
            // GAME
            // 
            this.GAME.Text = "GAME No";
            this.GAME.Width = 66;
            // 
            // DATE
            // 
            this.DATE.Text = "ΗΜΕΡΟΜΗΝΙΑ";
            this.DATE.Width = 122;
            // 
            // AGONISTIKI
            // 
            this.AGONISTIKI.Text = "ΑΓΩΝΙΣΤΙΚΗ";
            this.AGONISTIKI.Width = 38;
            // 
            // HOMETM
            // 
            this.HOMETM.Text = "ΓΗΠΕΔΟΥΧΟΣ";
            this.HOMETM.Width = 106;
            // 
            // AWAYTM
            // 
            this.AWAYTM.Text = "ΦΙΛΟΞΕΝΟΥΜΕΝΟΣ";
            this.AWAYTM.Width = 129;
            // 
            // REFEREE1
            // 
            this.REFEREE1.Text = "1ος ΔΙΑΙΤΗΤΗΣ";
            this.REFEREE1.Width = 43;
            // 
            // REFEREE2
            // 
            this.REFEREE2.Text = "2ος ΔΙΑΙΤΗΤΗΣ";
            this.REFEREE2.Width = 45;
            // 
            // REFEREE3
            // 
            this.REFEREE3.Text = "3ος ΔΙΑΙΤΗΤΗΣ";
            this.REFEREE3.Width = 41;
            // 
            // ARENA
            // 
            this.ARENA.Text = "ΓΗΠΕΔΟ";
            this.ARENA.Width = 67;
            // 
            // HOMECOACH
            // 
            this.HOMECOACH.Text = "ΓΗΠΕΔΟΥΧΟΣ ΠΡΟΠΟΝΗΤΗΣ";
            this.HOMECOACH.Width = 121;
            // 
            // AWAYCOACH
            // 
            this.AWAYCOACH.Text = "ΦΙΛΟΞΕΝΟΥΜΕΝΟΣ ΠΡΟΠΟΝΗΤΗΣ";
            this.AWAYCOACH.Width = 161;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(161)));
            this.button1.Location = new System.Drawing.Point(217, 505);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(113, 46);
            this.button1.TabIndex = 1;
            this.button1.Text = "RELOAD ↻";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(161)));
            this.button2.Location = new System.Drawing.Point(71, 505);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(113, 46);
            this.button2.TabIndex = 2;
            this.button2.Text = "E&XIT";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(161)));
            this.button3.Location = new System.Drawing.Point(366, 505);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(123, 46);
            this.button3.TabIndex = 3;
            this.button3.Text = "GO TO ROSTERS ➜";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(161)));
            this.label1.ForeColor = System.Drawing.Color.DarkBlue;
            this.label1.Location = new System.Drawing.Point(66, 42);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(375, 29);
            this.label1.TabIndex = 4;
            this.label1.Text = "ΠΑΡΑΚΑΛΩ ΕΠΙΛΕΞΤΕ ΑΓΩΝΑ";
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.pictureBox1.Image = global::BasketballApp.Properties.Resources.logo;
            this.pictureBox1.Location = new System.Drawing.Point(852, 626);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(144, 92);
            this.pictureBox1.TabIndex = 6;
            this.pictureBox1.TabStop = false;
            // 
            // GameChoose
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1008, 730);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.listView1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "GameChoose";
            this.Text = "GameChoose";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.GameChoose_FormClosing);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ColumnHeader GAME;
        private System.Windows.Forms.ColumnHeader DATE;
        private System.Windows.Forms.ColumnHeader AGONISTIKI;
        private System.Windows.Forms.ColumnHeader HOMETM;
        private System.Windows.Forms.ColumnHeader AWAYTM;
        private System.Windows.Forms.ColumnHeader REFEREE1;
        private System.Windows.Forms.ColumnHeader REFEREE2;
        private System.Windows.Forms.ColumnHeader REFEREE3;
        private System.Windows.Forms.ColumnHeader ARENA;
        private System.Windows.Forms.ColumnHeader HOMECOACH;
        private System.Windows.Forms.ColumnHeader AWAYCOACH;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.ListView listView1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}