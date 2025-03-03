using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DIS.OTP
{
    public partial class Report : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
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

            // Evening Date
            txtEveningDate.Text = eveningRows.Length > 0 ? eveningRows[0]["CollectionDate"].ToString() : "N/A";

            // Morning Date
            txtMorningDate.Text = morningRows.Length > 0 ? morningRows[0]["CollectionDate"].ToString() : "N/A";

            // Totals for Evening
            lblTotalCowEvening.Text = GetTotalCount(eveningRows, "Cow").ToString();
            lblTotalBuffaloEvening.Text = GetTotalCount(eveningRows, "Buffalo").ToString();
            lblTotalFarmersEvening.Text = eveningRows.Length.ToString();
            lblTotalMilkEvening.Text = GetTotal(eveningRows, "Quantity").ToString();
            lblTotalFatEvening.Text = GetTotal(eveningRows, "Fat").ToString();
            lblTotalSNFEvening.Text = GetTotal(eveningRows, "SNF").ToString();

            // Totals for Morning
            lblTotalCowMorning.Text = GetTotalCount(morningRows, "Cow").ToString();
            lblTotalBuffaloMorning.Text = GetTotalCount(morningRows, "Buffalo").ToString();
            lblTotalFarmersMorning.Text = morningRows.Length.ToString();
            lblTotalMilkMorning.Text = GetTotal(morningRows, "Quantity").ToString();
            lblTotalFatMorning.Text = GetTotal(morningRows, "Fat").ToString();
            lblTotalSNFMorning.Text = GetTotal(morningRows, "SNF").ToString();
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

    }
}