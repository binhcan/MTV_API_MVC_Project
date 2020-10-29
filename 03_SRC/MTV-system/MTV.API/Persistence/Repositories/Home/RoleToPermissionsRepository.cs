using MTV.API.Domain.Home;
using MTV.API.Helper;
using MTV.API.Persistence.Contexts;
using MTV.API.Persistence.Repositories.Common;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MTV.Utilities;
using MTV.API.Domain.Home.PermissionPart;
using System.ComponentModel.DataAnnotations;
using System.Reflection;

namespace MTV.API.Persistence.Repositories.Home
{
    public class RoleToPermissionsRepository : Api_ServerDbBaseRepository, IRoleToPermissionsRepository
    {
        public RoleToPermissionsRepository(Api_ServerDbContext context) : base(context) { }

        public async Task AddRoleToPermissionsAsync(RoleToPermissions roleToPermissions)
        {
            await _context.RoleToPermissions.AddAsync(roleToPermissions);
        }

        public async Task<RoleToPermissions> DeleteRoleToPermissionsAsync(int id)
        {
            RoleToPermissions role = await _context.RoleToPermissions.FindAsync(id);
            if (role != null)
            {
                _context.RoleToPermissions.Remove(role);
                return role;
            }
            else
            {
                throw new NullReferenceException(API_Message.error("E-COM-002"));
            }
        }

        public async Task<RoleToPermissions> GetRoleToPermissionsAsyncById(int id)
        {
            return await _context.RoleToPermissions.FindAsync(id);
        }

        public async Task<IEnumerable<RoleToPermissions>> ListAllRoleToPermissionsAsync()
        {
            return await _context.RoleToPermissions.ToListAsync();
        }

        public Task PutRoleToPermissionsAsync(RoleToPermissions roleToPermissions, int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<RolesListDto> ListRolesWithPermissionsExplained()
        {
            foreach (var roleToPermissions in _context.RoleToPermissions)
            {
                var permissionsWithDesc =
                    from permission in roleToPermissions.PermissionsInRole
                    let displayAttr = typeof(Permissions).GetMember(permission.ToString())[0].GetCustomAttribute<DisplayAttribute>()
                    let moduleAttr = typeof(Permissions).GetMember(permission.ToString())[0].GetCustomAttribute<LinkedToModuleAttribute>()
                    select new PermissionWithDesc(permission.ToString(), displayAttr?.Description, moduleAttr?.PaidForModule.ToString());
                yield return new RolesListDto(roleToPermissions.RoleName, permissionsWithDesc.ToList());
            }
        }
    }

    public class RolePageDto
    {
        public RolePageDto(List<RolesListDto> roles)
        {
            Roles = roles ?? throw new ArgumentNullException(nameof(roles));
        }

        public List<RolesListDto> Roles { get; set; }
    }

    public class RolesListDto
    {
        public RolesListDto(string roleName, List<PermissionWithDesc> permissionsWithDesc)
        {
            RoleName = roleName ?? throw new ArgumentNullException(nameof(roleName));
            PermissionsWithDesc = permissionsWithDesc ?? throw new ArgumentNullException(nameof(permissionsWithDesc));
        }

        public string RoleName { get; set; }
        public List<PermissionWithDesc> PermissionsWithDesc { get; set; }
    }

    public class PermissionWithDesc
    {
        public PermissionWithDesc(string permissionName, string description, string linkedToModule)
        {
            PermissionName = permissionName ?? throw new ArgumentNullException(nameof(permissionName));
            Description = description ?? throw new ArgumentNullException(nameof(description));
            LinkedToModule = linkedToModule;
        }

        public string PermissionName { get; set; }
        public string Description { get; set; }
        public string LinkedToModule { get; set; }
    }
}
