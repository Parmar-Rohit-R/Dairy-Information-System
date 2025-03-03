using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DIS.Operater
{
    public partial class Op_Profile : System.Web.UI.Page
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
                    Response.Redirect("~/Operater/Op_D.aspx");
                }
            }
        }

        protected void btnSingup_Click(object sender, EventArgs e)
        {
            cn.Open();

            string name = Session["Name"].ToString();

            str = "update Operator set Name='" + txtName.Text + "',Operator_ID='" + txtEmail.Text + "', Operator_Password='" + txtPassword.Text + "' where Name=@name";

            cmd = new SqlCommand(str, cn);

            cmd.Parameters.AddWithValue("@name", name);

            cmd.ExecuteNonQuery();

            Response.Redirect("~/Operater/Op_D.aspx");

        }

        private void LoadUserProfile()
        {
            string name = Session["Name"].ToString();
            cn.Open();

            str = "select Name, Operator_ID, Operator_Password from Operator where Name = @name";

            cmd = new SqlCommand(str, cn);
            cmd.Parameters.AddWithValue("@name", name);

            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                txtName.Text = dr["Name"].ToString();
                txtEmail.Text = dr["Operator_ID"].ToString();
                txtPassword.Text = dr["Operator_Password"].ToString();
            }
            else
            {
                Response.Write("Record Is Not Found!");
            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {

        }
    }
}