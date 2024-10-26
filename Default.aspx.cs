using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Security.Cryptography;
using System.Text;
using TelerikWebApp28;


public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        sign_in.Visible = false;
        new_student.Visible = false;
        teacherlogin.Visible = false;

    }



    protected void RadButton1_Click(object sender, EventArgs e)
    {
        sign_in.Visible = true;

    }

    protected void RadButton2_Click(object sender, EventArgs e)
    {

        new_student.Visible = true;
    }
    protected void RadButton3_Click(object sender, EventArgs e)
    {

        teacherlogin.Visible = true;


    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        
        string firstName = txtFirstName.Text.Trim();
        string lastName = txtLastName.Text.Trim();
        string email = txtEmail.Text.Trim();

        string password = txtpassward.Text.Trim();
        int student_id;
        bool student_id_chck=int.TryParse(txtstdid.Text.Trim(),out student_id);
            



        string connectionString = ConfigurationManager.ConnectionStrings["online_schoolConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO students (student_id,FirstName, LastName, Email,Password) VALUES (@student_id ,@FirstName, @LastName, @Email,@Password)";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();
                command.Parameters.AddWithValue("@student_id", student_id);
                command.Parameters.AddWithValue("@FirstName", firstName);
                command.Parameters.AddWithValue("@LastName", lastName);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Password", password);
                



                command.ExecuteNonQuery();
            }

            lbl.Text = txtpassward.Text;
            // Clear form fields
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtpassward.Text = "";
            // Optionally, provide feedback to the user
        }



        sign_in.Visible = true;
        new_student.Visible = false;

        

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text;
        string password = txtPassword.Text;
        if (AuthenticateUser(username, password))
        {
            Session["Username"] = username;

            
            Response.Redirect("WebForm2.aspx");

        }
        else
        {
            lbl.Text = "invaliad";

        }



    }

    private bool AuthenticateUser(string username, string password)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["online_schoolConnectionString"].ConnectionString;
        bool isAuthenticated = false;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT COUNT(*) FROM Students WHERE student_id = @Username AND Password = @Password";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Password", password);

            conn.Open();
            int count = (int)cmd.ExecuteScalar();
            conn.Close();

            isAuthenticated = count > 0;
        }

        return isAuthenticated;
    }
    protected void tlogin_Click(object sender, EventArgs e)
    {
        string teacherid = txtteacherid.Text;
        string passwordteacher = txttecherpassword.Text;
       
        if(Authenticateteacher(teacherid,passwordteacher))
        {
            Response.Redirect("WebForm1.aspx");
        }
        else
        {
            lbl.Text = "error";
        }
    }
    private bool Authenticateteacher(string id, string password)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["online_schoolConnectionString"].ConnectionString;
        bool isAuthenticated = false;

        using (SqlConnection conn = new SqlConnection(connectionString))
        {

            string query = "select count(*) from teachers where teacher_id=@id and passward=@psw";

            SqlCommand cmdd = new SqlCommand(query, conn);
            cmdd.Parameters.AddWithValue("@id", id);

            
            cmdd.Parameters.AddWithValue("@psw", password);

            conn.Open();
            int count = (int)cmdd.ExecuteScalar();
            conn.Close();

            isAuthenticated = count > 0;


        }
        return isAuthenticated;

    }

    
}