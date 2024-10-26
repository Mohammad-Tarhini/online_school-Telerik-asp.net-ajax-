using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TelerikWebApp28
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RadListBox3.Enabled = false;
            }
            

        }
        protected void RadListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadListBox3.Enabled = false;
            int selectedClassID = int.Parse(RadListBox1.SelectedValue);
            SqlDataSource2.SelectParameters["class_id"].DefaultValue = selectedClassID.ToString();
            SqlDataSource3.SelectParameters["semester_id"].DefaultValue = selectedClassID.ToString();
        }
        protected void RadListBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadListBox3.Enabled = true;
            RadListBox3.ClearChecked();
        }
        protected void RadButton1_click(object sender, EventArgs e)
        {

        }
    }
}