using MTV.API.Domain;
using MTV.API.Domain.Mobile_App;
using MTV.API.Helper;
using Microsoft.Extensions.Logging;
using System;
using System.Linq;
using System.Threading.Tasks;
using MTV.Utilities;

namespace MTV.API.Services.Mobile_App
{
    public class Mobile_AppsService : IMobile_AppsService
    {
        private readonly IMobile_AppsRepository _applicationRepository;
        private readonly IUnitOfWork _unitOfWork;

        public Mobile_AppsService(IMobile_AppsRepository applicationRepository, IUnitOfWork unitOfWork)
        {
            _applicationRepository = applicationRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task AddAsyncApplication(Mobile_Applications app)
        {
            try
            {
                await _applicationRepository.AddAsyncApplication(app);
                await _unitOfWork.CompleteApiAsync();
            }
            catch (Exception ex)
            {
                //Log the exception and rollback the transaction
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(ex.Message);
            }
        }

        public async Task<Mobile_Applications> DeleteAsyncApplication(int id)
        {
            return await _applicationRepository.DeleteAsyncApplication(id);
        }

        public async Task<Mobile_Applications> GetAsyncApplicationById(int id)
        {
            return await _applicationRepository.GetAsyncApplicationById(id);
        }

        public async Task<Mobile_Applications> GetReleaseVersionApplicationByName(string name)
        {
            return await _applicationRepository.GetReleaseVersionApplicationByName(name);
        }

        public async Task<IQueryable<Mobile_Applications>> ListAllApplications()
        {
            return await _applicationRepository.ListAllApplications();
        }

        public async Task PutAsyncApplication(Mobile_Applications app, int id)
        {
            try
            {
                await _applicationRepository.PutAsyncApplication(app, id);
                await _unitOfWork.CompleteApiAsync();
            }
            catch (Exception ex)
            {
                //Log the exception and rollback the transaction
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(ex.Message);
            }
        }
    }
}
