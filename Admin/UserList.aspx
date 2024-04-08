<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="job_portal.Admin.UserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image:url('../Images/bg.jpg'); width:100%; height:720px;background-repeat:no-repeat;background-size:cover;background-attachment:fixed">
    <div class="container pt-4 pb-4">
        <div>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <h3 class="text-center">User List/Details</h3>
        <div class="row mb-3 pt-sm-3">
            <div class="col-md-12">
                   <asp:GridView ID="GridView1" CssClass="table table-hover table-bordered" runat="server" EmptyDataText="No record to display" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging"  DataKeyNames="UserID" OnRowDeleting="GridView1_RowDeleting" HeaderStyle-HorizontalAlign="Center">
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="Name" HeaderText="User Name">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile No.">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Country" HeaderText="Country">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>

        

                        <asp:CommandField CausesValidation="false" HeaderText="Delete" ShowDeleteButton="true" DeleteImageUrl="../assets/img/icon/trash-can.png" ButtonType="Image">
                            <ControlStyle  Height="25px" Width="25px"/>
                            <ItemStyle HorizontalAlign="Center"/>
                            </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</div>

</asp:Content>
