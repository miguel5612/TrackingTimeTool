<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Proyect.aspx.cs" Inherits="Proyect" %>


<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">
      <link href="Recursos/CSS/Proyect.css" rel="stylesheet" />
    <script src="Recursos/JS/Proyect.js"></script>
	 <div class="container-fluid" id="divMain" style="margin-top:30px;">
<div class="row">  
<div class="col-md-6 col-md-offset-3" style="padding-right: 0px!important;padding-left: 0px!important;">
	<div class="panel-body" style="padding-right: 4px!important;padding-left: 4px!important;">
	<fieldset  style="min-width: 0;padding:.35em .625em .75em!important;margin:0 2px;border: 2px solid silver!important;margin-bottom: 10em;box-shadow: -6px 15px 20px 0px;">

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
         <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDProyecto" DataSourceID="ProyectView" Width="1418px">
             <Columns>
                 <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
               
                 <asp:TemplateField HeaderText="IDProyecto" InsertVisible="False" SortExpression="IDProyecto">
                     <EditItemTemplate>
                         <asp:Label ID="HFTPROYECT" runat="server" Text='<%# Eval("IDProyecto") %>'></asp:Label>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="HFIDPROYECT" runat="server" Text='<%# Bind("IDProyecto") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="IDUserCreator" InsertVisible="False" SortExpression="IDUserCreator">
                     <EditItemTemplate>
                         <asp:TextBox ID="HFTUSERCREATOR" runat="server" Text='<%# Bind("IDUserCreator") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="HFUSERCREATOR" runat="server" Text='<%# Bind("IDUserCreator") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="CreationDate" SortExpression="CreationDate">
                     <EditItemTemplate>
                         <asp:TextBox ID="HFTCREATIONDATE" runat="server" Text='<%# Bind("CreationDate") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="HFCREATIONDATE" runat="server" Text='<%# Bind("CreationDate") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
               
                 <asp:BoundField  Visible="True" DataField="ProyectName" HeaderText="Nombre del proyecto" SortExpression="ProyectName" />
                 <asp:BoundField DataField="HourCost" HeaderText="Costo de cada hora de trabajo" SortExpression="HourCost" />
                 <asp:CheckBoxField DataField="IsAktiv" HeaderText="Activo" SortExpression="IsAktiv" />
             </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="ProyectView" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TTTConectionString %>" DeleteCommand="DELETE FROM [Proyecto] WHERE [IDProyecto] = @original_IDProyecto AND [IDUserCreator] = @original_IDUserCreator AND [CreationDate] = @original_CreationDate AND (([ProyectName] = @original_ProyectName) OR ([ProyectName] IS NULL AND @original_ProyectName IS NULL)) AND (([HourCost] = @original_HourCost) OR ([HourCost] IS NULL AND @original_HourCost IS NULL)) AND (([IsAktiv] = @original_IsAktiv) OR ([IsAktiv] IS NULL AND @original_IsAktiv IS NULL))" InsertCommand="INSERT INTO [Proyecto] ([IDUserCreator], [CreationDate], [ProyectName], [HourCost], [IsAktiv]) VALUES (@IDUserCreator, @CreationDate, @ProyectName, @HourCost, @IsAktiv)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Proyecto] WHERE ([IDUserCreator] = @IDUserCreator) ORDER BY [CreationDate] DESC" UpdateCommand="UPDATE [Proyecto] SET [IDUserCreator] = @IDUserCreator, [CreationDate] = @CreationDate, [ProyectName] = @ProyectName, [HourCost] = @HourCost, [IsAktiv] = @IsAktiv WHERE [IDProyecto] = @original_IDProyecto AND [IDUserCreator] = @original_IDUserCreator AND [CreationDate] = @original_CreationDate AND (([ProyectName] = @original_ProyectName) OR ([ProyectName] IS NULL AND @original_ProyectName IS NULL)) AND (([HourCost] = @original_HourCost) OR ([HourCost] IS NULL AND @original_HourCost IS NULL)) AND (([IsAktiv] = @original_IsAktiv) OR ([IsAktiv] IS NULL AND @original_IsAktiv IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_IDProyecto" Type="Int64" />
                <asp:Parameter Name="original_IDUserCreator" Type="Int64" />
                <asp:Parameter Name="original_CreationDate" Type="DateTime" />
                <asp:Parameter Name="original_ProyectName" Type="String" />
                <asp:Parameter Name="original_HourCost" Type="Double" />
                <asp:Parameter Name="original_IsAktiv" Type="Boolean" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="IDUserCreator" Type="Int64" />
                <asp:Parameter Name="CreationDate" Type="DateTime" />
                <asp:Parameter Name="ProyectName" Type="String" />
                <asp:Parameter Name="HourCost" Type="Double" />
                <asp:Parameter Name="IsAktiv" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="IDUserCreator" SessionField="ID" Type="Int64" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="IDUserCreator" Type="Int64" />
                <asp:Parameter Name="CreationDate" Type="DateTime" />
                <asp:Parameter Name="ProyectName" Type="String" />
                <asp:Parameter Name="HourCost" Type="Double" />
                <asp:Parameter Name="IsAktiv" Type="Boolean" />
                <asp:Parameter Name="original_IDProyecto" Type="Int64" />
                <asp:Parameter Name="original_IDUserCreator" Type="Int64" />
                <asp:Parameter Name="original_CreationDate" Type="DateTime" />
                <asp:Parameter Name="original_ProyectName" Type="String" />
                <asp:Parameter Name="original_HourCost" Type="Double" />
                <asp:Parameter Name="original_IsAktiv" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>

</div>
</div>
    </div>
         </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

