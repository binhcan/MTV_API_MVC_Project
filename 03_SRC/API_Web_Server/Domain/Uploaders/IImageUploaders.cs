using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Uploaders
{
    public interface IImageUploaders
    {
        Task<Files> GetFileByVendorLotID(string vendorID);
        Task<string> UploadImage(IFormFile file);
        Task<string> UploadVendorLotImage(IFormFile file, string UserCreate);
    }
}
