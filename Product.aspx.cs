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
    public partial class Product : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                LoadProducts(null); // Load all products initially
            }  
        }

        private void LoadCategories()
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Categories", conn);
                SqlDataReader reader = cmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(reader);

                rptCategories.DataSource = dt;
                rptCategories.DataBind();
            }
        }

        // Load Products based on Category
        private void LoadProducts(int? categoryId)
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                conn.Open();
                string query = categoryId.HasValue
                    ? "SELECT * FROM Products WHERE CategoryID = @CategoryID"
                    : "SELECT * FROM Products";

                SqlCommand cmd = new SqlCommand(query, conn);
                if (categoryId.HasValue)
                    cmd.Parameters.AddWithValue("@CategoryID", categoryId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptProducts.DataSource = dt;
                rptProducts.DataBind();
            }
        }

        // Handle Category Click
        protected void Category_Click(object sender, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Category")
            {
                int categoryId = int.Parse(e.CommandArgument.ToString());
                LoadProducts(categoryId);
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                LoadCategories();
                LoadProducts(null); // Load all products initially
            }

        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {

        }

    }

}