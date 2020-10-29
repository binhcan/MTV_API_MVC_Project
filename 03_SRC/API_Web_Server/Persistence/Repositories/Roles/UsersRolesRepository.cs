using API_Web_Server.Domain.Users;
using API_Web_Server.Persistence.Contexts;
using API_Web_Server.Persistence.Repositories.Common;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_Web_Server.Persistence.Repositories.Roles
{
    public class UsersRolesRepository : Api_ServerDbBaseRepository, IUsersRolesRepository
    {
        public UsersRolesRepository(Api_ServerDbContext context) : base(context) { }

        public async Task AddRangeUsersRolesAsync(IEnumerable<UsersRoles> lstUsersRole)
        {
            await _context.UserWithRoles.AddRangeAsync(lstUsersRole);
        }

        public async Task AddSingleUsersRolesAsync(UsersRoles usersRole)
        {
            await _context.UserWithRoles.AddAsync(usersRole);
        }
    }
}
