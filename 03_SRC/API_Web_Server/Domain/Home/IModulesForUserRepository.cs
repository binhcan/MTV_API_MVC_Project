using API_Web_Server.Domain.Home.PermissionPart;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Home
{
    public interface IModulesForUserRepository
    {
        Task<IEnumerable<ModulesForUser>> ListAllModuleForUsersAsync();
        Task<ModulesForUser> GetModuleForUsersAsyncById(int id);
        Task AddSingleModuleForUsersAsync(ModulesForUser user);
        Task PutModuleForUsersAsync(ModulesForUser user, int id);
        Task<ModulesForUser> DeleteModuleForUsersAsync(int id);
        Task<PaidForModules> GetModuleForUsersAsyncByIdentity(IEnumerable<Claim> claims);
        Task AddRangeModuleForUsersAsync(IEnumerable<ModulesForUser>  lstUserModule);
    }
}
