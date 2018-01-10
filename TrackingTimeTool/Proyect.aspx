<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Proyect.aspx.cs" Inherits="Proyect" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link href="Recursos/CSS/Proyect.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">
	 <div class="container-fluid" id="divMain" style="margin-top:30px;">
<div class="row">  
<div class="col-md-6 col-md-offset-3" style="padding-right: 0px!important;padding-left: 0px!important;">
	<div class="panel-body" style="padding-right: 4px!important;padding-left: 4px!important;">
<form class="form-horizontal" method="post" id="AddProyect" name="login" role="form"  action="/addProyect.aspx" AUTOCOMPLETE="off">
	<fieldset  style="min-width: 0;padding:.35em .625em .75em!important;margin:0 2px;border: 2px solid silver!important;margin-bottom: 10em;box-shadow: -6px 15px 20px 0px;">

<div class="form-group hidden" id="myId1" style="margin-bottom: 0px!important;">
									
									<div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
									<div
										class="col-sm-10 col-md-10 col-lg-10 col-xs-10 input-group">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-lock" style="color: black;"></span></span> <input
											type="password" class="form-control" id="password"
											style="width: 100%;" placeholder="Enter your Password"><span
											class="input-group-btn">
											
										</span>
									</div>
									<div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
								</div>	


							
										<button id="submitbtn" type="submit"
											class="btn btn-success"
											onClick="javascript:return loginStatus();"
											style=" font-size: 13px;">
											Login</button>

									
									<div class="col-sm-1 col-md-1 col-lg-1 col-xs-1"></div>
										
</fieldset>
</form>
</div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

