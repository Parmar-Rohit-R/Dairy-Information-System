using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;


namespace DIS.OTP
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string email = Request.QueryString["email"].ToString();
            string newPassword = txtNewPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();


           if (string.IsNullOrWhiteSpace(email))
            {
                lblResult.Text = "Invalid request. Email not found.";
                return;
            } 

            if (newPassword != confirmPassword)
            {
                lblResult.Text = "Passwords do not match!";
                return;
            }

            try
            {
                // Update query
                string query = "UPDATE Singup SET Password = @Password WHERE UserId = @Email";
                using (        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Password", confirmPassword);
                        cmd.Parameters.AddWithValue("@Email", email);

                        conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblResult.ForeColor = System.Drawing.Color.Green;
                            lblResult.Text = "Your password has been reset successfully!";
                            Response.Redirect("~/Login.aspx");
                        }
                        else
                        {
                            lblResult.Text = "Failed to reset password. Email not found.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblResult.ForeColor = System.Drawing.Color.Red;
                lblResult.Text = "An error occurred: " + ex.Message;
            }

            
        }

        protected void btnforgot_Click(object sender, EventArgs e)
        {

        }
    }
}