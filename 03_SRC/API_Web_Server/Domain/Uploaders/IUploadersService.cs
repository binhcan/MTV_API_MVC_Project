using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Uploaders
{
    public interface IUploadersService
    {
        Task<Files> GetFileByVendorLotID(string vendorID);
        Task<IActionResult> UploadImage(IFormFile file);
        Task<IActionResult> UploadVendorLotImage(IFormFile file, string UserCreate = "System");
    }
}
