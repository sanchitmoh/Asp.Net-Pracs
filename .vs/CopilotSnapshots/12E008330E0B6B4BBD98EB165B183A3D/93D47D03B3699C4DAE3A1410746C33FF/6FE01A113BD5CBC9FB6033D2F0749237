using System;

namespace Webservice
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void btnAdd_Click(
            object sender,
            EventArgs e)
        {
            WebService1 service =
                new WebService1();

            int result = service.Add(
                Convert.ToInt32(txtNum1.Text),
                Convert.ToInt32(txtNum2.Text));

            lblResult.Text =
                "Result = " + result;
        }
    }
}