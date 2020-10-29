using API_Web_Server.Helper;
using API_Web_Server.Persistence.Contexts;
using API_Web_Server.Persistence.Repositories.Common;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Processing;
using System;
using System.IO;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Uploaders
{
    public abstract class BaseUploader : Api_ServerDbBaseRepository
    {
        public BaseUploader(Api_ServerDbContext context) : base(context) { }
        /// <summary>
        /// Function kiểm tra định dạng file có phải là ảnh không.
        /// </summary>
        /// <param name="file">File được upload lên từ phía client.</param>
        /// <returns>Bool values</returns>
        protected bool CheckIfImageFile(IFormFile file)
        {
            byte[] fileBytes;
            using (var ms = new MemoryStream())
            {
                file.CopyTo(ms);
                fileBytes = ms.ToArray();
            }
            return WriterHelper.GetImageFormat(fileBytes) != WriterHelper.ImageFormat.unknown;
        }

        /// <summary>
        /// Function thực hiện lưu file vào thư mục được chỉ định trên Server.
        /// </summary>
        /// <param name="file">File được upload lên từ phía client.</param>
        /// <param name="locationStore">Đường dẫn lưu file trên server.</param>
        /// <returns name="fileName">Tên File đã được lưu trên server sau khi upload thành công.</returns>
        public async Task<string> WriteFile(IFormFile file, string locationStore)
        {
            string fileName;
            string vendorID;
            try
            {
                var extension = "." + file.FileName.Split('.')[file.FileName.Split('.').Length - 1];
                fileName = Guid.NewGuid().ToString() + extension;

                bool exists = System.IO.Directory.Exists(locationStore);
                if (!exists)
                    System.IO.Directory.CreateDirectory(locationStore);

                //var path = locationStore + fileName;
                var path = Path.Combine(locationStore, fileName);

                using var bits = new FileStream(path, FileMode.Create);
                await file.CopyToAsync(bits);
            }
            catch (Exception e)
            {
                Logging.iLogger.LogError(API_Message.error("E-COM-007"));
                Logging.iLogger.LogError(e.Message);
                return API_Message.error("E-COM-007");
            }
            return fileName;
        }

        /// <summary>
        /// Function thực hiện lưu file vào thư mục được chỉ định trên Server. Trước khi lưu file sẽ giảm dung lượng file xuống.
        /// </summary>
        /// <param name="file">File được upload lên từ phía client.</param>
        /// <param name="locationStore">Đường dẫn lưu file trên server.</param>
        /// <returns name="fileName">Tên File đã được lưu trên server sau khi upload thành công.</returns>
        public string ResizeAndWriteImageFile(IFormFile file, string locationStore)
        {
            int maxWidth = 768;
            string fileName;
            string vendorID;
            try
            {
                var extension = "." + file.FileName.Split('.')[file.FileName.Split('.').Length - 1];
                fileName = Guid.NewGuid().ToString() + extension;

                bool exists = System.IO.Directory.Exists(locationStore);
                if (!exists)
                    System.IO.Directory.CreateDirectory(locationStore);

                //var path = locationStore + fileName;
                var path = Path.Combine(locationStore, fileName);
                using var image = Image.Load(file.OpenReadStream());
                if (image.Width > maxWidth)
                {
                    var thumbScaleFactor = maxWidth / image.Width;
                    image.Mutate(i => i.Resize(maxWidth, image.Height * thumbScaleFactor));
                }

                image.Save(path);

            }
            catch (Exception e)
            {
                Logging.iLogger.LogError(API_Message.error("E-COM-007"));
                Logging.iLogger.LogError(e.Message);
                return API_Message.error("E-COM-007");
            }
            return fileName;
        }

    }
}
