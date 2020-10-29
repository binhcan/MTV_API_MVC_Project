using Microsoft.Extensions.Logging;
using MTV.API.Domain;
using MTV.API.Domain.Home.PermissionContext;
using MTV.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Services.Departments
{
    public class ProjectsServices : IProjectsServices
    {
        private readonly IProjectsRepository _projectsRepo;

        private readonly IUnitOfWork _unitOfWork;

        public ProjectsServices(IProjectsRepository projectsRepo, IUnitOfWork unitOfWork)
        {
            _projectsRepo = projectsRepo;
            _unitOfWork = unitOfWork;
        }

        public async Task AddAsync(Projects project)
        {
            try
            {
                await _projectsRepo.AddAsync(project);
                await _unitOfWork.CompleteApiAsync();
            }
            catch (Exception ex)
            {
                // Do some logging stuff
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(ex.Message);
            }
        }

        public async Task<Projects> DeleteAsync(int id)
        {
            return await _projectsRepo.DeleteAsync(id);
        }

        public async Task<Projects> GetAsyncById(int id)
        {
            return await _projectsRepo.GetAsyncById(id);
        }

        public async Task<IEnumerable<Projects>> ListAllProjects()
        {
            return await _projectsRepo.ListAllProjects();
        }

        public async Task PutAsync(Projects project, int id)
        {
            try
            {
                await _projectsRepo.PutAsync(project, id);
                await _unitOfWork.CompleteApiAsync();
            }
            catch (Exception ex)
            {
                // Do some logging stuff
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(ex.Message);
            }
        }
    }
}
