using Microsoft.AspNetCore.Mvc.Rendering;
using System;

namespace MTV.Web.Helper
{
    public static class Utilities
    {
        public static string IsActive(this IHtmlHelper html, string control, string action)
        {
            var routeData = html.ViewContext.RouteData;
            var routeAction = (string)routeData.Values["action"];
            var routeControl = (string)routeData.Values["controller"];

            // both must match
            var returnActive = control == routeControl &&
                               action == routeAction;

            return returnActive ? "active" : "";
        }

        public static string IsDarkmode(string darkmode)
        {
            return String.IsNullOrEmpty(darkmode) ? "" : darkmode == "True"? "" : "white-content";
        }

        public static string SidebarColor(string color)
        {
            return String.IsNullOrEmpty(color) ? "blue" : (color == "blue" || color == "green" || color == "primary")? color: "blue" ;
        }
    }
}
