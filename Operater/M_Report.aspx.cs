using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DIS.Operater
{
    public partial class M_Report : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        string str;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Name"] == null)
            {
                Response.Redirect("~/Operater/Op_Login.aspx");
            }
            else
            {
                LinkButton1.Text = Session["Name"].ToString();
            }

            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
                {
                    SqlCommand cmd = new SqlCommand("SELECT DISTINCT Collection_Date FROM Milk_Collections", con);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    ddlStartDate.DataSource = dr;
                    ddlStartDate.DataTextField = "Collection_Date";
                    ddlStartDate.DataValueField = "Collection_Date";
                    ddlStartDate.DataBind();

                    using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
                    {
                        SqlCommand cmd1 = new SqlCommand("SELECT DISTINCT Collection_Date FROM Milk_Collections", conn);
                        conn.Open();
                        SqlDataReader dr1 = cmd1.ExecuteReader();
                        ddlEndDate.DataSource = dr1;
                        ddlEndDate.DataTextField = "Collection_Date";
                        ddlEndDate.DataValueField = "Collection_Date";
                        ddlEndDate.DataBind();
                    }
                }
            }

        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            cn.Open();

            str = "select Name from Operator where Name='" + LinkButton1.Text + "'";

            cmd = new SqlCommand(str, cn);

            string name = cmd.ExecuteScalar().ToString();

            Session["Name"] = name;

            Response.Redirect("~/Operater/Op_Profile.aspx");
        }

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Operater/Op_Login.aspx");
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            DateTime startDate = Convert.ToDateTime(ddlStartDate.SelectedValue);
    DateTime endDate = Convert.ToDateTime(ddlEndDate.SelectedValue);

    using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
    {
        con.Open();

        using (SqlCommand cmd = new SqlCommand("select * from Milk_Collections where Collection_Date between @StartDate and @EndDate ", con))
        {
            cmd.Parameters.AddWithValue("@StartDate", startDate);
            cmd.Parameters.AddWithValue("@EndDate", endDate);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvReport.DataSource = dt;
            
            int totalCow = dt.AsEnumerable().Count(row => row["Milk_Type"].ToString() == "Cow");
            int totalBuffalo = dt.AsEnumerable().Count(row => row["Milk_Type"].ToString() == "Buffalo");
            int totalFarmers = dt.AsEnumerable().Select(row => row["FarmerID"]).Distinct().Count();
            int totalMilk = dt.AsEnumerable().Sum(row => Convert.ToInt32(row["Quantity"]));
            int totalFat = dt.AsEnumerable().Sum(row => Convert.ToInt32(row["Fat"]));
            int totalSNF = dt.AsEnumerable().Sum(row => Convert.ToInt32(row["SNF"]));


            // Bind totals to TextBoxes
            txtTotalCow.Text = totalCow.ToString();
            txtTotalBuffalo.Text = totalBuffalo.ToString();
            txtTotalFarmer.Text = totalFarmers.ToString();
            txtTotalMilk.Text = totalMilk.ToString();
            txtTotalFat.Text = totalFat.ToString();
            txtTotalSNF.Text = totalSNF.ToString();
        }
    }
        }

    }
}