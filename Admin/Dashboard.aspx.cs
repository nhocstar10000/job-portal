using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace job_portal.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        DataTable dt;
        SqlDataAdapter sda;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
            if (!IsPostBack)
            {
                Users();
                Jobs();
                AppliedJobs();
                ContactUsers();
            }
        }

        private void ContactUsers()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from Contract",con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["Contract"] = dt.Rows[0][0];
            }
            else
            {
                Session["Contract"] = 0;
            }
        }

        private void AppliedJobs()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from AppliedJobs", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["AppliedJobs"] = dt.Rows[0][0];
            }
            else
            {
                Session["AppliedJobs"] = 0;
            }
        }

        private void Jobs()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from Jobs", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["Jobs"] = dt.Rows[0][0];
            }
            else
            {
                Session["Jobs"] = 0;
            }
        }

        private void Users()
        {
            con = new SqlConnection(str);
            sda = new SqlDataAdapter("Select Count(*) from [User]", con);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["User"] = dt.Rows[0][0];
            }
            else
            {
                Session["User"] = 0;
            }
        }
    }
}