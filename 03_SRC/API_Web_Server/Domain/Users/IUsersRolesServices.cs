using System.Threading.Tasks;

namespace API_Web_Server.Domain.Users
{
    public interface IUsersRolesServices
    {
        Task<UsersRolesResponse> SaveAsync(UsersRoles usersRole);
    }
}
