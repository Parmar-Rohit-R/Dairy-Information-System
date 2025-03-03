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
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMilkCollectionData();
            }

        }

        private void LoadMilkCollectionData()
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                string query = @"
                DECLARE @Yesterday DATE = CAST(DATEADD(DAY, -1, GETDATE()) AS DATE);
                DECLARE @Today DATE = CAST(GETDATE() AS DATE);

                SELECT 
                    CASE 
                        WHEN Time = 'Evening' THEN 'Evening'
                        WHEN Time = 'Morning' THEN 'Morning'
                    END AS TimePeriod,
                    Collection_Date,
                    COUNT(DISTINCT FarmerID) AS Total_Farmers,
                    SUM(CASE WHEN Milk_Type = 'Cow' THEN Quantity ELSE 0 END) AS Total_Cow,
                    SUM(CASE WHEN Milk_Type = 'Buffalo' THEN Quantity ELSE 0 END) AS Total_Buffalo,
                    SUM(Quantity) AS Total_Milk,
                    AVG(Fat) AS Total_Fat,
                    AVG(SNF) AS Total_SNF
                FROM 
                    Milk_Collections
                WHERE 
                    (Time = 'Evening' AND Collection_Date = @Yesterday)
                    OR 
                    (Time = 'Morning' AND Collection_Date = @Today)
                GROUP BY 
                    Time, Collection_Date;
            ";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    string timePeriod = reader["TimePeriod"].ToString();
                    if (timePeriod == "Evening")
                    {
                        lblEvening.Text = "Evening";
                        txtEveningDate.Text = Convert.ToDateTime(reader["Collection_Date"]).ToString("yyyy-MM-dd");
                        lblTotalCowEvening.Text = reader["Total_Cow"].ToString();
                        lblTotalBuffaloEvening.Text = reader["Total_Buffalo"].ToString();
                        lblTotalFatEvening.Text = reader["Total_Fat"].ToString();
                    }
                    else if (timePeriod == "Morning")
                    {
                        lblMorning.Text = "Morning";
                        txtMorningDate.Text = Convert.ToDateTime(reader["Collection_Date"]).ToString("yyyy-MM-dd");
                        lblTotalFarmerMorning.Text = reader["Total_Farmers"].ToString();
                        lblTotalMilkMorning.Text = reader["Total_Milk"].ToString();
                        lblTotalSNFMorning.Text = reader["Total_SNF"].ToString();
                    }
                }

                reader.Close();
                conn.Close();
            }
        }
    }
}