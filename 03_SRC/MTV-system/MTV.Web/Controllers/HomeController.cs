using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security.Principal;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MTV.API.Domain.Home.PermissionContext;
using MTV.API.Domain.Home.RolesToPermission;
using MTV.API.Domain.Users;
using MTV.Utilities;
using MTV.Web.Models;

namespace MTV.Web.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly IUsersService _usersService;
        private readonly IUserRoleInProjectsSevices _userRoleInProjectsSevices;

        public HomeController(IUsersService usersService, IUserRoleInProjectsSevices userRoleInProjectsSevices)
        {
            _usersService = usersService;
            _userRoleInProjectsSevices = userRoleInProjectsSevices;
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

        [ResponseCache(Location = ResponseCacheLocation.None, NoStore = true)]
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
                    var lstProjectPermission = _userRoleInProjectsSevices.GetPermissionByEcodeAsync(user.Ecode, user.Permissions);

                    // Required attribute
                    HttpContext.Session.SetString(PermissionConstants.PackedPermissionClaimType, lstProjectPermission.Result);
                    HttpContext.Session.SetString("JWToken", user.Token);
                    HttpContext.Session.SetString("Fname", user.FirstName ?? "");
                    HttpContext.Session.SetString("Gname", user.GivenName ?? "");
                    HttpContext.Session.SetString("Email", user.Email ?? "");

                    // Optinal attribute
                    HttpContext.Session.SetString("Description", user.Description ?? "");
                    HttpContext.Session.SetString("Address", user.Address ?? "Meiko Towada Việt Nam");
                    HttpContext.Session.SetString("Phone", (user.Phone ?? 0123456789).ToString());
                    HttpContext.Session.SetString("About", user.About ?? "");
                    HttpContext.Session.SetString("Facebook", user.Facebook ?? "");
                    HttpContext.Session.SetString("Avatar", user.Avatar ?? "");
                    HttpContext.Session.SetString("SettingDarkMode", user.SettingDarkMode.ToString());
                    HttpContext.Session.SetString("SidebarColor", user.SidebarColor ?? "");
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
                Logging.iLogger.LogError(ex.Message);
                HttpContext.Session.SetString("authentication_message", ex.Message);
                return RedirectToAction("Login");
            }
        }

        [AllowAnonymous]
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Profile()
        {
            return View();
        }

        [AllowAnonymous]
        public IActionResult PageNotFound()
        {
            return View();
        }

        public IActionResult ForbiddenPage()
        {
            return View();
        }

        [AllowAnonymous]
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
