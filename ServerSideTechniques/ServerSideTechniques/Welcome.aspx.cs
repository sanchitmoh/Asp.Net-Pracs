using System;

namespace ServerSideTechniques
{
    public partial class Welcome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                lblName.Text =
                    "Welcome " +
                    Session["UserName"].ToString();
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();

            Response.Redirect("Default.aspx");
        }
    }
}