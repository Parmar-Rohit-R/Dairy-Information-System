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
    public partial class Op_D : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        String str;
        SqlDataReader dr;
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
                GetUserCount();
                ShowMilkCollectionTotal();
                ShowFarmerCount();
            }

        }

        private void GetUserCount()
        {
            cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");

            cn.Open();

            str = "select COUNT(*) AS UserCount from Farmer";

            cmd = new SqlCommand(str, cn);

            int FarmerCount = (int)cmd.ExecuteScalar();
            Label1.Text = "<center><i class='fa-solid fa-user' style='font-size:30px;'></i></center>" + "<br/> <center><b>" + FarmerCount + "</b></center>" + "<br/> <center>Total Registration <br/> Farmer</center> ";
            
        }

        private void ShowMilkCollectionTotal()
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                con.Open();

                string query = "SELECT SUM(Quantity) FROM Milk_Collections WHERE Collection_Date >= DATEADD(DAY, -1, GETDATE())";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    object result = cmd.ExecuteScalar();
                    decimal totalMilk = (result != DBNull.Value) ? Convert.ToDecimal(result) : 0;
                    Label2.Text = "<center><i class='fa-solid fa-cow' style='font-size:30px;' ></i></center>" + "<br/> <center><b>" + totalMilk + "</b></center>" + "<br/> <center>Today's<br>MilkCollections</center> ";
                }

            }
        }

        private void ShowFarmerCount()
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                con.Open();

                string query = "select COUNT(DISTINCT FarmerID) FROM Milk_Collections WHERE Collection_Date >= DATEADD(DAY, -1, GETDATE())";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    object result = cmd.ExecuteScalar();
                    int totalFarmers = (result != DBNull.Value) ? Convert.ToInt32(result) : 0;
                    Label3.Text = "<center><i class='fa-solid fa-address-card' style='font-size:30px;' ></i></center>" + "<br/> <center><b>" + totalFarmers + "</b></center>" + "<br/> <center>Total Farmer<br>Milk Add</center> ";
                }

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            cn.Open();

            str = "select Name from Operator where Name='" + LinkButton1.Text + "'";

            cmd = new SqlCommand(str, cn);

            string name = cmd.ExecuteScalar().ToString();

            Session["Name"] = name;

            Response.Redirect("~/Operater/Op_Profile.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Operater/Op_Login.aspx");
        }

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Operater/Op_Login.aspx");
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
    }
}