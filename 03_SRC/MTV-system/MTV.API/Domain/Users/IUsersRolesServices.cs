using System.Threading.Tasks;

namespace MTV.API.Domain.Users
{
    public interface IUsersRolesServices
    {
        Task<UsersRolesResponse> SaveAsync(UsersRoles usersRole);
    }
}
