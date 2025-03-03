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
    public partial class Op : System.Web.UI.Page
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
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int username = Convert.ToInt32(txtFarmerID.Text);
                string name = txtFarmerName.Text;
                decimal contact = Convert.ToDecimal(txtContact.Text);
                string email = txtEmail.Text;
                string password = txtRePassword.Text;

                using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
                {
                    conn.Open();
                    string checkQuery = "SELECT COUNT(*) FROM Farmer WHERE Farmer_ID = @Username";
                    using (SqlCommand cmd = new SqlCommand(checkQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);

                        int farmerCount = Convert.ToInt32(cmd.ExecuteScalar());
                        if (farmerCount > 0)
                        {
                            Error.Text = "FarmerID Is already Register!";
                            Error.ForeColor = System.Drawing.Color.Red;
                            return;
                        }
                        else
                        {
                            Error.Text = "";
                        }
                    }

                    string checkEmailQuery = "SELECT COUNT(*) FROM Farmer WHERE F_UserID = @Email";

                    using (SqlCommand cmd = new SqlCommand(checkEmailQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        int emailCount = Convert.ToInt32(cmd.ExecuteScalar());
                        if (emailCount > 0)
                        {
                            Error1.Text = "Email Is already Register!";
                            Error1.ForeColor = System.Drawing.Color.Red;
                            return;
                        }
                        else
                        {
                            Error1.Text = "";
                        }
                    }

                    string insertQuery = "INSERT INTO Farmer(Farmer_ID,FarmerName,ContactNo,F_UserID,F_Password) VALUES (@Username,@Name,@Contact,@Email,@Password)";
                    using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Contact", contact);
                        cmd.Parameters.AddWithValue("@Password", password);

                        cmd.ExecuteNonQuery();

                        Response.Write("<script>alert('Data Inserted')</script>");

                        txtFarmerName.Text = "";
                        txtFarmerID.Text = "";
                        txtEmail.Text = "";
                        txtContact.Text = "";
                        txtPassword.Text = "";
                        txtRePassword.Text = "";

                    }
                }
            }
            catch (Exception)
            {
                RegularExpressionValidator2.ErrorMessage = "Enter Details";
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

            str = "select Name from Operator where Name='" + LinkButton1.Text + "'";

            cmd = new SqlCommand(str, cn);

            string name = cmd.ExecuteScalar().ToString();

            Session["Name"] = name;

            Response.Redirect("~/Operater/Op_Profile.aspx");
        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {
           
        }

    }
}