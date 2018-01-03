<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<script src="Recursos/JS/jquery-3.2.1.min.js"></script>
	<script src="Recursos/JS/bootstrap.min.js"></script>
	<link href="Recursos/CSS/bootstrap.min.css" rel="stylesheet" />
	<style>
    body{
	    padding-top:50px;
	    background-color: #EFEFEF;
    }
    .login {
	    background: white; /* For browsers that do not support gradients */
	    background: -webkit-linear-gradient(bottom,rgba(50,50,50,0),rgba(50,50,50,1)); /*Safari 5.1-6*/
	    background: -o-linear-gradient(top,rgba(50,50,50,0),rgba(50,50,50,1)); /*Opera 11.1-12*/
	    background: -moz-linear-gradient(top,rgba(50,50,50,0),rgba(50,50,50,1)); /*Fx 3.6-15*/
	    background: linear-gradient(to top, rgba(50,50,50,0), rgba(50,50,50,1)); /*Standard*/

	    /*box-shadow: 0 8px 15px 0 rgba(0, 0, 10, 0.2), 0 6px 20px 0 rgba(0, 0, 10, 0.19);*/
	    box-shadow:-10px 10px 5px grey;
	    color: #b3ff1a;
	    font-size: 18px;
    }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">
	<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4 login">
			<h1 class="text-center"><i class="glyphicon glyphicon-user"></i> Login</h1>
			<hr>
			
			<form>
			  <div class="form-group">
				<label for="exampleInputEmail1">Email address</label>
                  <asp:TextBox ID="txtLogin" CssClass="form-control" runat="server" MaxLength="20" Width="200px"  placeholder="Email">
                </asp:TextBox>
			  </div>
			  <div class="form-group">
				<label for="exampleInputPassword1">Password</label>
                <asp:TextBox ID="txtPasswort" CssClass="form-control" runat="server" MaxLength="20" Width="200px" TextMode="Password" placeholder="Password">
                </asp:TextBox>
			  </div>
			  <div class="checkbox">
				<label>
				  <asp:Label ID="label1" runat=server></asp:Label>
				</label>
			  </div>
				<div class="btn-group btn-group-justified" role="group" aria-label="...">
				  <div class="btn-group" role="group">
                    <asp:Button ID="Button1" onclick="Button1_Click1" runat="server" Text="Register" />
				  </div>
				  <div class="btn-group" role="group">
					<asp:Button ID="Button2" onclick="Button2_Click" runat="server" Text="Anmelden" CssClass="btn btn-primary"/> 
				  </div>
				</div>
			</form>
			<hr>
		</div>
	</div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

