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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">

  <div id="throbber" style="display:none; min-height:120px;"></div>
<div id="noty-holder"></div>



<div class="container-fluid">
<div class="row text-center">
<div class="col-md-12 dashhead">
<h1> Welcome To </h1><asp:Label ID="Email" runat="server" />
 <div class="">
     <div runat="server" id="containerImage">   <img class="buttonPlay" id="imgBtnPlay" src="Recursos/IMG/play-button.svg" onclick="Timer()"></img> </div>
     <asp:Label Text="" ID="labelPlay" runat="server" />
     <asp:GridView ID="GridView1" runat="server" DataSourceID="DS1">
     </asp:GridView>
     <asp:SqlDataSource ID="DS1" runat="server" ConnectionString="<%$ ConnectionStrings:TTTConectionString %>" SelectCommand="SELECT [WorkTitle], [WorkDate], [Bemerkungen], [CreationDate] FROM [Works] WHERE ([IDUser] = @IDUser)">
         <SelectParameters>
             <asp:SessionParameter DefaultValue="Null" Name="IDUser" SessionField="ID" Type="Int64" />
         </SelectParameters>
     </asp:SqlDataSource>
     <asp:SqlDataSource ID="ConsultaTiempos" runat="server"></asp:SqlDataSource>

 </div>
</div>
</div>
</div>

  <!--</div> /#wrapper -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

