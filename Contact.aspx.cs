using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace D
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        string str;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text;
            string email = TextBox2.Text;
            string message = TextArea1.InnerText;

            using (SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                conn.Open();

                string checkQuery = "SELECT COUNT(*) FROM Singup WHERE UserId = @Email";
                SqlCommand cmd;
                using (cmd = new SqlCommand(checkQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);

                    int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                        string insertQuery = "INSERT INTO Contact(Name,Email,Message) VALUES (@Name,@Email,@Message)";
                        using (cmd = new SqlCommand(insertQuery, conn))
                        {
                            cmd.Parameters.AddWithValue("@Name", name);
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@Message", message);

                            cmd.ExecuteNonQuery();

                            Response.Write("<script>alert('Data Inserted')</script>");

                            TextBox1.Text = "";
                            TextBox2.Text = "";
                            TextArea1.InnerText = "";
                        }
                    }
                    else 
                    {
                        Error.Text = "EmailID Is Not Register!";
                        Error.ForeColor = System.Drawing.Color.Red;
                        return;  
                    }
                }
            }

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            
        }
    }
}