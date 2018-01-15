<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TimeDetail.aspx.cs" Inherits="Proyect" %>


<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">
      <link href="Recursos/CSS/Proyect.css" rel="stylesheet" />
    <script src="Recursos/JS/TimeDetail.js"></script>
	 <div class="container-fluid" id="divMain" style="margin-top:30px;">
<div class="row">  
<div class="col-md-6 col-md-offset-3" style="padding-right: 0px!important;padding-left: 0px!important;">
	<div class="panel-body" style="padding-right: 4px!important;padding-left: 4px!important;">
	<fieldset  style="display:none;min-width: 0;padding:.35em .625em .75em!important;margin:0 2px;border: 2px solid silver!important;margin-bottom: 10em;box-shadow: -6px 15px 20px 0px;">

<div class="form-group hidden" id="myId1" style="margin-bottom: 0px!important;">
									
									<div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
									<div
										class="col-sm-10 col-md-10 col-lg-10 col-xs-10 input-group">
										
                                            <form action="/" method="post">
         <asp:TextBox cssClass="pryInput" ID="pryTittle" placeholder="Por favor ingrese el titulo del proyecto" runat="server"></asp:TextBox>
                                                 <asp:Literal runat="server" ID="Literal2"></asp:Literal>
                                                <asp:Literal runat="server" ID="Literal1"></asp:Literal>
                                            </form>
									</div>
									<div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
								</div>	


							
										
                                <asp:Button cssClass="btn btn-success submitbtn" ID="SubmitTittle" OnClick="SubmitTittle_Click" runat="server" Text="Button" />
                                <asp:Label runat="server" ID="labelBtn" />
									
									<div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
										
</fieldset>
         <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDWork" DataSourceID="ProyectView" Width="1418px">
             <Columns>
               
                 <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
               
                 <asp:BoundField  Visible="True" DataField="IDWork" HeaderText="IDWork" SortExpression="IDWork" InsertVisible="False" ReadOnly="True" />
                 <asp:BoundField DataField="IDUser" HeaderText="IDUser" SortExpression="IDUser" />
                 <asp:BoundField DataField="IDProyecto" HeaderText="IDProyecto" SortExpression="IDProyecto" />
                 <asp:BoundField DataField="WorkTitle" HeaderText="WorkTitle" SortExpression="WorkTitle" />
                 <asp:BoundField DataField="WorkDate" HeaderText="WorkDate" SortExpression="WorkDate" />
                 <asp:BoundField DataField="CreationDate" HeaderText="CreationDate" SortExpression="CreationDate" />
                 <asp:BoundField DataField="Bemerkungen" HeaderText="Bemerkungen" SortExpression="Bemerkungen" />
                 <asp:BoundField DataField="endDate" HeaderText="endDate" SortExpression="endDate" />
                 <asp:BoundField DataField="duration" HeaderText="duration" SortExpression="duration" />
             </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="ProyectView" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TTTConectionString %>" DeleteCommand="DELETE FROM [Works] WHERE [IDWork] = @original_IDWork AND [IDUser] = @original_IDUser AND [IDProyecto] = @original_IDProyecto AND (([WorkTitle] = @original_WorkTitle) OR ([WorkTitle] IS NULL AND @original_WorkTitle IS NULL)) AND (([WorkDate] = @original_WorkDate) OR ([WorkDate] IS NULL AND @original_WorkDate IS NULL)) AND [CreationDate] = @original_CreationDate AND (([Bemerkungen] = @original_Bemerkungen) OR ([Bemerkungen] IS NULL AND @original_Bemerkungen IS NULL)) AND (([endDate] = @original_endDate) OR ([endDate] IS NULL AND @original_endDate IS NULL)) AND (([duration] = @original_duration) OR ([duration] IS NULL AND @original_duration IS NULL))" InsertCommand="INSERT INTO [Works] ([IDUser], [IDProyecto], [WorkTitle], [WorkDate], [CreationDate], [Bemerkungen], [endDate], [duration]) VALUES (@IDUser, @IDProyecto, @WorkTitle, @WorkDate, @CreationDate, @Bemerkungen, @endDate, @duration)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Works] WHERE ([IDUser] = @IDUser) ORDER BY [CreationDate] DESC" UpdateCommand="UPDATE [Works] SET [IDUser] = @IDUser, [IDProyecto] = @IDProyecto, [WorkTitle] = @WorkTitle, [WorkDate] = @WorkDate, [CreationDate] = @CreationDate, [Bemerkungen] = @Bemerkungen, [endDate] = @endDate, [duration] = @duration WHERE [IDWork] = @original_IDWork AND [IDUser] = @original_IDUser AND [IDProyecto] = @original_IDProyecto AND (([WorkTitle] = @original_WorkTitle) OR ([WorkTitle] IS NULL AND @original_WorkTitle IS NULL)) AND (([WorkDate] = @original_WorkDate) OR ([WorkDate] IS NULL AND @original_WorkDate IS NULL)) AND [CreationDate] = @original_CreationDate AND (([Bemerkungen] = @original_Bemerkungen) OR ([Bemerkungen] IS NULL AND @original_Bemerkungen IS NULL)) AND (([endDate] = @original_endDate) OR ([endDate] IS NULL AND @original_endDate IS NULL)) AND (([duration] = @original_duration) OR ([duration] IS NULL AND @original_duration IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_IDWork" Type="Int64" />
                <asp:Parameter Name="original_IDUser" Type="Int64" />
                <asp:Parameter Name="original_IDProyecto" Type="Int64" />
                <asp:Parameter Name="original_WorkTitle" Type="String" />
                <asp:Parameter Name="original_WorkDate" Type="DateTime" />
                <asp:Parameter Name="original_CreationDate" Type="DateTime" />
                <asp:Parameter Name="original_Bemerkungen" Type="String" />
                <asp:Parameter Name="original_endDate" Type="DateTime" />
                <asp:Parameter Name="original_duration" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="IDUser" Type="Int64" />
                <asp:Parameter Name="IDProyecto" Type="Int64" />
                <asp:Parameter Name="WorkTitle" Type="String" />
                <asp:Parameter Name="WorkDate" Type="DateTime" />
                <asp:Parameter Name="CreationDate" Type="DateTime" />
                <asp:Parameter Name="Bemerkungen" Type="String" />
                <asp:Parameter Name="endDate" Type="DateTime" />
                <asp:Parameter Name="duration" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="IDUser" SessionField="ID" Type="Int64" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="IDUser" Type="Int64" />
                <asp:Parameter Name="IDProyecto" Type="Int64" />
                <asp:Parameter Name="WorkTitle" Type="String" />
                <asp:Parameter Name="WorkDate" Type="DateTime" />
                <asp:Parameter Name="CreationDate" Type="DateTime" />
                <asp:Parameter Name="Bemerkungen" Type="String" />
                <asp:Parameter Name="endDate" Type="DateTime" />
                <asp:Parameter Name="duration" Type="String" />
                <asp:Parameter Name="original_IDWork" Type="Int64" />
                <asp:Parameter Name="original_IDUser" Type="Int64" />
                <asp:Parameter Name="original_IDProyecto" Type="Int64" />
                <asp:Parameter Name="original_WorkTitle" Type="String" />
                <asp:Parameter Name="original_WorkDate" Type="DateTime" />
                <asp:Parameter Name="original_CreationDate" Type="DateTime" />
                <asp:Parameter Name="original_Bemerkungen" Type="String" />
                <asp:Parameter Name="original_endDate" Type="DateTime" />
                <asp:Parameter Name="original_duration" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

</div>
</div>
    </div>
         </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

