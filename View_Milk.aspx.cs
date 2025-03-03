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
    public partial class View_Milk : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        String str;
        protected void Page_Load(object sender, EventArgs e)
        {
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
                if (Session["FarmerID"] != null)
                {
                    LoadDates();
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }

        private void LoadDates()
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                string query = "SELECT DISTINCT Collection_Date FROM Milk_Collections WHERE FarmerID = @FarmerID ORDER BY Collection_Date DESC";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FarmerID", Session["FarmerID"]);

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

        protected void ddlDates_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
                {
                    string query = "SELECT * FROM Milk_Collections WHERE FarmerID = @FarmerID AND Collection_Date = @CollectionDate";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@FarmerID", Session["FarmerID"]);
                    cmd.Parameters.AddWithValue("@CollectionDate", Convert.ToDateTime(ddlDates.SelectedValue));

                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvMilkData.DataSource = dt;
                    gvMilkData.DataBind();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                gvMilkData.DataSource = "";
                gvMilkData.DataBind();
            }
        }


        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            if (Session["Role"] == "User")
            {
                cn.Open();

                str = "select Name from Singup where Name='" + LinkButton5.Text + "'";

                cmd = new SqlCommand(str, cn);

                string name = cmd.ExecuteScalar().ToString();

                Session["Name"] = name;
                Session["Role"] = "User";

                Response.Redirect("~/Profile.aspx");
            }
            else
            {
                cn.Open();

                str = "select FarmerName from Farmer where FarmerName='" + LinkButton5.Text + "'";

                cmd = new SqlCommand(str, cn);

                string name = cmd.ExecuteScalar().ToString();

                Session["Name"] = name;

                Response.Redirect("~/Profile.aspx");
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
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