<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddPersonenToProyect.aspx.cs" Inherits="AddPersonenToProyect" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">
    <div class="container">
	<div class="row">
		<h2>Agregar personas al proyecto</h2>
	</div>
<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Agregar personas al proyecto</legend>
        <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>

<!-- Text input-->
<div class="form-group">
        <asp:Label ID="LabelPeron" runat="server" Text="Select a person to add a proyect:"></asp:Label>
        <asp:DropDownList ID="DropDownPerson" runat="server" DataSourceID="DSPerson" DataTextField="Mail" DataValueField="ID"></asp:DropDownList>
        <asp:SqlDataSource ID="DSPerson" runat="server" ConnectionString="<%$ ConnectionStrings:TTTConectionString %>" SelectCommand="SELECT [ID], [Mail] FROM [User] WHERE ([ID] &lt;&gt; @ID)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID" SessionField="ID" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="LabelProyect" runat="server" Text="Select a proyect to add a person"></asp:Label>
        <asp:DropDownList ID="DropDownProyect" runat="server" DataSourceID="DSProyect" DataTextField="ProyectName" DataValueField="IDProyecto"></asp:DropDownList>
        <asp:SqlDataSource ID="DSProyect" runat="server" ConnectionString="<%$ ConnectionStrings:TTTConectionString %>" SelectCommand="SELECT [IDProyecto], [ProyectName] FROM [Proyecto] WHERE ([IDUserCreator] = @IDUserCreator) ORDER BY [CreationDate] DESC">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="IDUserCreator" SessionField="ID" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button OnClick="ButtonSend_Click" ID="ButtonSend" runat="server" Text="Enviar" />

 </div>
    </fieldset>
        <asp:GridView ID="GVPersonProyect" runat="server" AutoGenerateColumns="False" DataKeyNames="IDProyecto" DataSourceID="DSProyectss">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="IDUser" HeaderText="IDUser" SortExpression="IDUser" />
                <asp:BoundField DataField="ProyectName" HeaderText="ProyectName" SortExpression="ProyectName" />
                <asp:BoundField DataField="IDProyecto" HeaderText="IDProyecto" InsertVisible="False" ReadOnly="True" SortExpression="IDProyecto" />
            </Columns>
    </asp:GridView>
    <asp:SqlDataSource OnDeleting="DSProyectss_Deleting" ID="DSProyectss" runat="server" ConnectionString="<%$ ConnectionStrings:TTTConectionString %>" 
        ConflictDetection="CompareAllValues" 
        OldValuesParameterFormatString="original_{0}"
        DeleteCommand="DELETE FROM [User_Proyect] Where IDUser = @original_IDUser  AND [IDProyect] = @original_IDProyecto" 
        SelectCommand="SELECT User_Proyect.IDUser,Proyecto.ProyectName,Proyecto.IDProyecto FROM User_Proyect INNER JOIN Proyecto ON User_Proyect.IDProyect = Proyecto.IDProyecto WHERE User_Proyect.IDUser = @UserID OR ((Proyecto.[IDUserCreator] = @UserID ) AND (Proyecto.[IsAktiv] = @Aktiv))">
        <DeleteParameters>
             <asp:Parameter Name="original_IDUser" Type="Int64" />
             <asp:Parameter Name="original_IDProyecto" Type="Int64" />            
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="UserID" SessionField="ID" />
            <asp:SessionParameter DefaultValue="1" Name="Aktiv" SessionField="IsAktivDefaultMode" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
</asp:Content>

