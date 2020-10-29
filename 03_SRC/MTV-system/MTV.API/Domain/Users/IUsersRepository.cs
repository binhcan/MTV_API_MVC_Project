using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.Users
{
    public interface IUsersRepository
    {
        Task<IQueryable<UserFullInfo>> ListAllUsers();
        Task<Users> GetAsyncById(int id);
        Task AddAsync(Users user);
        Task PutAsync(Users user, int id);
        Task<Users> DeleteAsync(int id);
        Task<Users> Authenticate(string eCode, string password);
        Task<Users> GetAsyncByEcode(string Ecode);
        //Task AddUserFullPermisson(UserFullInfo userFull);
    }
}
