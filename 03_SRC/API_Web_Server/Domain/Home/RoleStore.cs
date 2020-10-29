using API_Web_Server.Domain.Users;
using API_Web_Server.Persistence.Contexts;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Home
{
    public class RoleStore : IRoleStore<UsersRoles>
    {
        private readonly Api_ServerDbContext _api_serverDbContext;

        public RoleStore(Api_ServerDbContext api_serverDbContext)
        {
            _api_serverDbContext = api_serverDbContext;
        }

        public void Dispose()
        {
        }

        public Task<IdentityResult> CreateAsync(UsersRoles role, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
        }

        public Task<IdentityResult> UpdateAsync(UsersRoles role, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
        }

        public Task<IdentityResult> DeleteAsync(UsersRoles role, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
        }

        public Task<string> GetRoleIdAsync(UsersRoles role, CancellationToken cancellationToken)
        {
            return new Task<string>(function: null, state: null, cancellationToken: default, creationOptions: Task.FromResult(role.Id).CreationOptions);
        }

        public Task<string> GetRoleNameAsync(UsersRoles role, CancellationToken cancellationToken)
        {
            //return Task.FromResult(role.RoleId);
            return _api_serverDbContext.RolesInDepartment.Where(rp => rp.Id == role.RoleId).Select(rp => rp.RoleName).FirstOrDefaultAsync();
        }

        public Task SetRoleNameAsync(UsersRoles role, string roleName, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
        }

        public Task<string> GetNormalizedRoleNameAsync(UsersRoles role, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
        }

        public Task SetNormalizedRoleNameAsync(UsersRoles role, string normalizedName, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
        }

        public Task<UsersRoles> FindByIdAsync(string roleId, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
        }

        public Task<UsersRoles> FindByNameAsync(string normalizedRoleName, CancellationToken cancellationToken)
        {
            throw new System.NotImplementedException();
        }
    }
}
