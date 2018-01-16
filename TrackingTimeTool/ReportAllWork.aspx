<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReportAllWork.aspx.cs" Inherits="ReportAllWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Recursos/CSS/ReportAll.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">
    <div class="select">

      <asp:DropDownList ID="DropDownPerson" runat="server" DataSourceID="DSPerson" DataTextField="ProyectName" DataValueField="IDProyecto"></asp:DropDownList>
        <asp:SqlDataSource ID="DSPerson" runat="server" ConnectionString="<%$ ConnectionStrings:TTTConectionString %>" 
            SelectCommand="Select ProyectName, IDProyecto
                FROM (
	             (SELECT Proyecto.ProyectName AS ProyectName,Proyecto.IDProyecto AS IDProyecto FROM User_Proyect INNER JOIN Proyecto ON User_Proyect.IDProyect = Proyecto.IDProyecto WHERE User_Proyect.IDUser = @ID) union all 
	             (SELECT ProyectName, IDProyecto FROM Proyecto WHERE IDUserCreator = @ID )
	             ) t
                ">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID" SessionField="ID" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>


     
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

