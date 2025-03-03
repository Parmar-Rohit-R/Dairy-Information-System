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
    public partial class Product1 : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        string str;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                LoadProducts(null); // Load all products initially
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
                    LinkButton9.Visible = true;
                }
                else
                {
                    LinkButton9.Visible = false;
                }
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
            if (IsPostBack)
            {
                LoadCategories();
                LoadProducts(null); // Load all products initially
            }
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Session.Clear();


            ClientScript.RegisterStartupScript(this.GetType(), "LoginSuccess",
                "Swal.fire({ " +
                    "title: 'Logout Successful!', " +
                    "text: 'Thanks for visit Your Website!', " +
                    "icon: 'success', " +
                    "confirmButtonText: 'OK', " +
                    "customClass: { confirmButton: 'custom-ok-button' }" +
                "}).then((result) => { " +
                    "if (result.isConfirmed) { window.location.href = 'Home1.aspx'; } });", true);
        }
    }
}