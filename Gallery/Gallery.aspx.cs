using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace DIS.Gallery
{
    public partial class Gallery : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        String str;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGallery();
            }

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
                    LinkButton6.Visible = true;
                }
                else
                {
                    LinkButton6.Visible = false;
                }
            }

        }

        private void LoadGallery()
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                string query = "SELECT ImagePath, Description FROM Gallery";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptGallery.DataSource = dt;
                rptGallery.DataBind();
            }
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            if (Session["Role"] == "User")
            {
                cn.Open();

                str = "select Name from Singup where Name='" + LinkButton5.Text + "'";

                cmd = new SqlCommand(str, cn);

                string name = cmd.ExecuteScalar().ToString();

                Session["Name"] = name;
                Session["Role"] = "User";

                Response.Redirect("~/Profile.aspx");
            }
            else
            {
                cn.Open();

                str = "select FarmerName from Farmer where FarmerName='" + LinkButton5.Text + "'";

                cmd = new SqlCommand(str, cn);

                string name = cmd.ExecuteScalar().ToString();

                Session["Name"] = name;

                Response.Redirect("~/Profile.aspx");
            }
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

    }
}