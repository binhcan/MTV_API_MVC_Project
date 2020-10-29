using MTV.API.Domain.Uploaders;
using MTV.API.Extensions;
using MTV.API.Helper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using MTV.Utilities;

namespace MTV.API.Controllers.Factory
{
    [Authorize]
    [EnableCors("CorsPolicy")]
    [Route("[controller]")]
    [ApiController]
    public class TraceabilityController : Controller
    {
        private readonly IUploadersService _uploadersService;
        private readonly IWebHostEnvironment _env;

        public TraceabilityController(IUploadersService uploadersService, IWebHostEnvironment env)
        {
            _uploadersService = uploadersService;
            _env = env;
        }

        [AllowAnonymous]
        public async Task<ActionResult> Index(string currentFilter, string SearchString)
        {
            if (SearchString != null)
            {
                try
                {
                    var file = await _uploadersService.GetFileByVendorLotID(SearchString);
                    if (file != null)
                    {
                        string targetPath = "{0}\\img\\log\\vendorlot\\".FormatWith(_env.WebRootPath);
                        // Use Path class to manipulate file and directory paths.
                        string sourceFile = Path.Combine(Setting.Configuration["VENDOR-IMG-HOST"], file.FileName);
                        string destFile = Path.Combine(targetPath, file.FileName);

                        // To copy a folder's contents to a new location:
                        // Create a new target folder.
                        // If the directory already exists, this method does not create a new directory.
                        System.IO.Directory.CreateDirectory(targetPath);

                        // To copy a file to another location and
                        // overwrite the destination file if it already exists.
                        System.IO.File.Copy(sourceFile, destFile, true);
                        ViewBag.LoadImage = true;
                        ViewBag.Message = file.FileName;
                    }
                    else
                    {
                        ViewBag.LoadImage = false;
                        ViewBag.Message = "Không tồn tại ảnh tương ứng với vendor lot: {0}".FormatWith(SearchString);
                    }
                }
                catch (FileNotFoundException fileNotFound)
                {
                    Logging.iLogger.LogError(API_Message.error("E-COM-008"));
                    Logging.iLogger.LogError(fileNotFound.Message);
                    ViewBag.LoadImage = false;
                    ViewBag.Message = API_Message.error("E-COM-008");
                }
                catch (Exception ex)
                {
                    Logging.iLogger.LogError(API_Message.error("E-COM-009"));
                    Logging.iLogger.LogError(ex.Message);
                    ViewBag.LoadImage = false;
                    ViewBag.Message = API_Message.error("E-COM-009");
                }
            }
            else
            {
                SearchString = currentFilter;
            }
            ViewData["CurrentFilter"] = SearchString;

            return View();
        }
    }
}
