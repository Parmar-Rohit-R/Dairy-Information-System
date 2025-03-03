using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DIS.Admin
{
    public partial class Admin_Login : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        String str;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            cn.Open();

            str = "select count(1) from Admin where Admin_Id='" + txtEmail.Text + "'";
            cmd = new SqlCommand(str, cn);

            int emailCount = Convert.ToInt32(cmd.ExecuteScalar());

            if (emailCount == 0)
            {
                lblError.Text = "Enter Wrong Email ";
                return;
            }

            str = "select count(1) from Admin where Admin_Id='" + txtEmail.Text + "' and Admin_Password='" + txtPassword.Text + "'";

            cmd = new SqlCommand(str, cn);

            int passwordCount = Convert.ToInt32(cmd.ExecuteScalar());

            if (passwordCount == 0)
            {
                lblError1.Text = "Wrong Password";
                return;
            }

            str = "select Name from Admin where Admin_Id='" + txtEmail.Text + "'";

            cmd = new SqlCommand(str, cn);

            string name = cmd.ExecuteScalar().ToString();

            Session["Name"] = name;
            Session["UserId"] = txtEmail.Text;
            Session["Password"] = txtPassword.Text;

            Response.Redirect("~/Admin/Admin_Das.aspx");
        }
    }
}