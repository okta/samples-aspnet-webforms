using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

#pragma warning disable SA1300 // Element should begin with upper-case letter
namespace okta_aspnet_webforms_example
#pragma warning restore SA1300 // Element should begin with upper-case letter
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.EnableFriendlyUrls(new FriendlyUrlSettings());
            routes.MapPageRoute("Home", string.Empty, "~/Default.aspx");
        }
    }
}
