<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="okta_aspnet_webforms_example.Login" %>
<script src="https://global.oktacdn.com/okta-signin-widget/3.1.6/js/okta-sign-in.min.js" type="text/javascript"></script>
<link href="https://global.oktacdn.com/okta-signin-widget/3.1.6/css/okta-sign-in.min.css" type="text/css" rel="stylesheet" />
<link href="Content/okta-login.css" type="text/css" rel="stylesheet" />
<script src="Scripts/jquery-3.4.1.min.js" type="text/javascript"></script>

<div id="widget"></div>

<form method="POST" action="Login.aspx">
    <input type="hidden" name="sessionToken" id="hiddenSessionTokenField" />
</form>

<script type="text/javascript">
    
    var signIn = new OktaSignIn({
        baseUrl: '<%= System.Configuration.ConfigurationManager.AppSettings["okta:oktaDomain"].ToString() %>',
        customButtons: [{
                title: 'Sign in with Facebook',
                className: 'social-auth-button social-auth-facebook-button link-button',
                click: function() {
                    window.location.href = '/Login.aspx?idp=<%= System.Configuration.ConfigurationManager.AppSettings["okta:FacebookIdp"] %>';
                }
            },
            {
                title: 'Sign in with Google',
                className: 'social-auth-button social-auth-google-button link-button',
                click: function() {
                    window.location.href = '/Login.aspx?idp=<%= System.Configuration.ConfigurationManager.AppSettings["okta:GoogleIdp"] %>';
                }
            }]
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