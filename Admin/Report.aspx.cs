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
    public partial class Report : System.Web.UI.Page
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
                LoadMilkData();
            } 

        }

        private void LoadMilkData()
        {

            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                conn.Open();
                string query = @"
                  SELECT 
                      FarmerID, Milk_Type, Fat, Quantity, SNF, Time, CAST(Collection_Date AS DATE) AS CollectionDate
                  FROM Milk_Collections
                  WHERE Collection_Date >= DATEADD(DAY, -1, GETDATE()) AND Collection_Date <= GETDATE();";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                var eveningRows = dt.Select("Time = 'Evening'");
                var morningRows = dt.Select("Time = 'Morning'");

                txtEvening.Text = eveningRows.Length > 0 ? eveningRows[0]["CollectionDate"].ToString() : "N/A";

                txtMorning.Text = morningRows.Length > 0 ? morningRows[0]["CollectionDate"].ToString() : "N/A";

                txtTotalCow.Text = (GetTotalCount(eveningRows, "Cow") + GetTotalCount(morningRows, "Cow")).ToString();
                txtTotalBuffalo.Text = (GetTotalCount(eveningRows, "Buffalo") + GetTotalCount(morningRows, "Buffalo")).ToString();
                txtTotalFarmer.Text = (eveningRows.Length + morningRows.Length).ToString();

                txtTotalMilk.Text = (GetTotal(eveningRows, "Quantity") + GetTotal(morningRows, "Quantity")).ToString();
                txtTotalFat.Text = (GetTotal(eveningRows, "Fat") + GetTotal(morningRows, "Fat")).ToString();
                txtTotalSNF.Text = (GetTotal(eveningRows, "SNF") + GetTotal(morningRows, "SNF")).ToString();

            }

        }

        private int GetTotalCount(DataRow[] rows, string milkType)
        {
            return rows.Count(r => r["Milk_Type"].ToString() == milkType);
        }

        private decimal GetTotal(DataRow[] rows, string column)
        {
            return rows.Sum(r => Convert.ToDecimal(r[column]));
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