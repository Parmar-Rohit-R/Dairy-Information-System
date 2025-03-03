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
    public partial class Add_Milk_Collection : System.Web.UI.Page
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
                LoadCategories();
            }

            if (!IsPostBack)
            {
                SetTimeBasedValue();
            }

            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                con.Open();
                str = "select FarmerName from Farmer where Farmer_ID=@ID";

                cmd = new SqlCommand(str, con);
                cmd.Parameters.AddWithValue("@ID", DropDownList2.SelectedValue);

                string name = cmd.ExecuteScalar().ToString();
                Error.Text = name;
            }

            TextBox2.Text = DateTime.Today.ToLongDateString();
        }

        protected void SetTimeBasedValue()
        {
            int currentHour = DateTime.Now.Hour;

            if (currentHour >= 0 && currentHour < 12)
            {
                DropDownList3.SelectedValue = "Morning";
            }
            else
            {
                DropDownList3.SelectedValue = "Evening";
            }

        }

        

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Operater/Op_Login.aspx");
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            cn.Open();

            str = "select Name from Operater where Name='" + LinkButton1.Text + "'";

            cmd = new SqlCommand(str, cn);

            string name = cmd.ExecuteScalar().ToString();

            Session["Name"] = name;

            Response.Redirect("~/Operater/Op_Profile.aspx");
        }

        decimal rate;
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            decimal fat, qua, total;
            decimal no = Convert.ToDecimal(8.15);

            if (decimal.TryParse(TextBox3.Text, out fat))
            {
                rate = fat * no;
                TextBox6.Text = rate.ToString();
            }
            else
            {
                TextBox6.Text = "0";
            }

            if (decimal.TryParse(TextBox4.Text, out qua))
            {
                total = qua * rate;
                TextBox7.Text = total.ToString();
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
        }

        private void LoadCategories()
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Farmer", conn);
                SqlDataReader reader = cmd.ExecuteReader();
                DropDownList2.DataSource = reader;
                DropDownList2.DataTextField = "Farmer_ID";
                DropDownList2.DataValueField = "Farmer_ID";
                DropDownList2.DataBind();
                cn.Open();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cn.Open();

            string name = DropDownList2.SelectedValue.ToString();
            DateTime date = DateTime.Parse(TextBox2.Text);
            string type = DropDownList1.SelectedValue.ToString();
            decimal fat = Convert.ToDecimal(TextBox3.Text);
            decimal qua = Convert.ToDecimal(TextBox4.Text);
            decimal snf = Convert.ToDecimal(TextBox5.Text);
            decimal rate = Convert.ToDecimal(TextBox6.Text);
            decimal total = Convert.ToDecimal(TextBox7.Text);
            string time = DropDownList3.SelectedValue.ToString();

            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                conn.Open();
                SqlCommand cmd;
                string checkQuery = "SELECT COUNT(*) FROM Farmer WHERE Farmer_ID = @Username ";
                using (cmd = new SqlCommand(checkQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", name);

                    int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                        string insetQuery = "INSERT INTO Milk_Collections (FarmerID,Collection_Date,Milk_Type,Fat,Quantity,SNF,Rate_Per_Liter,Total_Amount,Time) VALUES(@Name,@Date,@Type,@Fat,@Qua,@Snf,@Rate,@Total,@Time)";

                        using (cmd = new SqlCommand(insetQuery, conn))
                        {
                            cmd.Parameters.AddWithValue("@Name", name);
                            cmd.Parameters.AddWithValue("@Date", date);
                            cmd.Parameters.AddWithValue("@Type", type);
                            cmd.Parameters.AddWithValue(@"Fat", fat);
                            cmd.Parameters.AddWithValue("@Qua", qua);
                            cmd.Parameters.AddWithValue("@Snf", snf);
                            cmd.Parameters.AddWithValue("Rate", rate);
                            cmd.Parameters.AddWithValue("@Total", total);
                            cmd.Parameters.AddWithValue("@Time",time);

                            cmd.ExecuteNonQuery();

                            Response.Write("<script>alert('Data Inserted')</script>");

                            TextBox3.Text = "";
                            TextBox4.Text = "";
                            TextBox5.Text = "";
                            TextBox6.Text = "";
                            TextBox7.Text = "";
                        }
                    }
                    else
                    {
                        Error.Text = "FarmerID Is Not Register!";
                        Error.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }
            }
        }

        protected void DropDownList2_TextChanged(object sender, EventArgs e)
        {
            cn.Open();

            str = "select FarmerName from Farmer where Farmer_ID=@ID";

            cmd = new SqlCommand(str, cn);
            cmd.Parameters.AddWithValue("@ID", DropDownList2.SelectedValue);

            string name = cmd.ExecuteScalar().ToString();
            Error.Text = name;
        }
    }
}