using System;

namespace ServerSideTechniques
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Session["UserName"] = txtName.Text;

            Response.Redirect("Welcome.aspx");
        }
    }
}