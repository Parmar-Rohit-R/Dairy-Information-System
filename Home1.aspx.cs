using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DI
{
    public partial class Home1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {

            ClientScript.RegisterStartupScript(this.GetType(), "MessageSuccess",
                    "Swal.fire({ " +
                        "title: 'Not Allow', " +
                        "text: 'Login First!', " +
                        "icon: 'error', " +
                        "confirmButtonText: 'OK', " +
                        "customClass: { confirmButton: 'custom-ok-button' }" +
                    "}).then((result) => { " +
                        "if (result.isConfirmed) { window.location.href = 'Home1.aspx'; } });", true);
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "MessageSuccess",
                    "Swal.fire({ " +
                        "title: 'Not Allow', " +
                        "text: 'Login First!', " +
                        "icon: 'error', " +
                        "confirmButtonText: 'OK', " +
                        "customClass: { confirmButton: 'custom-ok-button' }" +
                    "}).then((result) => { " +
                        "if (result.isConfirmed) { window.location.href = 'Home1.aspx'; } });", true);
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "MessageSuccess",
                    "Swal.fire({ " +
                        "title: 'Not Allow', " +
                        "text: 'Login First!', " +
                        "icon: 'error', " +
                        "confirmButtonText: 'OK', " +
                        "customClass: { confirmButton: 'custom-ok-button' }" +
                    "}).then((result) => { " +
                        "if (result.isConfirmed) { window.location.href = 'Home1.aspx'; } });", true);
        }

    }
}