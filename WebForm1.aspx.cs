using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace TelerikWebApp28
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student_id"] != null)
            {
                var s = Session["student_id"];
                
            }

        }
        protected void RadGrid2_ItemCommand(object sender, GridCommandEventArgs e)
        {

            if (e.CommandName == "Register")
            {
                // Retrieve the `register_id` from the `grandchild` grid row
                GridDataItem item = (GridDataItem)e.Item;
                string registerId = item.GetDataKeyValue("register_id").ToString();

                // Call the method to register the student
                RegisterStudent(registerId);


            }

        }
        private void RegisterStudent(string registerId)
        {
            // Sample connection string, adjust as needed
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["online_schoolConnectionString2"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO StudentCourseRegistration (Register_Id, Student_Id) VALUES (@RegisterId, @StudentId)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // Add parameters (adjust based on your table schema)
                    cmd.Parameters.AddWithValue("@RegisterId", registerId);
                    cmd.Parameters.AddWithValue("@StudentId", Session["student_id"] );

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
    
