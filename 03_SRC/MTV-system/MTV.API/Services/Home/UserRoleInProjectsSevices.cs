using Microsoft.AspNetCore.Mvc;
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
    public class UserRoleInProjectsSevices : IUserRoleInProjectsSevices
    {
        private readonly IUserRoleInProjectsRepository _userRoles;
        private readonly IUnitOfWork _unitOfWork;

        public UserRoleInProjectsSevices(IUserRoleInProjectsRepository userRoles, IUnitOfWork unitOfWork)
        {
            _userRoles = userRoles;
            _unitOfWork = unitOfWork;
        }

        public async Task AddAsync(UserRoleInProjects roleInProjects)
        {
            try
            {
                await _userRoles.AddAsync(roleInProjects);
                await _unitOfWork.CompleteApiAsync();
            }
            catch (Exception ex)
            {
                // Do some logging stuff
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(ex.Message);
            }
        }

        public async Task<UserRoleInProjects> DeleteAsync(int id)
        {
            return await _userRoles.DeleteAsync(id);
        }

        public async Task<UserRoleInProjects> GetAsyncById(int id)
        {
            return await _userRoles.GetAsyncById(id);
        }

        public async Task<IEnumerable<UserRoleInProjects>> ListAllRoleInProjects()
        {
            return await _userRoles.ListAllRoleInProjects();
        }

        public async Task PutAsync(UserRoleInProjects roleInProjects, int id)
        {
            try
            {
                await _userRoles.PutAsync(roleInProjects, id);
                await _unitOfWork.CompleteApiAsync();
            }
            catch (Exception ex)
            {
                // Do some logging stuff
                Logging.iLogger.LogError(ex.Message);
                throw new Exception(ex.Message);
            }
        }

        public Task<string> GetPermissionByEcodeAsync(string ecode, List<Dictionary<string, string>> Permissions)
        {
            return _userRoles.GetPermissionByEcodeAsync(ecode, Permissions);
        }

    }
}
