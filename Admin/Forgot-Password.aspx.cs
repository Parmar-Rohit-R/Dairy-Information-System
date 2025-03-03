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
using System.Drawing;
using System.Configuration;

namespace DIS.Admin
{
    public partial class Forgot_Password : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        String str;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnforgot_Click(object sender, EventArgs e)
        {
            string username = string.Empty;
            string password = string.Empty;

            cn.Open();

            str = "select Name,[Admin_Password] from Admin where Admin_Id='" + txtName.Text + "'";
            cmd = new SqlCommand(str, cn);


            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                if (sdr.Read())
                {
                    username = sdr["Name"].ToString();

                    password = sdr["Admin_Password"].ToString();
                }
            }
            cn.Close();


            if (!string.IsNullOrEmpty(password))
            {
                MailMessage mm = new MailMessage("bansdairyinformation247@gmail.com", txtName.Text.Trim());
                mm.Subject = "Password Recovery";
                mm.Body = string.Format("Hi,<br/><br/>Your password is: {0}<br/><br/>Thank you.", password);
                mm.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                smtp.EnableSsl = true;
                smtp.Port = 587; // For TLS
                smtp.Credentials = new NetworkCredential("bansdairyinformation247@gmail.com", "cqbr wasb zpty ebdz");

                try
                {
                    smtp.Send(mm);
                    lblError.ForeColor = System.Drawing.Color.Green;
                    lblError.Text = "Password has been sent to your email address.";

                    Response.Redirect("~/Login.aspx");

                }
                catch (Exception ex)
                {
                    lblError.ForeColor = System.Drawing.Color.Red;
                    lblError.Text = "Error: " + ex.Message;
                }
            }
            else
            {
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "Email not found.";
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {

        }
    }
}