using Microsoft.Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Owin;
using System.Collections.Generic;
using System.Configuration;
using Okta.AspNet;

[assembly: OwinStartup(typeof(okta_aspnet_webforms_example.Startup))]

namespace okta_aspnet_webforms_example
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.SetDefaultSignInAsAuthenticationType(CookieAuthenticationDefaults.AuthenticationType);

            app.UseCookieAuthentication(new CookieAuthenticationOptions());

            app.UseOktaMvc(new OktaMvcOptions()
            {
                OktaDomain = ConfigurationManager.AppSettings["okta:OktaDomain"],
                ClientId = ConfigurationManager.AppSettings["okta:ClientId"],
                ClientSecret = ConfigurationManager.AppSettings["okta:ClientSecret"],
                RedirectUri = ConfigurationManager.AppSettings["okta:RedirectUri"],
                PostLogoutRedirectUri = ConfigurationManager.AppSettings["okta:PostLogoutRedirectUri"],
                GetClaimsFromUserInfoEndpoint = true,
                Scope = new List<string> { "openid", "profile", "email" },
            });
        }
    }
}
