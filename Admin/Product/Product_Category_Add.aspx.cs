using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DIS.Admin.Product
{
    public partial class Product_Category_Add : System.Web.UI.Page
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

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtCategoryName.Text))
            {

                using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Categories (CategoryName) VALUES (@CategoryName)", conn);
                    cmd.Parameters.AddWithValue("@CategoryName", txtCategoryName.Text.Trim());
                    cmd.ExecuteNonQuery();
                }
                txtCategoryName.Text = string.Empty;
            }
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

    }
}