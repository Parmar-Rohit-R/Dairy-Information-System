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
    public partial class About1 : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        String str;
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

    }
}