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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
     
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim().ToLower();
            string password = txtPassword.Text.Trim();

            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                con.Open();

                string userQuery = "SELECT Name FROM Singup WHERE UserId = @Email";
                SqlCommand userCmd = new SqlCommand(userQuery, con);
                userCmd.Parameters.AddWithValue("@Email", email);
                SqlDataReader userReader = userCmd.ExecuteReader();
                if (userReader.Read())
                {
                    string userName = userReader["Name"].ToString();
                    userReader.Close();

                    string userPassQuery = "SELECT * FROM Singup WHERE UserId = @Email AND Password = @Password";
                    SqlCommand userPassCmd = new SqlCommand(userPassQuery, con);
                    userPassCmd.Parameters.AddWithValue("@Email", email);
                    userPassCmd.Parameters.AddWithValue("@Password", password);
                    SqlDataReader userPassReader = userPassCmd.ExecuteReader();

                    if (!userPassReader.Read()) 
                    {
                        Label1.Text = "";
                        Label2.Text = "Wrong Password!";
                        return;
                    }

                    Session["Name"] = userName;
                    Session["Role"] = "User";
                    

                    if (Label1.Text == "" && Label2.Text == "")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "LoginSuccess",
                            "Swal.fire({ " +
                                "title: 'Login Successful!', " +
                                "text: 'Welcome to your Website!', " +
                                "icon: 'success', " +
                                "confirmButtonText: 'OK', " +
                                "customClass: { confirmButton: 'custom-ok-button' }" +
                            "}).then((result) => { " +
                                "if (result.isConfirmed) { window.location.href = 'Home.aspx'; } });", true);

                    }
                }
                else
                {
                    userReader.Close(); 

                    string farmerQuery = "SELECT FarmerName FROM Farmer WHERE F_UserID = @Email";
                    SqlCommand farmerCmd = new SqlCommand(farmerQuery, con);
                    farmerCmd.Parameters.AddWithValue("@Email", email);
                    SqlDataReader farmerReader = farmerCmd.ExecuteReader();

                    if (farmerReader.Read()) 
                    {
                        string farmerName = farmerReader["FarmerName"].ToString();
                        farmerReader.Close();

                        string farmerPassQuery = "SELECT * FROM Farmer WHERE F_UserID = @Email AND F_Password = @Password";
                        SqlCommand farmerPassCmd = new SqlCommand(farmerPassQuery, con);
                        farmerPassCmd.Parameters.AddWithValue("@Email", email);
                        farmerPassCmd.Parameters.AddWithValue("@Password", password);
                        SqlDataReader farmerPassReader = farmerPassCmd.ExecuteReader();

                        if (!farmerPassReader.Read()) // Wrong Password
                        {
                            Label1.Text = "";
                            Label2.Text = "Wrong Password!";
                            return;
                        }

                        Session["Name"] = farmerName;
                        Session["FarmerID"] = farmerPassReader[0].ToString();
                       
                            ClientScript.RegisterStartupScript(this.GetType(), "LoginSuccess",
                                "Swal.fire({ " +
                                    "title: 'Login Successful!', " +
                                    "text: 'Welcome to your Website!', " +
                                    "icon: 'success', " +
                                    "confirmButtonText: 'OK', " +
                                    "customClass: { confirmButton: 'custom-ok-button' }" +
                                "}).then((result) => { " +
                                    "if (result.isConfirmed) { window.location.href = 'Home.aspx'; } });", true);

                        
                    }
                    else
                    {
                        Label1.Text = "Wrong Email!";
                        Label2.Text = "";
                    }
                }

            }
        }
    }
}