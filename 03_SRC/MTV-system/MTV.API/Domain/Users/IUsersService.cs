using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.Users
{
    public interface IUsersService
    {
        Task<IQueryable<UserFullInfo>> ListAllUsers();
        Task<Users> GetAsyncById(int id);
        Task<UsersResponse> SaveAsync(Users users);
        Task<UsersResponse> PutAsync(Users users, int id);
        Task<UsersResponse> DeleteAsync(int id);
        Task<Users> Authenticate(string eCode, string password);
        Task<Users> GetAsyncByEcode(string Ecode);
        Task<Users> CreateUserWithPermission(Users user, List<(int, int)> lstPermissonInDepartment, List<(int, int)> lstPermissonInProjects, List<int> lstModules = null);
    }
}
