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

<div id="wrapper">

    <!-- Navigation -->
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <i class="fa fa-bars" aria-hidden="true" style="color: white;"></i>
            </button>
            <div class="navbar-brand">   
            </div>
        </div>

        <form action="" class="navbar-form navbar-left">
            <div class="input-group">
              <div class="input-group-btn">
                  <button class="btn  search-btn-icon">
                   <i class="fa fa-search" aria-hidden="true"></i>                  
                  </button>
               </div>
              <input type="Search" placeholder="Search Client" class="form-control-serch search-box" />   
            </div>     
        </form>

        <!-- Top Menu Items -->
        <div class="items">
          <ul class="nav navbar-right top-nav">        
            <li class="editpro">
              <i class="fasett fa-cog" aria-hidden="true" class="menu-button" id="menu-button"></i> 
              <h5 class="pull-left login-person-head">Welcome WaLiA SaAB</h5> 
            </li>
          </ul>
        </div>

        <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
        <div class="collapse navbar-collapse navbar-ex1-collapse" style="background-color: #616060; border:1px solid #616060;">
            <ul class="nav navbar-nav side-nav">
              <a href="#"><img class="logostyle" src="https://vignette.wikia.nocookie.net/nationstates/images/2/29/WS_Logo.png/revision/latest?cb=20080507063620" alt="LOGO""></a>
                <li id="Main">
                   <a class="active" href="/Main.aspx" data-toggle="collapse" data-target="#submenu-1"><i class="fa fa-home" aria-hidden="true"></i>   <span style="color:white;">  Home </span></a>
                </li>
                <li id="Client">
                    <a class="#" href="/Client.aspx" data-toggle="collapse" data-target="#submenu-1"><i class="fa fa-user-o" aria-hidden="true"></i>   <span style="color:white;">  Add/Modify Client </span></a>
                </li>
                
                <li id="Logout">
                    <a class="#" href="/logout.aspx" data-toggle="collapse" data-target="#submenu-1"><i class="fa fa-man" aria-hidden="true"></i>   <span style="color:white;"> Logout </span></a>
                </li>
                <!--
                <li>
                    <a class="#" href="#" data-toggle="collapse" data-target="#submenu-1"><i class="fa fa-envelope" aria-hidden="true"></i>  <span style="color:white;"> Messages </span></a>
                </li>
                <li>
                    <a class="#" href="#" data-toggle="collapse" data-target="#submenu-1"><i class="fa fa-cogs" aria-hidden="true"></i>   <span style="color:white;"> Settings </span></a>
                </li>
                -->
            </ul>
        </div>
        <!-- /.navbar-collapse -->
  </nav>


<div class="container-fluid">
<div class="row text-center">
<div class="col-md-12 dashhead">
<h1> Welcome To </h1><asp:Label ID="Email" runat="server" />
</div>
</div>
</div>

  </div><!-- /#wrapper -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

