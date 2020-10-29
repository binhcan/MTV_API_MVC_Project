using Microsoft.AspNetCore.Http;
using System;
using System.Threading.Tasks;
using MTV.API.Persistence.Contexts;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using MTV.Utilities;

namespace MTV.API.Domain.Uploaders
{
    public class ImageUploaders : BaseUploader, IImageUploaders
    {
        public ImageUploaders(Api_ServerDbContext context) : base(context) { }

        public async Task<Files> GetFileByVendorLotID(string vendorID)
        {
            return await _context.Files.Where(x => x.Guid == vendorID).SingleOrDefaultAsync();
        }

        public async Task<string> UploadImage(IFormFile file)
        {
            if (CheckIfImageFile(file))
            {
                return await WriteFile(file, Setting.Configuration["UPLOAD-HOST"]);
            }
            return API_Message.error("E-COM-006");
        }

        /// <summary>
        /// Function thực hiện lưu file ảnh của của Item để tạo Vendor Lot ID.
        /// Ảnh của item được resize trước khi lưu lên server.
        /// </summary>
        /// <param name="file">File được upload lên từ phía client.</param>
        /// <returns name="vendorID">Vendor Lot ID.</returns>
        public async Task<string> UploadVendorLotImage(IFormFile file, string UserCreate)
        {
            if (CheckIfImageFile(file))
            {
                string vendorID = DateTime.Now.ToString("HHmmss") + Guid.NewGuid().ToString().Substring(0, 6);
                //string fileName =  await WriteFile(file, Setting.Configuration["VENDOR-IMG-HOST"]);
                string fileName = ResizeAndWriteImageFile(file, Setting.Configuration["VENDOR-IMG-HOST"]);
                var extension = "." + fileName.Split('.')[fileName.Split('.').Length - 1];
                Files fileInsert2DB = new Files
                {
                    FileName = fileName,
                    Guid = vendorID,
                    Extension = extension,
                    UserCreate = UserCreate,
                    UserUpdate = UserCreate,
                    CreateDate = DateTime.Now,
                    UpdateDate = DateTime.Now,
                };
                await _context.Files.AddAsync(fileInsert2DB);
                return vendorID;
            }

            return API_Message.error("E-COM-006");
        }
    }
}
