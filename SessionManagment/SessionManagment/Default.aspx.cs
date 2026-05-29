using System;
using System.Web;

namespace SessionManagment
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UserInfo"] != null)
                {
                    lblMessage.Text =
                        "Welcome Back : " +
                        Request.Cookies["UserInfo"].Value;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            HttpCookie cookie =
                new HttpCookie("UserInfo");

            cookie.Value = txtName.Text;

            cookie.Expires =
                DateTime.Now.AddDays(1);

            Response.Cookies.Add(cookie);

            lblMessage.Text =
                "Cookie Saved Successfully!";
        }
    }
}