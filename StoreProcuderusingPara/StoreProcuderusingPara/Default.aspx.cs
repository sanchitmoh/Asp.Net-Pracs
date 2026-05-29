using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace StoreProcuderusingPara
{
    public partial class _Default : System.Web.UI.Page
    {
        string cs =
            ConfigurationManager
            .ConnectionStrings["DBCS"]
            .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                SqlCommand cmd =
                    new SqlCommand(
                        "GetStudentByRollNo",
                        con);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue(
                    "@RollNo",
                    Convert.ToInt32(txtRollNo.Text));

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt =
                    new DataTable();

                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}