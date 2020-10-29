using MTV.API.Domain.Home;
using MTV.API.Domain.Home.PermissionPart;
using MTV.API.Helper;
using MTV.API.Persistence.Contexts;
using MTV.API.Persistence.Repositories.Common;
using MTV.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace MTV.API.Persistence.Repositories.Home
{
    public class ModulesForUserRepository : Api_ServerDbBaseRepository , IModulesForUserRepository
    {
        public ModulesForUserRepository(Api_ServerDbContext context) : base(context) { }

        public async Task AddRangeModuleForUsersAsync(IEnumerable<ModulesForUser> lstUserModule)
        {
            await _context.ModulesForUsers.AddRangeAsync(lstUserModule);
        }

        public async Task AddSingleModuleForUsersAsync(ModulesForUser user)
        {
            await _context.ModulesForUsers.AddAsync(user);
        }

        public async Task<ModulesForUser> DeleteModuleForUsersAsync(int id)
        {
            ModulesForUser module = await _context.ModulesForUsers.FindAsync(id);
            if (module != null)
            {
                _context.ModulesForUsers.Remove(module);
                return module;
            }
            else
            {
                throw new NullReferenceException(API_Message.error("E-COM-002"));
            }
        }

        public async Task<ModulesForUser> GetModuleForUsersAsyncById(int id)
        {
            return await _context.ModulesForUsers.FindAsync(id);
        }

        public async Task<PaidForModules> GetModuleForUsersAsyncByIdentity(IEnumerable<Claim> claims)
        {
            return _context.ModulesForUsers.Find(claims.SingleOrDefault(x => x.Type == ClaimTypes.Name).Value)
                    ?.AllowedPaidForModules ?? PaidForModules.None;
        }

        public Task<IEnumerable<ModulesForUser>> ListAllModuleForUsersAsync()
        {
            throw new NotImplementedException();
        }

        public Task PutModuleForUsersAsync(ModulesForUser user, int id)
        {
            throw new NotImplementedException();
        }
    }
}
