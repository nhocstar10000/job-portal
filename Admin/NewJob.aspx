<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="NewJob.aspx.cs" Inherits="job_portal.Admin.NewJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image:url('../Images/bg.jpg'); width:100%; height:720px;background-repeat:no-repeat;background-size:cover;background-attachment:fixed">
        <div class="container pt-4 pb-4">
            <%--<div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>--%>
            <div class="btn-toolbar justify-content-between mb-3">
                <div class="btn-group">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
                <div class="input-group h-25">
                    <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/Admin/JobList.aspx" CssClass="btn btn-secondary" Visible="false">< Back</asp:HyperLink>
                </div>
            </div>
            <h3 class="text-center"><%Response.Write(Session["title"]); %></h3>
            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtJobTitle" style="font-weight:600">Job Title</label>
                    <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control" placeholder="Ex. Web Developer, App Developer" required>
                    </asp:TextBox>
                </div>
                <div class="col-md-6 pt-3">
                    <label for="txtNoOfPost" style="font-weight:600">Number Of Post</label>
                    <asp:TextBox ID="txtNoOfPost" runat="server" CssClass="form-control" placeholder="Enter Number of Position" Textmode ="Number" required>
                    </asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-12 pt-3">
                    <label for="txtJobTitle" style="font-weight:600">Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" Textmode="MultiLine" CssClass="form-control" placeholder="Enter Job Description" required>
                    </asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtQualification" style="font-weight:600">Qualification/Education Required</label>
                    <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control" placeholder="Ex. MCA, Btech, MBA" required>
                    </asp:TextBox>
                </div>
                <div class="col-md-6 pt-3">
                    <label for="txtExperience" style="font-weight:600">Experience Required</label>
                    <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" placeholder="Ex: 2 years, 1.5 years" required>
                    </asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtSpecialization" style="font-weight:600">Specialization Required</label>
                    <asp:TextBox ID="txtSpecialization" runat="server" Textmode ="MultiLine" CssClass="form-control" placeholder="Enter Specialization" required>
                    </asp:TextBox>
                </div>
                <div class="col-md-6 pt-3">
                    <label for="txtLastDay" style="font-weight:600">Last Date To Apply</label>
                    <asp:TextBox ID="txtLastDay" runat="server" Textmode="Date" CssClass="form-control" placeholder="Enter Last Date To Apply" required>
                    </asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtSalary" style="font-weight:600">Salary</label>
                    <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" placeholder="Ex: 25000/Month, 7L/Year" required>
                    </asp:TextBox>
                </div>
                <div class="col-md-6 pt-3">
                    <label for="txtLastDay" style="font-weight:600">Job Type</label>
                    <asp:DropDownList ID="ddlJobType" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Select Job Type</asp:ListItem>
                        <asp:ListItem>Full Time</asp:ListItem>
                        <asp:ListItem>Part Time</asp:ListItem>
                        <asp:ListItem>Remote</asp:ListItem>
                        <asp:ListItem>Freelance</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Job Type is required" ForeColor="Red" ControlToValidate="ddlJobType" InitialValue="0" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-6 pt-3">
                     <label for="txtCompany" style="font-weight:600">Company/Organisation Name</label>
                     <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control" placeholder="Enter Company/Organisation Name" required>
                     </asp:TextBox>
                 </div>
                 <div class="col-md-6 pt-3">
                     <label for="txtLastDay" style="font-weight:600">Company/Organisation logo</label>
                     <asp:FileUpload ID="fuCompanyLogo" runat="server" CssClass="form-control" ToolTip=".jpg, .jpeg, .png extension only" />
                     
                 </div>
             </div>

             <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-6 pt-3">
                     <label for="txtWebsite" style="font-weight:600">Website</label>
                     <asp:TextBox ID="txtWebsite" runat="server" Textmode ="Url" CssClass="form-control" placeholder="Enter Website">
                     </asp:TextBox>
                 </div>
                 <div class="col-md-6 pt-3">
                     <label for="txtEmail" style="font-weight:600">Email</label>
                     <asp:TextBox ID="txtEmail" runat="server" Textmode="Email" CssClass="form-control" placeholder="Enter Email">
                     </asp:TextBox>
                 </div>
             </div>

             <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-12 pt-3">
                     <label for="txtAddress" style="font-weight:600">Address</label>
                     <asp:TextBox ID="txtAddress" runat="server" Textmode="MultiLine" CssClass="form-control" placeholder="Enter Work Location" required>
                     </asp:TextBox>
                 </div>
             </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtCountry" style="font-weight:600">Country</label>
                     <asp:DropDownList ID="dd1Country" runat="server" DataSourceID="SqlDataSource1" CssClass="form-contact w-100" AppendDataBoundItems="true" DataTextField="CountryName" DataValueField="CountryName">
                         <asp:ListItem Value="0">Select Country</asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Country is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0" ControlToValidate="dd1Country"></asp:RequiredFieldValidator>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:JobPortalConnectionString %>" ProviderName="<%$ ConnectionStrings:JobPortalConnectionString.ProviderName %>" SelectCommand="SELECT [CountryName] FROM [Country]"></asp:SqlDataSource>
                </div>
                <div class="col-md-6 pt-3">
                    <label for="txtState" style="font-weight:600">State</label>
                    <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="Enter State" required>
                    </asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3 pt-4">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnADD" CssClass="btn btn-primary btn-block" BackColor="#720cf" runat="server" Text="Add Job" OnClick="btnADD_Click"/>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
