using API_Web_Server.Domain;
using API_Web_Server.Domain.Uploaders;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace API_Web_Server.Services
{
    public class UploadersService : IUploadersService
    {
        private readonly IImageUploaders _imageUploaders;

        private readonly IUnitOfWork _unitOfWork;

        public UploadersService(IImageUploaders imageUploaders, IUnitOfWork unitOfWork)
        {
            _imageUploaders = imageUploaders;
            _unitOfWork = unitOfWork;
        }

        public async Task<Files> GetFileByVendorLotID(string vendorID)
        {
            return await _imageUploaders.GetFileByVendorLotID(vendorID);
        }

        public async Task<IActionResult> UploadImage(IFormFile file)
        {
            var result = await _imageUploaders.UploadImage(file);
            await _unitOfWork.CompleteApiAsync();
            return new ObjectResult(result);
        }

        public async Task<IActionResult> UploadVendorLotImage(IFormFile file, string UserCreate)
        {
            var result = await _imageUploaders.UploadVendorLotImage(file, UserCreate);
            await _unitOfWork.CompleteApiAsync();
            return new ObjectResult(result);
        }
    }
}
