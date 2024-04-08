using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace job_portal.User
{
    public partial class ResumeBuild : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader sdr;
        string query;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    showInfo();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void showInfo()
        {
            try
            {
                con = new SqlConnection(str);
                string query = "Select * from [User] where UserID = @userId";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userId", Request.QueryString["id"]);
                con.Open();
                sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    if (sdr.Read())
                    {
                        txtUsername.Text = sdr["UserName"].ToString();
                        txtFullName.Text = sdr["Name"].ToString();
                        txtEmail.Text = sdr["Email"].ToString();
                        txtMobile.Text = sdr["Mobile"].ToString();
                        txtTenth.Text = sdr["TenthGrade"].ToString();
                        txtTwelfth.Text = sdr["TwelfthGrade"].ToString();
                        txtGraduation.Text = sdr["GraduationGrade"].ToString();
                        txtPostGraduation.Text = sdr["PostGraduationGrade"].ToString();
                        txtPhd.Text = sdr["Phd"].ToString();
                        txtWork.Text = sdr["WorksOn"].ToString();
                        txtExperience.Text = sdr["Experience"].ToString();
                        txtAddress.Text = sdr["Address"].ToString();
                        dd1Country.SelectedValue = sdr["Country"].ToString();
                    }
                    else
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "User not found";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    string concatQuery = string.Empty;
                    string filepath = string.Empty;
                    //bool isValidToExecute = false;
                    bool isValid = false;
                    con = new SqlConnection(str);
                    if (fuResume.HasFile)
                    {
                        if (Utils.IsVaildToExecute4Resume(fuResume.FileName))
                        {
                            concatQuery = "Resume=@Resume";
                            isValid = true;
                        }
                        else
                        {
                            concatQuery = string.Empty;
                        
                        }
                    }
                    else
                    {
                        concatQuery = string.Empty;
                    }
                    query = @"Update [User] set UserName=@Username,Name=@Name,Email=@Email,Mobile=@Mobile,TenthGrade=@TenthGrade,TwelfthGrade=@TwelfthGrade,GraduationGrade=@GraduationGrade,
                            PostGraduationGrade=@PostGraduationGrade,Phd=@Phd,WorksOn=@WorksOn,Experience=@Experience," + concatQuery + ",Address=@Address,Country=@Country where UserID=@UserID";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.Add("@Username", txtUsername.Text.Trim());
                    cmd.Parameters.Add("@Name", txtFullName.Text.Trim());
                    cmd.Parameters.Add("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.Add("@Mobile", txtMobile.Text.Trim());
                    cmd.Parameters.Add("@TenthGrade", txtTenth.Text.Trim());
                    cmd.Parameters.Add("@TwelfthGrade", txtTwelfth.Text.Trim());
                    cmd.Parameters.Add("@GraduationGrade", txtGraduation.Text.Trim());
                    cmd.Parameters.Add("@PostGraduationGrade", txtPostGraduation.Text.Trim());
                    cmd.Parameters.Add("@Phd", txtPhd.Text.Trim());
                    cmd.Parameters.Add("@WorksOn", txtWork.Text.Trim());
                    cmd.Parameters.Add("@Experience", txtExperience.Text.Trim());
                    cmd.Parameters.Add("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.Add("@Country", dd1Country.SelectedValue);
                    cmd.Parameters.Add("@UserId", Request.QueryString["id"]);
                    if (fuResume.HasFiles)
                    {
                        if (Utils.IsVaildToExecute4Resume(fuResume.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            filepath = "Resumes/" + obj.ToString() + fuResume.FileName;
                            fuResume.PostedFile.SaveAs(Server.MapPath("~/Resumes/") + obj.ToString() + fuResume.FileName);
                            cmd.Parameters.AddWithValue("@Resume", filepath);
                            isValid = true; 
                        }
                        else
                        {
                            concatQuery = string.Empty;
                            lblMsg.Visible = true;
                            lblMsg.Text = "Please select .doc, .docx, .pdf file for resume";
                            lblMsg.CssClass = "alert alert-danger";
                        }

                    }
                    else
                    {
                        isValid = true;
                    }
                    if (isValid)
                    {
                        con.Open();
                        int r = cmd.ExecuteNonQuery();
                        if (r > 0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Resume details updated successful";
                            lblMsg.CssClass = "alert alert-success";
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Can't update the record, please try after sometime";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }

                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Can't update the record, please try <b>Relogin</b>";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (SqlException ex)
            {
                if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" + txtUsername.Text.Trim() + "</b>" + " Username already exist, try new one! ";
                    lblMsg.CssClass = "alert alert-danger";
                }
                else
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }
    }
}