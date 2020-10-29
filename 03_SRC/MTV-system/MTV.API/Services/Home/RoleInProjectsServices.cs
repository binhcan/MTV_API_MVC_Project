using Microsoft.Extensions.Logging;
using MTV.API.Domain;
using MTV.API.Domain.Home.PermissionContext;
using MTV.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Services.Home
{
    public class RoleInProjectsServices : IRoleInProjectsServices
    {
        private readonly IRoleInProjectsRepository _roleInProjectsRepo;
        private readonly IUnitOfWork _unitOfWork;

        public RoleInProjectsServices(IRoleInProjectsRepository roleInProjectsRepo, IUnitOfWork unitOfWork)
        {
            _roleInProjectsRepo = roleInProjectsRepo;
            _unitOfWork = unitOfWork;
        }

        public async Task AddAsync(RoleInProjects roleInProjects)
        {
            try
            {
                await _roleInProjectsRepo.AddAsync(roleInProjects);
                await _unitOfWork.CompleteApiAsync();
            }
            catch (Exception ex)
            {
                // Do some logging stuff
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(ex.Message);
            }
        }

        public async Task<RoleInProjects> DeleteAsync(int id)
        {
            return await _roleInProjectsRepo.DeleteAsync(id);
        }

        public async Task<RoleInProjects> GetAsyncById(int id)
        {
            return await _roleInProjectsRepo.GetAsyncById(id);
        }

        public async Task<IEnumerable<RoleInProjects>> ListRoleInProjects()
        {
            return await _roleInProjectsRepo.ListRoleInProjects();
        }

        public async Task PutAsync(RoleInProjects roleInProjects, int id)
        {
            try
            {
                await _roleInProjectsRepo.PutAsync(roleInProjects, id);
                await _unitOfWork.CompleteApiAsync();
            }
            catch (Exception ex)
            {
                // Do some logging stuff
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(ex.Message);
            }
        }

        public async Task<IEnumerable<RoleInProjects>> ListRoleInProjectsByProjectID(int id)
        {
            return await _roleInProjectsRepo.ListRoleInProjectsByProjectID(id);
        }
    }
}
