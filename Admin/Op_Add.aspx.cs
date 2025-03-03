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
    public partial class Op_Add : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        string str;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Name"] == null)
            {
                Response.Redirect("~/Admin/Admin_Login.aspx");
            }
            else
            {
                LinkButton1.Text = Session["Name"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            cn.Open();

            str = "select Name from Admin where Name='" + LinkButton1.Text + "'";

            cmd = new SqlCommand(str, cn);

            string name = cmd.ExecuteScalar().ToString();

            Session["Name"] = name;

            Response.Redirect("~/Admin/Admin_Profile.aspx");
        }

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Admin/Admin_Login.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            string password = txtRePassword.Text;

            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                conn.Open();

                string checkEmailQuery = "SELECT COUNT(*) FROM Operator WHERE Operator_ID = @Email";

                using (SqlCommand cmd = new SqlCommand(checkEmailQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);

                    int emailCount = Convert.ToInt32(cmd.ExecuteScalar());
                    if (emailCount > 0)
                    {
                        Error1.Text = "Email Is already Register!";
                        Error1.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                    else
                    {
                        Error1.Text = "";
                    }
                }


                str = "insert into Operator(Name,Operator_ID,Operator_Password) values(@name,@email,@password)";

                using (SqlCommand cmd = new SqlCommand(str, conn))
                {

                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@password ", password);

                    cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('One Record Is Inserted')</script>");

                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtRePassword.Text = "";
                    txtPassword.Text = "";
                }
            }
        }

    }
}