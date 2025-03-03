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
    public partial class Admin_Das : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        String str;
        SqlDataReader dr;
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

            if (!IsPostBack)
            {
                GetUserCount();
                ShowProductCount();
                ShowGalleryCount();
            }

        }

        private void GetUserCount()
        {
            cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");

            cn.Open();

            str = "select COUNT(*) AS UserCount from Singup";

            cmd = new SqlCommand(str, cn);

            int userCount = (int)cmd.ExecuteScalar();
            Label1.Text = "<center><i class='fa-solid fa-user' style='font-size:30px;'></i></center>" + "<br/> <center><b>" + userCount + "</b></center>" + "<br/> <center>Total Registration <br/> Users</center> ";

        }

        private void ShowProductCount()
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                con.Open();

                string query = "select COUNT(*) from Products";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    int productCount = Convert.ToInt32(cmd.ExecuteScalar());
                    Label2.Text = "<center><i class='fa-solid fa-p' style='font-size:30px;' ></i></center>" + "<br/> <center><b>" + productCount + "</b></center>" + "<br/> <center>Total Products<br>Added</center> ";
                }

            }
        }

        private void ShowGalleryCount()
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                con.Open();

                string query = "select COUNT(*) from Gallery";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    int galleryCount = Convert.ToInt32(cmd.ExecuteScalar());
                    Label3.Text = "<center><i class='bi bi-image' style='font-size:30px;' ></i></center>" + "<br/> <center><b>" + galleryCount + "</b></center>" + "<br/> <center>Total Gallery<br>Photos</center> ";
                }

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            cn.Open();

            str = "select Name from Admin where Name='" + LinkButton1.Text + "'";

            cmd = new SqlCommand(str, cn);

            string name = cmd.ExecuteScalar().ToString();

            Session["Name"] = name;

            Response.Redirect("~/Admin/Admin_Profile.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Admin/Admin_Login.aspx");
        }

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Admin/Admin_Login.aspx");
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
    }
}