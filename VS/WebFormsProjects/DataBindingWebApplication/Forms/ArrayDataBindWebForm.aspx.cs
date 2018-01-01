namespace DataBindingWebApplication.Forms
{
    using System;
    using System.Collections.Generic;

    public partial class ArrayDataBindWebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.CheckBoxListItem.DataSource = this.GetStrings();
            this.CheckBoxListItem.DataBind();
        }

        private IEnumerable<string> GetStrings()
        {
            return new string[]
            {
                "1",
                "2",
                "3"
            };
        }

        protected void CheckBoxListItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.MessageLabel.Text = this.CheckBoxListItem.SelectedValue;
        }
    }
}
