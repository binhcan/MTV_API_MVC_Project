using System;
using System.IO;
using System.Threading.Tasks;
using MTV.API.Domain.Uploaders;
using MTV.API.Extensions;
using MTV.API.Helper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MTV.Utilities;

namespace MTV.API.Controllers.Base
{
    [Authorize]
    [Route("base/image")]
    [ApiController]
    public class UploadController : Controller
    {
        private readonly IUploadersService _uploadersService;
        private readonly IWebHostEnvironment _env;

        public UploadController(IUploadersService uploadersService, IWebHostEnvironment env)
        {
            _uploadersService = uploadersService;
            _env = env;
        }

        [HttpGet("{id}")]
        public async Task<string> GetFileAsyncByVendorLotID(string id)
        {
            try
            {
                var file = await _uploadersService.GetFileByVendorLotID(id);
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
                    return file.FileName;
                }
                else
                {
                    return API_Message.error("E-COM-008");
                }

            }
            catch (FileNotFoundException fileNotFound)
            {
                Logging.iLogger.LogError(API_Message.error("E-COM-008"));
                Logging.iLogger.LogError(fileNotFound.Message);
                throw new Exception(API_Message.error("E-COM-008"));
            }
            catch (Exception ex)
            {
                Logging.iLogger.LogError(API_Message.error("E-COM-009"));
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(API_Message.error("E-COM-009"));
            }
        }
        /// <summary>
        /// Uplaods an image to the server.
        /// </summary>
        /// <param name="file">File được upload từ client.</param>
        /// <param name="CreateUser">User đang sử dụng phía client.</param>
        /// <returns></returns>
        [HttpPost("{CreateUser}")]
        public async Task<IActionResult> UploadImage(IFormFile file, string CreateUser)
        {
            return await _uploadersService.UploadVendorLotImage(file, CreateUser);
        }
    }
}
