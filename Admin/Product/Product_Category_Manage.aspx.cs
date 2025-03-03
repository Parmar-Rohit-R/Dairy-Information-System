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
    public partial class Product_Category_Manage : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                LoadCategories();
            }

        }

        private void LoadCategories()
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                string query = "SELECT * FROM Categories WHERE CategoryName LIKE @Name + '%'";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvCategories.DataSource = dt;
                        gvCategories.DataBind();
                    }
                }
            }
        }

        protected void gvCategories_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategories.EditIndex = e.NewEditIndex;
            LoadCategories();
        }

        protected void gvCategories_RowUpdating(object sender, GridViewUpdateEventArgs e)
         {
             GridViewRow row = gvCategories.Rows[e.RowIndex];
             int categoryId = Convert.ToInt32(gvCategories.DataKeys[e.RowIndex].Values[0]);
             string categoryName = (row.Cells[1].Controls[0] as TextBox).Text.Trim();

             using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
             {
                 conn.Open();
                 SqlCommand cmd = new SqlCommand("UPDATE Categories SET CategoryName = @CategoryName WHERE CategoryID = @CategoryID", conn);
                 cmd.Parameters.AddWithValue("@CategoryName", categoryName);
                 cmd.Parameters.AddWithValue("@CategoryID", categoryId);
                 cmd.ExecuteNonQuery();
             }
             gvCategories.EditIndex = -1;
             LoadCategories();
         }



    protected void gvCategories_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int categoryId = Convert.ToInt32(gvCategories.DataKeys[e.RowIndex].Values[0]);

        using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM Categories WHERE CategoryID = @CategoryID", conn);
            cmd.Parameters.AddWithValue("@CategoryID", categoryId);
            cmd.ExecuteNonQuery();
        }
        LoadCategories();
    }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategories.EditIndex = -1;
            LoadCategories();   
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

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            LoadCategories();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCategories.PageIndex = e.NewPageIndex;
            LoadCategories();
        }

    }
}