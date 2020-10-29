using MTV.API.Domain.Home.PermissionPart;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace MTV.API.Domain.Home
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
