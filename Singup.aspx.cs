using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DIS
{
    public partial class Singup : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        String str;
        SqlDataAdapter da;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {

             string name = txtName.Text.Trim();
        string email = txtEmail.Text.Trim().ToLower();
        string password = txtPassword.Text.Trim();

        using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
        {
            con.Open();
            
            string checkUserQuery = "SELECT * FROM Singup WHERE UserId = @Email";
            SqlCommand userCmd = new SqlCommand(checkUserQuery, con);
            userCmd.Parameters.AddWithValue("@Email", email);
            SqlDataReader userReader = userCmd.ExecuteReader();

            if (userReader.Read()) 
            {
                Error.Text = "UserID is already registered!";
                return;
            }
            userReader.Close();

            string checkFarmerQuery = "SELECT * FROM Farmer WHERE F_UserID = @Email";
            SqlCommand farmerCmd = new SqlCommand(checkFarmerQuery, con);
            farmerCmd.Parameters.AddWithValue("@Email", email);
            SqlDataReader farmerReader = farmerCmd.ExecuteReader();

            if (farmerReader.Read()) 
            {
                Error.Text = "FarmerID is already registered!";
                return;
            }
            farmerReader.Close();

            string insertUser = "INSERT INTO Singup (Name, UserId, Password,Role) VALUES (@Name, @Email, @Password,@Role)";
            SqlCommand insertUserCmd = new SqlCommand(insertUser, con);
            insertUserCmd.Parameters.AddWithValue("@Name", name);
            insertUserCmd.Parameters.AddWithValue("@Email", email);
            insertUserCmd.Parameters.AddWithValue("@Password", password);
            insertUserCmd.Parameters.AddWithValue("@Role","User");
            insertUserCmd.ExecuteNonQuery();

            if (RequiredFieldValidator1.ErrorMessage != null && RequiredFieldValidator2.ErrorMessage != null && Error.Text != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "LoginSuccess",
                    "Swal.fire({ " +
                        "title: 'Singup Successful!', " +
                        "text: 'You Can Login Now!', " +
                        "icon: 'success', " +
                        "confirmButtonText: 'OK', " +
                        "customClass: { confirmButton: 'custom-ok-button' }" +
                    "}).then((result) => { " +
                        "if (result.isConfirmed) { window.location.href = 'Login.aspx'; } });", true);

            }
        }       
      }
     }
  } 