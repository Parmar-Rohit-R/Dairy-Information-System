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
    public partial class Product_Manage : System.Web.UI.Page
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
                LoadProducts();
            }
        }

    

        private void LoadProducts()
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "SELECT Products.ProductID, Products.ProductName, Categories.CategoryName, Products.ImagePath " +
                    "FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID", conn);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvProducts.DataSource = dt;
                gvProducts.DataBind();
            }
        }

        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProducts.EditIndex = e.NewEditIndex;
            LoadProducts();
        }

        protected void gvProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvProducts.Rows[e.RowIndex];
            int productId = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Values[0]);
            string productName = (row.Cells[1].Controls[0] as TextBox).Text.Trim();
            string imagePath = (row.Cells[3].Controls[0] as TextBox).Text.Trim();

            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Products SET ProductName = @ProductName, ImagePath = @ImagePath WHERE ProductID = @ProductID", conn);
                cmd.Parameters.AddWithValue("@ProductName", productName);
                cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                cmd.Parameters.AddWithValue("@ProductID", productId);
                cmd.ExecuteNonQuery();
            }
            gvProducts.EditIndex = -1;
            LoadProducts();
        }


        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int productId = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Values[0]);

            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Products WHERE ProductID = @ProductID", conn);
                cmd.Parameters.AddWithValue("@ProductID", productId);
                cmd.ExecuteNonQuery();
            }
            LoadProducts();
        }

        protected void gvProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducts.EditIndex = -1;
            LoadProducts();
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
            LoadProducts();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProducts.PageIndex = e.NewPageIndex;
            LoadProducts();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                string no = gvProducts.Rows[rowIndex].Cells[0].Text;
                Response.Redirect("Update_Product.aspx?No=" + no);
            }
        }


    }
}