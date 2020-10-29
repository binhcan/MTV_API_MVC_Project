﻿using System.Collections.Generic;
using System.Threading.Tasks;

namespace MTV.API.Domain.Home.PermissionContext
{
    public interface IUserRoleInProjectsSevices
    {
        Task<IEnumerable<UserRoleInProjects>> ListAllRoleInProjects();
        Task<UserRoleInProjects> GetAsyncById(int id);
        Task AddAsync(UserRoleInProjects roleInProjects);
        Task PutAsync(UserRoleInProjects roleInProjects, int id);
        Task<UserRoleInProjects> DeleteAsync(int id);
        Task<string> GetPermissionByEcodeAsync(string ecode, List<Dictionary<string, string>> Permissions);
    }
}
