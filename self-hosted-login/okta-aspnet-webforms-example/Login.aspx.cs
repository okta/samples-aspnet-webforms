using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OpenIdConnect;

namespace okta_aspnet_webforms_example
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
                properties.RedirectUri = "/Home";

                HttpContext.Current.GetOwinContext().Authentication.Challenge(
                        properties,
                        OpenIdConnectAuthenticationDefaults.AuthenticationType);
            }
        }
    }
}