using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Users
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
        Task<Users> CreateUserWithPermission(string Ecode, string Password, string FisrtName, string GivenName, List<Dictionary<string, int>> lstPermisson);
    }
}
