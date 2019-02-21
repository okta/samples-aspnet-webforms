using System;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;

#pragma warning disable SA1300 // Element should begin with upper-case letter
namespace okta_aspnet_webforms_example
#pragma warning restore SA1300 // Element should begin with upper-case letter
{
    public class Global : HttpApplication
    {
#pragma warning disable SA1400 // Access modifier must be declared
        void Application_Start(object sender, EventArgs e)
#pragma warning restore SA1400 // Access modifier must be declared
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}
