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
    public partial class Update_Milk_Collection : System.Web.UI.Page
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
                string no = Request.QueryString["No"];
                if (!string.IsNullOrEmpty(no))
                {
                    LoadDetails(no);
                }
            }
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                con.Open();
                str = "select FarmerName from Farmer where Farmer_ID=@ID";

                cmd = new SqlCommand(str, con);
                cmd.Parameters.AddWithValue("@ID", TextBox8.Text);

                string name = cmd.ExecuteScalar().ToString();
                Error.Text = name;
            }

            TextBox2.Text = DateTime.Today.ToLongDateString();

        }



        private void  LoadDetails(string no)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                con.Open();
                string query = "select * from Milk_Collections where No=@No";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@No",no);
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        TextBox11.Text = dr["No"].ToString();
                        TextBox8.Text = dr["FarmerID"].ToString();
                        TextBox2.Text = dr["Collection_Date"].ToString();
                        TextBox9.Text = dr["Time"].ToString();
                        TextBox10.Text = dr["Milk_Type"].ToString();
                        TextBox3.Text = dr["Fat"].ToString();
                        TextBox4.Text = dr["Quantity"].ToString();
                        TextBox5.Text = dr["SNF"].ToString();
                        TextBox6.Text = dr["Rate_Per_Liter"].ToString();
                        TextBox7.Text = dr["Total_Amount"].ToString();
                    }

                }
            }
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
        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Operater/Op_Login.aspx");
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

        protected void DropDownList2_TextChanged(object sender, EventArgs e)
        {
            cn.Open();

            str = "select FarmerName from Farmer where Farmer_ID=@ID";

            cmd = new SqlCommand(str, cn);
            cmd.Parameters.AddWithValue("@ID", TextBox8.Text);

            string name = cmd.ExecuteScalar().ToString();
            Error.Text = name;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string no = TextBox11.Text;
            string fid = TextBox8.Text;
            string cd = TextBox2.Text;
            string time = TextBox9.Text;
            string mt = TextBox10.Text;
            string fat = TextBox3.Text;
            string qua = TextBox4.Text;
            string snf = TextBox5.Text;
            string rpl = TextBox6.Text;
            string ta = TextBox7.Text;
            

            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                con.Open();
                string query = "UPDATE Milk_Collections SET FarmerID=@Fid,Collection_Date=@Cd,Milk_Type=@Mt,Fat=@Fat,Quantity=@Qua,SNF=@Snf,Rate_Per_Liter=@Rpl,Total_Amount=@Ta,Time=@Time WHERE No=@No";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Fid",fid);
                    cmd.Parameters.AddWithValue("@Cd",cd);
                    cmd.Parameters.AddWithValue("@Mt",mt);
                    cmd.Parameters.AddWithValue("@Fat",fat);
                    cmd.Parameters.AddWithValue("@Qua",qua);
                    cmd.Parameters.AddWithValue("@Snf",snf);
                    cmd.Parameters.AddWithValue("@Rpl",rpl);
                    cmd.Parameters.AddWithValue("@Ta",ta);
                    cmd.Parameters.AddWithValue("@Time",time);
                    cmd.Parameters.AddWithValue("@No",no);

                    cmd.ExecuteNonQuery();

                }
            }
            Response.Redirect("~/Operater/View_Milk_Collection.aspx");

        }
    }
}