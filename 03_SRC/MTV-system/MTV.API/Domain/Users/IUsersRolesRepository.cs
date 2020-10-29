using System.Collections.Generic;
using System.Threading.Tasks;

namespace MTV.API.Domain.Users
{
    public interface IUsersRolesRepository
    {
        Task AddSingleUsersRolesAsync(UsersRoles usersRole);
        Task AddRangeUsersRolesAsync(IEnumerable<UsersRoles> lstUsersRole);
    }
}
