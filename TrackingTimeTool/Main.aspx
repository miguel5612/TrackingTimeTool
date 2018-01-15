<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Recursos/CSS/bootstrap.min.css" rel="stylesheet" />
    <script src="Recursos/JS/jquery-3.2.1.min.js"></script>
    <script src="Recursos/JS/bootstrap.min.js"></script>
    <link href="Recursos/Fonts/font-awesome.min.css" rel="stylesheet" />
    <script src="Recursos/JS/holder.min.js"></script>
    <script src="Recursos/JS/ie10-viewport-bug-workaround.js"></script>    
    <link href="Recursos/CSS/Main.css" rel="stylesheet" />
    <script src="Recursos/JS/Main.js"></script>
    <style>
        input[id*=ProyectNameTextBox]{
            font-size: 24px;
        }
        #hiddenUpdateToEndTime {
            margin-left: 1036px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">
    
    <div class="container-fluid">
<div class="row text-center">
<div class="col-md-12 dashhead">
<h1> Bienvenido <asp:Label ID="Email" runat="server" />!</h1>
 <div class="">
     <div runat="server" id="containerImage"  onClick="stopStart(); return false" >   <img class="buttonPlay" id="imgBtnPlay" src="Recursos/IMG/play-button.svg"></img> </div>
     <asp:Label Text="" ID="labelPlay" runat="server" />
     
     <input type="text" style="display:none" id="HFCreationDate" />
     <input type="text" style="display:none" id="HFWorkDate" />
     <div id="HFCountingDiv">
     <asp:TextBox ID="count" runat="server"></asp:TextBox>
     <asp:TextBox ID="countTimeStart" runat="server"></asp:TextBox>
     <asp:TextBox ID="countTimeEnd" runat="server"></asp:TextBox>     
     <asp:TextBox ID="duration" runat="server"></asp:TextBox>

     <asp:TextBox class="IDUser" style="display:none" ID="HFIDUser" runat="server"></asp:TextBox>
     <asp:Label ID="timeStartStop" cssClass="time" runat="server" Text="Label"></asp:Label>
         </div>
     <div id="GV1Container">
         <asp:GridView ID="GridView1" CssClass="GV1" runat="server" DataSourceID="DS1" AutoGenerateColumns="False" AllowPaging="True">
             <Columns>
                 <asp:BoundField DataField="WorkTitle" HeaderText="Titulo del trabajo" SortExpression="WorkTitle" />
                 <asp:BoundField DataField="ProyectName" HeaderText="Nombre del proyecto" SortExpression="ProyectName" />
                 <asp:BoundField DataField="CreationDate" HeaderText="Fecha de creacion" SortExpression="CreationDate" />
                 <asp:BoundField DataField="endDate" HeaderText="Fecha de finalizacion" SortExpression="endDate" />
                 <asp:BoundField DataField="duration" HeaderText="Duracion" SortExpression="duration" />
             </Columns>
         </asp:GridView>
     </div>
     <div id="GV2Container">
     <asp:GridView cssClass="GV2" ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="DS2">
         <Columns>
             <asp:BoundField DataField="ProyectName" HeaderText="Nombre de tu proyecto" SortExpression="ProyectName" />
             <asp:BoundField DataField="HourCost" HeaderText="Costo de cada hora de trabajo" SortExpression="HourCost" />
             <asp:BoundField DataField="CreationDate" HeaderText="Fecha de creacion del proyecto" SortExpression="CreationDate" />
             <asp:CheckBoxField DataField="IsAktiv" HeaderText="Esta en funcionamiento?" SortExpression="IsAktiv" />
         </Columns>
     </asp:GridView>
     <div id="hiddenInsert">
    
     <div id="hiddenUpdateToEndTime">
         <asp:SqlDataSource ID="updateDataSource" OnUpdated ="updateDataSource_Updated" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TTTConectionString %>" DeleteCommand="DELETE FROM [Works] WHERE [IDWork] = @original_IDWork AND [IDUser] = @original_IDUser AND [IDProyecto] = @original_IDProyecto AND (([WorkTitle] = @original_WorkTitle) OR ([WorkTitle] IS NULL AND @original_WorkTitle IS NULL)) AND (([WorkDate] = @original_WorkDate) OR ([WorkDate] IS NULL AND @original_WorkDate IS NULL)) AND [CreationDate] = @original_CreationDate AND (([Bemerkungen] = @original_Bemerkungen) OR ([Bemerkungen] IS NULL AND @original_Bemerkungen IS NULL)) AND (([endDate] = @original_endDate) OR ([endDate] IS NULL AND @original_endDate IS NULL)) AND (([duration] = @original_duration) OR ([duration] IS NULL AND @original_duration IS NULL))" InsertCommand="INSERT INTO [Works] ([IDUser], [IDProyecto], [WorkTitle], [WorkDate], [CreationDate], [Bemerkungen], [endDate], [duration]) VALUES (@IDUser, @IDProyecto, @WorkTitle, @WorkDate, @CreationDate, @Bemerkungen, @endDate, @duration)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Works] WHERE ([IDWork] = @IDWork)" UpdateCommand="UPDATE [Works] SET [IDUser] = @IDUser, [IDProyecto] = @IDProyecto, [WorkTitle] = @WorkTitle, [WorkDate] = @WorkDate, [CreationDate] = @CreationDate, [Bemerkungen] = @Bemerkungen, [endDate] = @endDate, [duration] = @duration WHERE [IDWork] = @original_IDWork AND [IDUser] = @original_IDUser AND [IDProyecto] = @original_IDProyecto AND (([WorkTitle] = @original_WorkTitle) OR ([WorkTitle] IS NULL AND @original_WorkTitle IS NULL)) AND (([WorkDate] = @original_WorkDate) OR ([WorkDate] IS NULL AND @original_WorkDate IS NULL)) AND [CreationDate] = @original_CreationDate AND (([Bemerkungen] = @original_Bemerkungen) OR ([Bemerkungen] IS NULL AND @original_Bemerkungen IS NULL)) AND (([endDate] = @original_endDate) OR ([endDate] IS NULL AND @original_endDate IS NULL)) AND (([duration] = @original_duration) OR ([duration] IS NULL AND @original_duration IS NULL))">
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
                 <asp:SessionParameter Name="IDWork" SessionField="ActualTime" Type="Int64" DefaultValue="0" />
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
         <div id="divFormViewInsertUpdate">
     <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert" DataKeyNames="IDWork" DataSourceID="TimesFormView">
         <EditItemTemplate>
             IDWork:
             <asp:Label ID="IDWorkLabel1" runat="server" Text='<%# Eval("IDWork") %>' />
             <br />
             IDUser:
             <asp:TextBox ID="IDUserTextBox" runat="server" Text='<%# Bind("IDUser") %>' />
             <br />
             IDProyecto:
             <asp:TextBox ID="IDProyectoTextBox" runat="server" Text='<%# Bind("IDProyecto") %>' />
             <br />
             WorkTitle:
             <asp:TextBox ID="WorkTitleTextBox" runat="server" Text='<%# Bind("WorkTitle") %>' />
             <br />
             WorkDate:
             <asp:TextBox ID="WorkDateTextBox" runat="server" Text='<%# Bind("WorkDate") %>' />
             <br />
             CreationDate:
             <asp:TextBox ID="CreationDateTextBox" runat="server" Text='<%# Bind("CreationDate") %>' />
             <br />
             Bemerkungen:
             <asp:TextBox ID="BemerkungenTextBox" runat="server" Text='<%# Bind("Bemerkungen") %>' />
             <br />
             endDate:
             <asp:TextBox ID="endDateTextBox" runat="server" Text='<%# Bind("endDate") %>' />
             <br />
             duration:
             <asp:TextBox ID="durationTextBox" runat="server" Text='<%# Bind("duration") %>' />
             <br />
             <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
             &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
         </EditItemTemplate>
         <InsertItemTemplate>
             IDUser:
             <asp:TextBox ID="IDUserTextBox" runat="server" Text='<%# Bind("IDUser") %>' />
             <br />
             IDProyecto:
             <asp:TextBox ID="IDProyectoTextBox" runat="server" Text='<%# Bind("IDProyecto") %>' />
             <br />
             WorkTitle:
             <asp:TextBox ID="WorkTitleTextBox" runat="server" Text='<%# Bind("WorkTitle") %>' />
             <br />
             WorkDate:
             <asp:TextBox ID="WorkDateTextBox" runat="server" Text='<%# Bind("WorkDate") %>' />
             <br />
             CreationDate:
             <asp:TextBox ID="CreationDateTextBox" runat="server" Text='<%# Bind("CreationDate") %>' />
             <br />
             Bemerkungen:
             <asp:TextBox ID="BemerkungenTextBox" runat="server" Text='<%# Bind("Bemerkungen") %>' />
             <br />
             endDate:
             <asp:TextBox ID="endDateTextBox" runat="server" Text='<%# Bind("endDate") %>' />
             <br />
             duration:
             <asp:TextBox ID="durationTextBox" runat="server" Text='<%# Bind("duration") %>' />
             <br />
             <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
             &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
         </InsertItemTemplate>
         <ItemTemplate>
             IDWork:
             <asp:Label ID="IDWorkLabel" runat="server" Text='<%# Eval("IDWork") %>' />
             <br />
             IDUser:
             <asp:Label ID="IDUserLabel" runat="server" Text='<%# Bind("IDUser") %>' />
             <br />
             IDProyecto:
             <asp:Label ID="IDProyectoLabel" runat="server" Text='<%# Bind("IDProyecto") %>' />
             <br />
             WorkTitle:
             <asp:Label ID="WorkTitleLabel" runat="server" Text='<%# Bind("WorkTitle") %>' />
             <br />
             WorkDate:
             <asp:Label ID="WorkDateLabel" runat="server" Text='<%# Bind("WorkDate") %>' />
             <br />
             CreationDate:
             <asp:Label ID="CreationDateLabel" runat="server" Text='<%# Bind("CreationDate") %>' />
             <br />
             Bemerkungen:
             <asp:Label ID="BemerkungenLabel" runat="server" Text='<%# Bind("Bemerkungen") %>' />
             <br />
             endDate:
             <asp:Label ID="endDateLabel" runat="server" Text='<%# Bind("endDate") %>' />
             <br />
             duration:
             <asp:Label ID="durationLabel" runat="server" Text='<%# Bind("duration") %>' />
             <br />
             <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
             &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
             &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
         </ItemTemplate>
     </asp:FormView>
         <asp:FormView ID="FormViewUpdate" runat="server" DefaultMode="Edit" DataKeyNames="IDWork" DataSourceID="updateDataSource">
             <EditItemTemplate>
                 IDWork:
                 <asp:Label ID="IDWorkLabel1" runat="server" Text='<%# Eval("IDWork") %>' />
                 <br />
                 IDUser:
                 <asp:TextBox ID="IDUserTextBox" runat="server" Text='<%# Bind("IDUser") %>' />
                 <br />
                 IDProyecto:
                 <asp:TextBox ID="IDProyectoTextBox" runat="server" Text='<%# Bind("IDProyecto") %>' />
                 <br />
                 WorkTitle:
                 <asp:TextBox ID="WorkTitleTextBox" runat="server" Text='<%# Bind("WorkTitle") %>' />
                 <br />
                 WorkDate:
                 <asp:TextBox ID="WorkDateTextBox" runat="server" Text='<%# Bind("WorkDate") %>' />
                 <br />
                 CreationDate:
                 <asp:TextBox ID="CreationDateTextBox" runat="server" Text='<%# Bind("CreationDate") %>' />
                 <br />
                 Bemerkungen:
                 <asp:TextBox ID="BemerkungenTextBox" runat="server" Text='<%# Bind("Bemerkungen") %>' />
                 <br />
                 endDate:
                 <asp:TextBox ID="endDateTextBox" runat="server" Text='<%# Bind("endDate") %>' />
                 <br />
                 duration:
                 <asp:TextBox ID="durationTextBox" runat="server" Text='<%# Bind("duration") %>' />
                 <br />
                 <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                 &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
             </EditItemTemplate>
             <InsertItemTemplate>
                 IDUser:
                 <asp:TextBox ID="IDUserTextBox" runat="server" Text='<%# Bind("IDUser") %>' />
                 <br />
                 IDProyecto:
                 <asp:TextBox ID="IDProyectoTextBox" runat="server" Text='<%# Bind("IDProyecto") %>' />
                 <br />
                 WorkTitle:
                 <asp:TextBox ID="WorkTitleTextBox" runat="server" Text='<%# Bind("WorkTitle") %>' />
                 <br />
                 WorkDate:
                 <asp:TextBox ID="WorkDateTextBox" runat="server" Text='<%# Bind("WorkDate") %>' />
                 <br />
                 CreationDate:
                 <asp:TextBox ID="CreationDateTextBox" runat="server" Text='<%# Bind("CreationDate") %>' />
                 <br />
                 Bemerkungen:
                 <asp:TextBox ID="BemerkungenTextBox" runat="server" Text='<%# Bind("Bemerkungen") %>' />
                 <br />
                 endDate:
                 <asp:TextBox ID="endDateTextBox" runat="server" Text='<%# Bind("endDate") %>' />
                 <br />
                 duration:
                 <asp:TextBox ID="durationTextBox" runat="server" Text='<%# Bind("duration") %>' />
                 <br />
                 <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                 &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
             </InsertItemTemplate>
             <ItemTemplate>
                 IDWork:
                 <asp:Label ID="IDWorkLabel" runat="server" Text='<%# Eval("IDWork") %>' />
                 <br />
                 IDUser:
                 <asp:Label ID="IDUserLabel" runat="server" Text='<%# Bind("IDUser") %>' />
                 <br />
                 IDProyecto:
                 <asp:Label ID="IDProyectoLabel" runat="server" Text='<%# Bind("IDProyecto") %>' />
                 <br />
                 WorkTitle:
                 <asp:Label ID="WorkTitleLabel" runat="server" Text='<%# Bind("WorkTitle") %>' />
                 <br />
                 WorkDate:
                 <asp:Label ID="WorkDateLabel" runat="server" Text='<%# Bind("WorkDate") %>' />
                 <br />
                 CreationDate:
                 <asp:Label ID="CreationDateLabel" runat="server" Text='<%# Bind("CreationDate") %>' />
                 <br />
                 Bemerkungen:
                 <asp:Label ID="BemerkungenLabel" runat="server" Text='<%# Bind("Bemerkungen") %>' />
                 <br />
                 endDate:
                 <asp:Label ID="endDateLabel" runat="server" Text='<%# Bind("endDate") %>' />
                 <br />
                 duration:
                 <asp:Label ID="durationLabel" runat="server" Text='<%# Bind("duration") %>' />
                 <br />
                 <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                 &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                 &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
             </ItemTemplate>
         </asp:FormView>
             </div>
     <asp:SqlDataSource OnInserted="TimesFormView_Inserted" ID="TimesFormView" runat="server" ConflictDetection="CompareAllValues" 
         ConnectionString="<%$ ConnectionStrings:TTTConectionString %>" 
         DeleteCommand="DELETE FROM [Works] WHERE [IDWork] = @original_IDWork AND [IDUser] = @original_IDUser AND [IDProyecto] = @original_IDProyecto AND (([WorkTitle] = @original_WorkTitle) OR ([WorkTitle] IS NULL AND @original_WorkTitle IS NULL)) AND (([WorkDate] = @original_WorkDate) OR ([WorkDate] IS NULL AND @original_WorkDate IS NULL)) AND [CreationDate] = @original_CreationDate AND (([Bemerkungen] = @original_Bemerkungen) OR ([Bemerkungen] IS NULL AND @original_Bemerkungen IS NULL)) AND (([endDate] = @original_endDate) OR ([endDate] IS NULL AND @original_endDate IS NULL))" 
         InsertCommand="INSERT INTO [Works] ([IDUser], [IDProyecto], [WorkTitle], [WorkDate], [CreationDate], [Bemerkungen], [endDate]) VALUES (@IDUser, @IDProyecto, @WorkTitle, @WorkDate, @CreationDate, @Bemerkungen, @endDate);SELECT @ID = SCOPE_IDENTITY() " 
         OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Works] WHERE ([IDUser] = @IDUser)" 
         UpdateCommand="UPDATE Works SET IDUser = @IDUser, IDProyecto = @IDProyecto, WorkTitle = @WorkTitle, WorkDate = @WorkDate, CreationDate = @CreationDate, Bemerkungen = @Bemerkungen, endDate = @endDate, duration = @duration WHERE (IDWork = @original_IDWork) AND (IDUser = @original_IDUser) AND (IDProyecto = @original_IDProyecto) AND (WorkTitle = @original_WorkTitle OR WorkTitle IS NULL AND @original_WorkTitle IS NULL) AND (WorkDate = @original_WorkDate OR WorkDate IS NULL AND @original_WorkDate IS NULL) AND (CreationDate = @original_CreationDate) AND (Bemerkungen = @original_Bemerkungen OR Bemerkungen IS NULL AND @original_Bemerkungen IS NULL) AND (endDate = @original_endDate OR endDate IS NULL AND @original_endDate IS NULL)">
         <DeleteParameters>
             <asp:Parameter Name="original_IDWork" Type="Int64" />
             <asp:Parameter Name="original_IDUser" Type="Int64" />
             <asp:Parameter Name="original_IDProyecto" Type="Int64" />
             <asp:Parameter Name="original_WorkTitle" Type="String" />
             <asp:Parameter Name="original_WorkDate" Type="DateTime" />
             <asp:Parameter Name="original_CreationDate" Type="DateTime" />
             <asp:Parameter Name="original_Bemerkungen" Type="String" />
             <asp:Parameter Name="original_endDate" Type="DateTime" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="IDUser" Type="Int64" />
             <asp:Parameter Name="IDProyecto" Type="Int64" />
             <asp:Parameter Name="WorkTitle" Type="String" />
             <asp:Parameter Name="WorkDate" Type="DateTime" />
             <asp:Parameter Name="CreationDate" Type="DateTime" />
             <asp:Parameter Name="Bemerkungen" Type="String" />
             <asp:Parameter Name="endDate" Type="DateTime" />
             <asp:Parameter Name="ID" Direction="Output" Type="Int64" />
         </InsertParameters>
         <SelectParameters>
             <asp:SessionParameter Name="IDUser" SessionField="ID" Type="Int64" />
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
     <asp:SqlDataSource ID="DS2" runat="server" ConnectionString="<%$ ConnectionStrings:TTTConectionString %>" SelectCommand="SELECT [ProyectName], [HourCost], [CreationDate], [IsAktiv] FROM [Proyecto] WHERE ([IDUserCreator] = @IDUserCreator) ORDER BY [CreationDate] DESC">
         <SelectParameters>
             <asp:SessionParameter Name="IDUserCreator" SessionField="ID" Type="Int64" />
         </SelectParameters>
     </asp:SqlDataSource>

     <asp:SqlDataSource ID="DS1" runat="server" ConnectionString="<%$ ConnectionStrings:TTTConectionString %>" SelectCommand="SELECT [dbo].[Works].*,[dbo].[Proyecto].ProyectName FROM [dbo].[Works] INNER JOIN [dbo].[Proyecto] ON [dbo].[Works].IDProyecto=[dbo].[Proyecto].IDProyecto WHERE ([IDUser] = @IDUser) ORDER BY [CreationDate] DESC">
         <SelectParameters>
             <asp:SessionParameter DefaultValue="0" Name="IDUser" SessionField="ID" Type="Int64" />
         </SelectParameters>
     </asp:SqlDataSource>
     <asp:SqlDataSource ID="ConsultaTiempos" runat="server"></asp:SqlDataSource>
     <div style="margin-top: 250px;">
     </div>
 </div>
</div>
</div>
</div>
    <asp:HiddenField runat="server" ID="IDCount" />
  <!--</div> /#wrapper -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

