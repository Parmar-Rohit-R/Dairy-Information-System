using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


namespace DIS.Admin
{
    public partial class Update_Manage_Gallery : System.Web.UI.Page
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
                string no = Request.QueryString["No"];
                if (!string.IsNullOrEmpty(no))
                {
                    LoadDetails(no);
                }
            }

        }

        private void LoadDetails(string no)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
            {
                con.Open();
                string query = "select * from Gallery where Id=@No";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@No", no);
                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        txtDescription.Text = dr["Description"].ToString();
                    }

                }
            }
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


        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                string no = Request.QueryString["No"];
                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                string filePath = "../Image/" + fileName;
                fileUpload.SaveAs(Server.MapPath(filePath));

                string description = txtDescription.Text;

                using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"))
                {
                    con.Open();
                    string query = "UPDATE Gallery SET ImagePath=@Img, Description=@Dec WHERE Id=@No";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Img",filePath);
                        cmd.Parameters.AddWithValue("@Dec",description);
                        cmd.Parameters.AddWithValue("@No",no);
                        cmd.ExecuteNonQuery();

                    }
                }
                Response.Redirect("~/Admin/Manage_Gallery.aspx");

            }
        }

        protected void btnUpload0_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Manage_Gallery.aspx");
        }
    }
}