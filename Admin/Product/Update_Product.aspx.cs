using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


namespace DIS.Admin.Product
{
    public partial class Update_Product : System.Web.UI.Page
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
                string no = Request.QueryString["No"];
                if (!string.IsNullOrEmpty(no))
                {
                    LoadDetails(no);
                }
            }

            if (!IsPostBack)
            {
                LoadCategories();
            }

        }

        private void LoadDetails(string no)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                con.Open();
                string query = "select * from Products where ProductID=@No";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@No", no);
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        txtProductName.Text = dr["ProductName"].ToString();
                        ddlCategory.SelectedValue = dr["CategoryID"].ToString();
                    }

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
                ddlCategory.DataSource = reader;
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "CategoryID";
                ddlCategory.DataBind();
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

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                    string no = Request.QueryString["No"];
                    string productName = txtProductName.Text.Trim();
                    string category = ddlCategory.SelectedValue;
                    string imagePath = "";

                    if (FileUpload1.HasFile)
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Image") + Path.GetFileName(FileUpload1.FileName));
                        imagePath = "Image/" + Path.GetFileName(FileUpload1.FileName);
                    }

                    using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
                    {
                        string query = "UPDATE Products SET ProductName=@PM, CategoryID=@CID, ImagePath=@Img WHERE ProductID=@PID";

                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@PID", no);
                        cmd.Parameters.AddWithValue("@PM", productName);
                        cmd.Parameters.AddWithValue("@CID", category);
                        cmd.Parameters.AddWithValue("@Img", imagePath);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }

                    txtProductName.Text = "";
                    ddlCategory.SelectedIndex = 0;
                    Response.Redirect("Product_Manage.aspx");
                }
        }

        protected void btnAddProduct0_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product_Manage.aspx");
        }

    }
}