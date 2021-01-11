<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="okta_aspnet_webforms_example.Login" %>
<script src="https://global.oktacdn.com/okta-signin-widget/5.2.0/js/okta-sign-in.min.js" type="text/javascript"></script>
<link href="https://global.oktacdn.com/okta-signin-widget/5.2.0/css/okta-sign-in.min.css" type="text/css" rel="stylesheet" />
<script src="Scripts/jquery-3.4.1.min.js" type="text/javascript"></script>

<div id="widget"></div>

<form method="POST" action="Login.aspx">
    <input type="hidden" name="sessionToken" id="hiddenSessionTokenField" />
</form>

<script type="text/javascript">
    var oktaDomain = '<%= System.Configuration.ConfigurationManager.AppSettings["okta:oktaDomain"].ToString() %>';

    var signIn = new OktaSignIn({
        baseUrl: oktaDomain
    });

    signIn.renderEl({ el: '#widget' }, (res) => {
        var sessionTokenField = $("#hiddenSessionTokenField");
        sessionTokenField.val(res.session.token);
        var form = sessionTokenField.parent();
        form.submit();
    }, (err) => {
        console.error(err);
        });
</script>
