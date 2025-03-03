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
    public partial class VerifyOTP : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVerifyOTP_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnforgot_Click(object sender, EventArgs e)
        {
            string enteredOTP = txtOTP.Text.Trim();
            string sessionOTP = Session["OTP"] as string;
            string sessionEmail = Session["OTP_Email"] as string;
            DateTime? otpExpiry = Session["OTP_Expiry"] as DateTime?;



            if (sessionOTP == null || sessionEmail == null || otpExpiry == null)
            {
                lblResult.Text = "Session expired. Please request a new OTP.";
                return;
            }

            if (DateTime.Now > otpExpiry)
            {
                lblResult.Text = "OTP has expired. Please request a new OTP.";
                return;
            }

            if (enteredOTP == sessionOTP)
            {
                // Redirect to reset password page
                Response.Redirect(@"ResetPassword.aspx?email=" + sessionEmail);
            }
            else
            {
                lblResult.Text = "Invalid OTP. Please try again.";
            }
        }
    }
}