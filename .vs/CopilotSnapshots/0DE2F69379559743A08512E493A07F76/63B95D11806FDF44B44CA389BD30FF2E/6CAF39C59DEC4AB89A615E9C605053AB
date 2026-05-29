using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebpageDemo
{

    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDataUsingLINQ();
            }
        }

        private void LoadDataUsingLINQ()
        {
            List<Student> students = new List<Student>()
            {
                new Student{ RollNo=101, Name="Sanchit", Course="BCA"},
                new Student{ RollNo=102, Name="Rahul", Course="MCA"},
                new Student{ RollNo=103, Name="Priya", Course="BSc IT"},
                new Student{ RollNo=104, Name="Neha", Course="BCA"}
            };

            // LINQ Query
            var result = from s in students
                         where s.Course == "BCA"
                         select s;

            GridView1.DataSource = result.ToList();
            GridView1.DataBind();
        }
    }

    public class Student
    {
        public int RollNo { get; set; }
        public string Name { get; set; }
        public string Course { get; set; }
    }
}