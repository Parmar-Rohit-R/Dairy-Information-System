using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace D.Image
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        SqlCommand cmd;
        String str;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Name"] != null)
                {
                    LoadUserProfile();
                }
                else
                {
                    Response.Redirect("~/Home.aspx");
                }
            }
        }

        private void LoadUserProfile()
        {
            if (Session["Role"] == "User")
            {
                string name = Session["Name"].ToString();
                cn.Open();

                str = "select Name, UserId, Password from Singup where Name = @name";

                cmd = new SqlCommand(str, cn);
                cmd.Parameters.AddWithValue("@name", name);

                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtName.Text = dr["Name"].ToString();
                    txtEmail.Text = dr["UserId"].ToString();
                    txtPassword.Text = dr["Password"].ToString();
                }
            }
            else
            {
                string name = Session["Name"].ToString();
                cn.Open();

                str = "select FarmerName, F_UserID, F_Password from Farmer where FarmerName = @name";

                cmd = new SqlCommand(str, cn);
                cmd.Parameters.AddWithValue("@name", name);

                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtName.Text = dr["FarmerName"].ToString();
                    txtEmail.Text = dr["F_UserID"].ToString();
                    txtPassword.Text = dr["F_Password"].ToString();
                }
                else
                {
                    Response.Write("Record Is Not Found!");
                }
            }

        }

        protected void btnSingup_Click(object sender, EventArgs e)
        {
            if (Session["Role"] == "User")
            {
                cn.Open();

                string name = Session["Name"].ToString();

                str = "update Singup set Name='" + txtName.Text + "',UserId='" + txtEmail.Text + "', Password='" + txtPassword.Text + "' where Name=@name";

                cmd = new SqlCommand(str, cn);

                cmd.Parameters.AddWithValue("@name", name);

                cmd.ExecuteNonQuery();

                Session["UserId"] = txtEmail.Text;

                string tc = Session["UserId"].ToString();

                if (tc == txtEmail.Text)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "LoginSuccess",
                        "Swal.fire({ " +
                            "title: 'Change Successful!', " +
                            "text: 'Your Profile can Change!', " +
                            "icon: 'success', " +
                            "confirmButtonText: 'OK', " +
                            "customClass: { confirmButton: 'custom-ok-button' }" +
                        "}).then((result) => { " +
                            "if (result.isConfirmed) { window.location.href = 'Home.aspx'; } });", true);

                }
            }
            else
            {
                cn.Open();

                string name = Session["Name"].ToString();

                str = "update Farmer set FarmerName='" + txtName.Text + "',F_UserID='" + txtEmail.Text + "', F_Password='" + txtPassword.Text + "' where FarmerName=@name";

                cmd = new SqlCommand(str, cn);

                cmd.Parameters.AddWithValue("@name", name);

                cmd.ExecuteNonQuery();

                Session["F_UserId"] = txtEmail.Text;

                string tc = Session["F_UserID"].ToString();

                if (tc == txtEmail.Text)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "LoginSuccess",
                        "Swal.fire({ " +
                            "title: 'Change Successful!', " +
                            "text: 'Your Profile can Change!', " +
                            "icon: 'success', " +
                            "confirmButtonText: 'OK', " +
                            "customClass: { confirmButton: 'custom-ok-button' }" +
                        "}).then((result) => { " +
                            "if (result.isConfirmed) { window.location.href = 'Home.aspx'; } });", true);

                }
            }
        }
    }
}