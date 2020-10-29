using MTV.API.Persistence.Repositories.Home;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.Home
{
    public interface IRoleToPermissionsRepository
    {
        Task<IEnumerable<RoleToPermissions>> ListAllRoleToPermissionsAsync();
        Task<RoleToPermissions> GetRoleToPermissionsAsyncById(int id);
        Task AddRoleToPermissionsAsync(RoleToPermissions roleToPermissions);
        Task PutRoleToPermissionsAsync(RoleToPermissions roleToPermissions, int id);
        Task<RoleToPermissions> DeleteRoleToPermissionsAsync(int id);
        IEnumerable<RolesListDto> ListRolesWithPermissionsExplained();
    }
}
