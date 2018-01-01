namespace WebServerControlsDemo
{
    using System;
    using System.Web.UI;

    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            this.LabelResult.Text = "You entered: <b>" + this.TextBoxInput.Text + "</b><br />";
            this.LabelResult.Visible = true;
        }
    }
}
