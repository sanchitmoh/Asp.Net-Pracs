using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebpageDemo
{
    public partial class _Default : System.Web.UI.Page
    {
        string cs = ConfigurationManager
                   .ConnectionStrings["DBCS"]
                   .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
            }
        }

        private void LoadStudents()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT RollNo, Name FROM Students";

                SqlDataAdapter da =
                    new SqlDataAdapter(query, con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                ddlStudents.DataSource = dt;
                ddlStudents.DataTextField = "Name";
                ddlStudents.DataValueField = "RollNo";
                ddlStudents.DataBind();

                ddlStudents.Items.Insert(0, "--Select Student--");
            }
        }

        protected void ddlStudents_SelectedIndexChanged(
            object sender,
            EventArgs e)
        {
            if (ddlStudents.SelectedIndex > 0)
            {
                ShowStudentDetails();
            }
        }

        private void ShowStudentDetails()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query =
                    "SELECT * FROM Students WHERE RollNo=@RollNo";

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue(
                    "@RollNo",
                    ddlStudents.SelectedValue);

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}