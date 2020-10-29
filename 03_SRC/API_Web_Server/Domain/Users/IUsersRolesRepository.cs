using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Users
{
    public interface IUsersRolesRepository
    {
        Task AddSingleUsersRolesAsync(UsersRoles usersRole);
        Task AddRangeUsersRolesAsync(IEnumerable<UsersRoles> lstUsersRole);
    }
}
