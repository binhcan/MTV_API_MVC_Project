using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Home
{
    public interface IRoleToPermissionsRepository
    {
        Task<IEnumerable<RoleToPermissions>> ListAllRoleToPermissionsAsync(List<string> usersRoles);
        Task<RoleToPermissions> GetRoleToPermissionsAsyncById(int id);
        Task AddRoleToPermissionsAsync(RoleToPermissions roleToPermissions);
        Task PutRoleToPermissionsAsync(RoleToPermissions roleToPermissions, int id);
        Task<RoleToPermissions> DeleteRoleToPermissionsAsync(int id);
    }
}
