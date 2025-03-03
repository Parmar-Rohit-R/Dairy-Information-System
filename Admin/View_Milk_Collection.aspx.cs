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
    public partial class View_Milk_Collection : System.Web.UI.Page
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
                BindGrid();
                LoadDates();
                TextBox1.Visible = false;
            }

        }

        private void LoadDates()
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                string query = "SELECT DISTINCT Collection_Date FROM Milk_Collections ORDER BY Collection_Date DESC";
                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlDates.DataSource = reader;
                ddlDates.DataTextField = "Collection_Date";
                ddlDates.DataValueField = "Collection_Date";
                ddlDates.DataBind();
                conn.Close();

                ddlDates.Items.Insert(0, new ListItem("-- Select Date --", "0"));
            }
        }

        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                string query = "SELECT * FROM Milk_Collections WHERE Collection_Date LIKE @Name + '%'";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
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

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void ddlDates_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
                {
                    string query = "SELECT * FROM Milk_Collections WHERE Collection_Date = @CollectionDate";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@CollectionDate", Convert.ToDateTime(ddlDates.SelectedValue));

                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                BindGrid();
            }
        }
    }
}