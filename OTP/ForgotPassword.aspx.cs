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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendOTP_Click(object sender, EventArgs e)
        {
           
        }

        private bool IsEmailRegistered(string email)
        {
            // Check if the email exists in the database
            string query = "SELECT COUNT(*) FROM Singup WHERE UserId = @Email";
            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                conn.Open();
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        protected void btnforgot_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            Random random = new Random();
            string otp = random.Next(100000, 999999).ToString(); // 6-digit OTP

            // Validate email in database
            if (!IsEmailRegistered(email))
            {
                lblError.Text = "Email Not Register!";
                return;
            }

            // Save OTP in Session (Temporary Storage)
            Session["OTP"] = otp;
            Session["OTP_Email"] = email;
            Session["OTP_Expiry"] = DateTime.Now.AddMinutes(10); // OTP valid for 10 minutes


            try
            {
                // Send OTP via email
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("bansdairyinformation247@gmail.com");
                mail.To.Add(email);
                mail.Subject = "Password Reset OTP";
                mail.Body = @"Your OTP for password reset is: " + otp;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                smtp.Port = 587;
                smtp.Credentials = new NetworkCredential("bansdairyinformation247@gmail.com", "cqbr wasb zpty ebdz");
                smtp.EnableSsl = true;

                smtp.Send(mail);

                lblResult.ForeColor = System.Drawing.Color.Green;
                lblResult.Text = "OTP has been sent to your email.";
                Response.Redirect(@"VerifyOTP.aspx");
            }
            catch (Exception ex)
            {
                lblResult.ForeColor = System.Drawing.Color.Red;
                lblResult.Text = "Failed to send OTP. Please try again later.";
            }
        }

    }
}