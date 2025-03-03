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
    public partial class Contact1 : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        string str;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Name"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                LinkButton5.Text = Session["Name"].ToString();
            }

            if (!IsPostBack)
            {
                if (Session["Role"] != "User")
                {
                    LinkButton8.Visible = true;
                }
                else
                {
                    LinkButton8.Visible = false;
                }
            }

        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            cn.Open();

            str = "select Name from Singup where Name='" + LinkButton5.Text + "'";

            cmd = new SqlCommand(str, cn);

            string name = cmd.ExecuteScalar().ToString();

            Session["Name"] = name;

            Response.Redirect("~/Profile.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Home1.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            string message = txtMessage.Text;

            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                conn.Open();

                string checkQuery = "SELECT COUNT(*) FROM Singup WHERE UserId = @Email";
                SqlCommand cmd;
                using (cmd = new SqlCommand(checkQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);

                    int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                        string insertQuery = "INSERT INTO Contact(Name,Email,Message) VALUES (@Name,@Email,@Message)";
                        using (cmd = new SqlCommand(insertQuery, conn))
                        {
                            cmd.Parameters.AddWithValue("@Name", name);
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@Message", message);

                            cmd.ExecuteNonQuery();

                            Response.Write("<script>alert('Data Inserted')</script>");

                            txtName.Text = "";
                            txtEmail.Text = "";
                            txtMessage.Text = "";
                            Error.Text = "";
                        }
                    }
                    else
                    {
                        Error.Text = "EmailID Is Not Register!";
                        Error.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }
            }

        }

    }
}