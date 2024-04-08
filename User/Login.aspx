<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="job_portal.User.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
    <div class="container pt-50 pb-40">
         <div class="row">
     <div class="col-12 pb-20">
         <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
     </div>
     <div class="col-12">
         <h2 class="contact-title text-capitalize">Sign In</h2>
     </div>
     <div class="col-lg-6 mx-auto">
         <div class="form-contact contact_form">
             <div class="row">
                 
                 <div class="col-12">
                     <div class="form-group">
                         <label>Username</label>
                         <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username" required></asp:TextBox>
                         <%--<textarea class="form-control w-100" runat="server" name="message" id="message" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'" placeholder=" Enter Message" required></textarea>--%>
                     </div>
                 </div>
                 <div class="col-sm-6">
                     <div class="form-group">
                         <label>Password</label>
                         <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Enter Password" required></asp:TextBox>
                         <%--<input class="form-control valid" runat="server" name="name" id="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="Enter your name" required>--%>
                     </div>
                 </div>
                 <div class="col-12">
                     <div class="form-group">
                         <label>Login Type</label>
                         <asp:DropDownList ID="ddlLoginType" runat="server" CssClass="form-control w-100">
                             <asp:ListItem Value="0">Select Login Type</asp:ListItem>
                             <asp:ListItem>Admin</asp:ListItem>
                             <asp:ListItem>User</asp:ListItem>
                         </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="UserType is required" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0" ControlToValidate="ddlLoginType"></asp:RequiredFieldValidator>
                 </div>
             </div>
             <div class="form-group mt-3">
             
                 <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button button-contactForm boxed-btn mr-4" OnClick="btnLogin_Click" />
                 <span class="clickLink"><a href="../User/Register.aspx">New User? CLick Here</a></span>
             </div>
        
         </div>
    </div>
</section>
</asp:Content>
