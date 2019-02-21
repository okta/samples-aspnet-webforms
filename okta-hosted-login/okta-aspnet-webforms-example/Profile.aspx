<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Profile.aspx.cs" Inherits="okta_aspnet_webforms_example.Profile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>View Claims</h2>
    <asp:GridView runat="server" ID="GridViewClaims"></asp:GridView>
</asp:Content>
