using System.Diagnostics;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using API_Web_Server.Models;
using Microsoft.AspNetCore.Http;
using API_Web_Server.Domain.Users;
using System.Security.Principal;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication;
using API_Web_Server.Domain.Home.RolesToPermission;
using API_Web_Server.Domain.Home.PermissionPart;
using API_Web_Server.Extensions;
using System;

namespace API_Web_Server.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly IUsersService _usersService;

        public HomeController(IUsersService usersService)
        {
            _usersService = usersService;
        }

        [AllowAnonymous]
        public IActionResult Login()
        {
            if (HttpContext.User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.Message = HttpContext.Session.GetString("authentication_message") ?? "";
                HttpContext.Session.Remove("authentication_message");
                return View();
            }

        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            HttpContext.User = new GenericPrincipal(new GenericIdentity(string.Empty), null);
            return Redirect("~/Home/Login");

        }

        [AllowAnonymous]
        public async Task<ActionResult> Authenticate(IFormCollection collection)
        {
            try
            {
                var user = await _usersService.Authenticate(collection["Ecode"], collection["Password"]);
                if (user.Token != null)
                {
                    if (user.Ecode == "111070")
                    {
                        HttpContext.Session.SetString("Permissions", "H4-0010001100130012");
                    }
                    else
                    {
                        HttpContext.Session.SetString("Permissions", "H4-0021003000310010001100130012");
                    }
                    HttpContext.Session.SetString("Fname", user.FirstName ??"");
                    HttpContext.Session.SetString("Gname", user.GivenName ?? "");
                    HttpContext.Session.SetString("Email", user.Email ?? "");
                    HttpContext.Session.SetString("Description", user.Description ?? "");
                    HttpContext.Session.SetString("Address", user.Address ?? "Meiko Towada Việt Nam");
                    HttpContext.Session.SetString("Phone", (user.Phone ?? 0123456789).ToString() );
                    HttpContext.Session.SetString("About", user.About ?? "");
                    HttpContext.Session.SetString("Facebook", user.Facebook ?? "");
                    HttpContext.Session.SetString("Avatar", user.Avatar ?? "");
                    HttpContext.Session.SetString("SettingDarkMode", user.SettingDarkMode.ToString());
                    HttpContext.Session.SetString("SidebarColor", user.SidebarColor ?? "");
                    HttpContext.Session.SetString("JWToken", user.Token);
                    return RedirectToAction("Index");
                }
                else
                {
                    HttpContext.Session.SetString("authentication_message", "Đăng nhập không thành công");
                    return RedirectToAction("Login");
                }

            }
            catch (Exception ex)
            {
                HttpContext.Session.SetString("authentication_message", ex.Message);
                return RedirectToAction("Login");
            }
        }

        [AllowAnonymous]
        public IActionResult Index()
        {
            return View();
        }

        //[HasPermission(Permissions.Feature1Access)]
        public IActionResult Profile()
        {
            return View();
        }

        public IActionResult PageNotFound()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
