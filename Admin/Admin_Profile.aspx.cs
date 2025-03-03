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
    public partial class Admin_Profile : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        String str;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Name"] != null)
                {
                    LoadUserProfile();
                }
                else
                {
                    Response.Redirect("~/Home.aspx");
                }
            }
        }

        protected void btnSingup_Click(object sender, EventArgs e)
        {
            cn.Open();

            string name = Session["Name"].ToString();

            str = "update Admin set Name='" + txtName.Text + "',Admin_Id='" + txtEmail.Text + "', Admin_Password='" + txtPassword.Text + "' where Name=@name";

            cmd = new SqlCommand(str, cn);

            cmd.Parameters.AddWithValue("@name", name);

            cmd.ExecuteNonQuery();
        }

        private void LoadUserProfile()
        {
            string name = Session["Name"].ToString();
            cn.Open();

            str = "select Name, Admin_Id, Admin_Password from Admin where Name = @name";

            cmd = new SqlCommand(str, cn);
            cmd.Parameters.AddWithValue("@name", name);

            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                txtName.Text = dr["Name"].ToString();
                txtEmail.Text = dr["Admin_Id"].ToString();
                txtPassword.Text = dr["Admin_Password"].ToString();
            }
            else
            {
                Response.Write("Record Is Not Found!");
            }

        }

    }
}