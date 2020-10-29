using API_Web_Server.Domain.Home;
using API_Web_Server.Helper;
using API_Web_Server.Persistence.Contexts;
using API_Web_Server.Persistence.Repositories.Common;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Web_Server.Persistence.Repositories.Home
{
    public class RoleToPermissionsRepository : Api_ServerDbBaseRepository, IRoleToPermissionsRepository
    {
        public RoleToPermissionsRepository(Api_ServerDbContext context) : base(context) { }

        public async Task AddRoleToPermissionsAsync(RoleToPermissions roleToPermissions)
        {
            await _context.RolesToPermissions.AddAsync(roleToPermissions);
        }

        public async Task<RoleToPermissions> DeleteRoleToPermissionsAsync(int id)
        {
            RoleToPermissions role = await _context.RolesToPermissions.FindAsync(id);
            if (role != null)
            {
                _context.RolesToPermissions.Remove(role);
                return role;
            }
            else
            {
                throw new NullReferenceException(API_Message.error("E-COM-002"));
            }
        }

        public async Task<RoleToPermissions> GetRoleToPermissionsAsyncById(int id)
        {
            return await _context.RolesToPermissions.FindAsync(id);
        }

        public async Task<IEnumerable<RoleToPermissions>> ListAllRoleToPermissionsAsync(List<string> usersRoles)
        {
            return (IEnumerable<RoleToPermissions>)await _context.RolesToPermissions.Where(x => usersRoles.Contains(x.RoleName))
               .SelectMany(x => x.PermissionsInRole)
               .Distinct()
               .ToListAsync();
        }

        public Task PutRoleToPermissionsAsync(RoleToPermissions roleToPermissions, int id)
        {
            throw new NotImplementedException();
        }
    }
}
