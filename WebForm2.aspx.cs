using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace TelerikWebApp28
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void RadComboBox1_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            LoadStudents(e.Value);
        }
        protected void RadComboBox2_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            var selectedvalue = e.Value;
            Session["student_id"]=selectedvalue;
            Response.Redirect("WebForm1.aspx");

        }
        private void LoadStudents(string classId)
        {
            RadComboBox2.Items.Clear();
            RadComboBox2.Items.Add(new RadComboBoxItem("Select Student", ""));

            // Replace with your actual connection string
            string connectionString = WebConfigurationManager.ConnectionStrings["online_schoolConnectionString3"].ConnectionString;
            string query = "SELECT Student_id, FirstName FROM Students WHERE Class = @Class";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Class", classId);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            RadComboBoxItem item = new RadComboBoxItem
                            {
                                Text = reader["student_id"].ToString(),
                                Value = reader["Student_id"].ToString()
                            };
                            RadComboBox2.Items.Add(item);
                        }
                    }
                }
            }
        }
    }
}