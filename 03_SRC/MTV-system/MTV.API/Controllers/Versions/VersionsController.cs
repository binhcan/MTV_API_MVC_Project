using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using MTV.API.Domain.Mobile_App;
using MTV.API.Helper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using MimeKit;

namespace MTV.API.Controllers.Versions
{
    [Authorize]
    [EnableCors("CorsPolicy")]
    [Route("[controller]")]
    [ApiController]
    public class VersionsController : Controller
    {
        private readonly IMobile_AppsService _mobile_AppsService;

        public VersionsController(IMobile_AppsService mobile_AppsService)
        {
            _mobile_AppsService = mobile_AppsService;
        }

        [AllowAnonymous]
        [HttpGet("Vendor_Tracability/{appName}")]
        public Vendor_Tracability_Version VendorReleaseVersion(string appName = "LOG_Vendors_Tracability")
        {
            var versionRelease = _mobile_AppsService.GetReleaseVersionApplicationByName(appName);
            var version = new Vendor_Tracability_Version
            {
                version = versionRelease.Result.Version,
            };
            return version;
        }

        [AllowAnonymous]
        [HttpGet("Vendor_Tracability/Release/{appName}")]
        public IActionResult Vendor_TracabilityDownloadFile(string appName = "LOG_Vendors_Tracability")
        {
            var versionRelease = _mobile_AppsService.GetReleaseVersionApplicationByName(appName);
            //var filePath = Path.Combine() Directory.GetCurrentDirectory() + versionRelease.Result.Path;
            var filePath = Path.Combine(Directory.GetCurrentDirectory(), versionRelease.Result.Path);
            if (System.IO.File.Exists(filePath))
            {
                return PhysicalFile(filePath, MimeTypes.GetMimeType(filePath), Path.GetFileName(filePath));
            }
            else
            {
                return NotFound();
            }
        }
    }

    public class Vendor_Tracability_Version
    {
#pragma warning disable IDE1006 // Naming Styles
        public string version { get; set; }
#pragma warning restore IDE1006 // Naming Styles
    }
}
