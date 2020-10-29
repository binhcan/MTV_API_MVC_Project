using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.Uploaders
{
    public interface IImageUploaders
    {
        Task<Files> GetFileByVendorLotID(string vendorID);
        Task<string> UploadImage(IFormFile file);
        Task<string> UploadVendorLotImage(IFormFile file, string UserCreate);
    }
}
