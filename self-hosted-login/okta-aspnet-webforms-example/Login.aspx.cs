using System;
using System.Web;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OpenIdConnect;

#pragma warning disable SA1300 // Element should begin with upper-case letter
namespace okta_aspnet_webforms_example
#pragma warning restore SA1300 // Element should begin with upper-case letter
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.RequestType == "POST" && !Request.IsAuthenticated)
            {
                var sessionToken = Request.Form["sessionToken"]?.ToString();
                var properties = new AuthenticationProperties();
                properties.Dictionary.Add("sessionToken", sessionToken);
                properties.RedirectUri = "/";

                HttpContext.Current.GetOwinContext().Authentication.Challenge(
                        properties,
                        OpenIdConnectAuthenticationDefaults.AuthenticationType);
            }
        }
    }
}
