 # ASP.NET Web Forms & MVC Practical Handbook

 ## Table of Contents

 1. [Master Page Concept](#master-page-concept)
 2. [Data Bound Controls](#data-bound-controls)
 3. [LINQ Demonstration](#linq-demonstration)
 4. [Client Side Session Management](#client-side-session-management)
 5. [Server Side Session Management](#server-side-session-management)
 6. [Web Services (Produce & Consume)](#web-services-produce--consume)
 7. [MVC Framework](#mvc-framework)
 8. [Simple Stored Procedure](#simple-stored-procedure)
 9. [Parameterized Stored Procedure](#parameterized-stored-procedure)
 10. [SQL Server Setup](#sql-server-setup)
 11. [Connection Strings](#connection-strings)
 12. [Common ASP.NET Controls](#common-aspnet-controls)
 13. [Visual Studio Shortcuts](#visual-studio-shortcuts)
 14. [Frequent Viva Questions & Answers](#frequent-viva-questions--answers)

 ---

 ## Master Page Concept

 Aim: Create a website using a Master Page and Content Pages.

 Concept: A Master Page provides a common layout for multiple pages, enabling consistent UI and reuse.

 Advantages:
 - Consistent UI
 - Reusable layout
 - Easier maintenance
 - Reduces code duplication

 Steps:
 - File → New Project → ASP.NET Web Application (.NET Framework) → Web Forms
 - Project → Add → New Item → Master Page

 Example (Site.Master placeholder):

 ```aspx
 <asp:ContentPlaceHolder ID="MainContent" runat="server">
 </asp:ContentPlaceHolder>
 ```

 Create content pages: Add → Web Form → Select Master Page (e.g., `Home.aspx`, `About.aspx`).

 Quick Viva:
 - What is a Master Page? A layout template for multiple pages.
 - File extension: `.master`.
 - `ContentPlaceHolder`: region where content pages inject content.

 ---

 ## Data Bound Controls

 Aim: Demonstrate common ASP.NET data-bound controls and patterns.

 Controls: `GridView`, `DropDownList`, `DetailsView`, `Repeater`, `DataList`.

 Core concept: Data binding connects UI controls to data sources (DataTable, List<T>, LINQ).

 Example (code-behind):

 ```csharp
 var dt = GetStudentsDataTable();
 GridView1.DataSource = dt;
 GridView1.DataBind();
 ```

 Best practices:
 - Use model classes (POCOs) or `DataTable` for binding.
 - Prefer `ObjectDataSource` or manual binding for better control over lifecycle.
 - Use paging and sorting on `GridView` for large datasets.

 ---

 ## LINQ Demonstration

 Aim: Demonstrate LINQ to Objects and LINQ query patterns.

 Namespace:

 ```csharp
 using System.Linq;
 ```

 Query syntax example:

 ```csharp
 var result = from s in students
              where s.Course == "BCA"
              select s;
 ```

 Method syntax example:

 ```csharp
 var result = students.Where(s => s.Course == "BCA");
 ```

 Types: LINQ to Objects, LINQ to SQL, LINQ to XML, LINQ to DataSet, LINQ to Entities.

 Advantages: concise, readable, compile-time checking.

 Advanced tip: For deferred execution, materialize with `.ToList()` when reusing results.

 ---

 ## Client Side Session Management

 Technique: Cookies (and localStorage for SPA-like frontends).

 Create a cookie (Web Forms):

 ```csharp
 HttpCookie cookie = new HttpCookie("UserInfo");
 cookie.Value = txtName.Text;
 cookie.Expires = DateTime.Now.AddDays(7);
 Response.Cookies.Add(cookie);
 ```

 Read cookie:

 ```csharp
 var name = Request.Cookies["UserInfo"]?.Value;
 ```

 Pros: reduces server load, can persist across sessions.
 Cons: less secure, user can delete/modify, size limits.

 Security tip: Never store sensitive data in cookies; store an identifier and keep sensitive state server-side.

 ---

 ## Server Side Session Management

 Technique: `Session` object in ASP.NET Web Forms.

 Store session:

 ```csharp
 Session["UserName"] = txtName.Text;
 ```

 Read session:

 ```csharp
 var user = Session["UserName"] as string;
 ```

 Clear session:

 ```csharp
 Session.Clear();
 Session.Abandon();
 ```

 Pros: secure, stored on server. Cons: consumes server memory; consider out-of-process session stores (StateServer, Redis) for scale.

 ---

 ## Web Services (Produce & Consume)

 Concept: Application-to-application communication. Examples: ASMX, WCF, Web API.

 Producer (ASMX example):

 ```csharp
 [WebMethod]
 public int Add(int a, int b) => a + b;
 ```

 Consumer (add service reference in Web Forms):

 ```csharp
 var service = new ServiceRef.WebService1();
 int result = service.Add(10, 20);
 ```

 Technologies: SOAP/WSDL (ASMX), WCF, REST/JSON (ASP.NET Web API / MVC controllers).

 Viva:
 - WSDL = Web Service Description Language.
 - SOAP = XML-based protocol.

 Best practice: Prefer REST/JSON for new APIs; use HTTPS and authentication (OAuth/JWT) for secure services.

 ---

 ## MVC Framework

 Pattern: Model-View-Controller.

 Model example (POCO):

 ```csharp
 public class User { public string Name { get; set; } }
 ```

 Controller example:

 ```csharp
 public class HomeController : Controller
 {
     public ActionResult Index()
     {
         return View();
     }
 }
 ```

 View: `Index.cshtml` (Razor).

 Advantages: separation of concerns, better testability, no ViewState, explicit routing.

 Migration tip: When moving from Web Forms to MVC, separate concerns (data access → services, UI → views).

 ---

 ## Simple Stored Procedure

 Create table:

 ```sql
 CREATE TABLE Students
 (
  RollNo INT PRIMARY KEY,
  Name VARCHAR(50),
  Course VARCHAR(50)
 );
 ```

 Insert data example:

 ```sql
 INSERT INTO Students VALUES
 (101,'Sanchit','BCA'),
 (102,'Rahul','MCA');
 ```

 Stored procedure:

 ```sql
 CREATE PROCEDURE GetStudents
 AS
 BEGIN
  SELECT * FROM Students;
 END
 ```

 Execute with `EXEC GetStudents`.

 Consume in ASP.NET (Ado.NET):

 ```csharp
 using(var con = new SqlConnection(connString))
 using(var cmd = new SqlCommand("GetStudents", con))
 {
     cmd.CommandType = CommandType.StoredProcedure;
     var da = new SqlDataAdapter(cmd);
     var dt = new DataTable();
     da.Fill(dt);
 }
 ```

 ---

 ## Parameterized Stored Procedure

 Procedure example:

 ```sql
 CREATE PROCEDURE GetStudentByRollNo
  @RollNo INT
 AS
 BEGIN
  SELECT * FROM Students WHERE RollNo=@RollNo;
 END
 ```

 Execute: `EXEC GetStudentByRollNo 101`.

 ASP.NET usage:

 ```csharp
 cmd.Parameters.AddWithValue("@RollNo", int.Parse(txtRollNo.Text));
 ```

 Advantages: dynamic, prevents SQL injection, and improves plan reuse.

 ---

 ## SQL Server Setup

 Open SQL Server Management Studio (SSMS) or use Visual Studio's SQL Server Object Explorer.

 Local connection example: `(localdb)\\MSSQLLocalDB` using Windows Authentication.

 Tip: create a dedicated database (e.g., `CollegeDB`) and deploy scripts via migrations or tSQL files.

 ---

 ## Connection Strings

 Example in `web.config`:

 ```xml
 <connectionStrings>
   <add name="DBCS" connectionString="Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=CollegeDB;Integrated Security=True" providerName="System.Data.SqlClient" />
 </connectionStrings>
 ```

 Use `ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString` (Web Forms) or `IConfiguration` in ASP.NET Core.

 ---

 ## Common ASP.NET Controls

 TextBox:

 ```aspx
 <asp:TextBox runat="server" ID="txtName" />
 ```

 Button:

 ```aspx
 <asp:Button runat="server" ID="btnSubmit" Text="Submit" />
 ```

 Label:

 ```aspx
 <asp:Label runat="server" ID="lblMessage" />
 ```

 GridView and DropDownList:

 ```aspx
 <asp:GridView runat="server" ID="GridView1" />
 <asp:DropDownList runat="server" ID="ddlStudents" />
 ```

 Accessibility tip: use `aria-` attributes and semantic HTML in templates.

 ---

 ## Visual Studio Shortcuts

 - Build Solution: `Ctrl + Shift + B`
 - Run/Debug: `F5`
 - Stop: `Shift + F5`
 - Find: `Ctrl + F`
 - Replace: `Ctrl + H`
 - Comment: `Ctrl + K, Ctrl + C`
 - Uncomment: `Ctrl + K, Ctrl + U`
 - Format Document: `Ctrl + K, Ctrl + D`

 ---

 ## Frequent Viva Questions & Answers

 Q: What is ASP.NET?
 A: A Microsoft framework for building web applications using .NET languages (C#, VB.NET).

 Q: Difference between Web Forms and MVC?
 A: Web Forms is event-driven with ViewState; MVC uses routing, no ViewState, better separation of concerns.

 Q: What is ADO.NET?
 A: Library for database connectivity (SqlConnection, SqlCommand, SqlDataAdapter, DataTable).

 Q: What is Session vs Cookie?
 A: `Session` stores data server-side; cookies store data on the client browser.

 Q: What is LINQ?
 A: Language Integrated Query—query collections and data sources in a typed, composable way.

 ---

 ## Advanced Tips & Best Practices

 - Use parameterized queries or stored procedures to avoid SQL injection.
 - Offload session state to a distributed store (Redis) for load-balanced apps.
 - Prefer REST/JSON APIs for modern interoperability; secure with TLS and tokens.
 - Add logging (Serilog/NLog) and centralized error handling.
 - Apply paging and async DB calls for scalable UI data binding.

 ---

 ## Conclusion

 This consolidated handbook covers Master Pages, Data Bound Controls, LINQ, Cookies, Sessions, Web Services, MVC, Stored Procedures, SQL Server setup, Connection Strings, common controls, Visual Studio shortcuts, and viva Q&A — presented as a single reference for practical ASP.NET Web Forms and MVC development.

https://chatgpt.com/share/6a19f9ec-748c-83a8-ae0e-cdf5ca357953
 

 If you want, I can:
 - Commit these changes to a branch, or
 - Create a downloadable PDF of this handbook, or
 - Split examples into small runnable sample projects in the workspace.
"# Asp.Net-Pracs" 
