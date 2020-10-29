using MTV.API.Persistence.Contexts;
using Microsoft.AspNetCore.Identity;
using System;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace MTV.API.Domain.Home
{
    public class UserStore : IUserStore<Users.Users>, IUserPasswordStore<Users.Users>
    {
        private readonly Api_ServerDbContext _api_serverDbContext;

        public UserStore(Api_ServerDbContext api_serverDbContext)
        {
            _api_serverDbContext = api_serverDbContext;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                _api_serverDbContext?.Dispose();
            }
        }
        public Task<string> GetUserIdAsync(Users.Users user, CancellationToken cancellationToken)
        {
            return Task.FromResult(user.Id.ToString());
        }

        public Task<string> GetUserNameAsync(Users.Users user, CancellationToken cancellationToken)
        {
            return Task.FromResult(user.Ecode);
        }
        public Task SetUserNameAsync(Users.Users user, string ecode, CancellationToken cancellationToken)
        {
            throw new NotImplementedException(nameof(SetUserNameAsync));
        }

        public Task<string> GetNormalizedUserNameAsync(Users.Users user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException(nameof(GetNormalizedUserNameAsync));
        }

        public Task SetNormalizedUserNameAsync(Users.Users user, string normalizedName, CancellationToken cancellationToken)
        {
            return Task.FromResult((object)null);
        }

        public async Task<IdentityResult> CreateAsync(Users.Users user, CancellationToken cancellationToken)
        {
            _api_serverDbContext.Add(user);

            await _api_serverDbContext.SaveChangesAsync(cancellationToken);

            return await Task.FromResult(IdentityResult.Success);
        }

        public Task<IdentityResult> UpdateAsync(Users.Users user, CancellationToken cancellationToken)
        {
            throw new NotImplementedException(nameof(UpdateAsync));
        }

        public async Task<IdentityResult> DeleteAsync(Users.Users user, CancellationToken cancellationToken)
        {
            _api_serverDbContext.Remove(user);

            int i = await _api_serverDbContext.SaveChangesAsync(cancellationToken);

            return await Task.FromResult(i == 1 ? IdentityResult.Success : IdentityResult.Failed());
        }

        public async Task<Users.Users> FindByIdAsync(string userId, CancellationToken cancellationToken)
        {
            if (int.TryParse(userId, out int id))
            {
                return await _api_serverDbContext.Users.FindAsync(id);
            }
            else
            {
                return await Task.FromResult((Users.Users)null);
            }
        }
        public async Task<Users.Users> FindByNameAsync(string normalizedUserName, CancellationToken cancellationToken)
        {
            return await _api_serverDbContext.Users.Where(us => us.Ecode.Equals(normalizedUserName)).FirstOrDefaultAsync();
                           //.AsAsyncEnumerable().Sing
                           //.SingleOrDefault(p => p.E.Equals(normalizedUserName, StringComparison.OrdinalIgnoreCase), cancellationToken);
        }

        public Task SetPasswordHashAsync(Users.Users user, string passwordHash, CancellationToken cancellationToken)
        {
            user.Password = passwordHash;
            return Task.FromResult((object)null);
        }

        public Task<string> GetPasswordHashAsync(Users.Users user, CancellationToken cancellationToken)
        {
            return Task.FromResult(user.Password);
        }

        public Task<bool> HasPasswordAsync(Users.Users user, CancellationToken cancellationToken)
        {
            return Task.FromResult(!string.IsNullOrWhiteSpace(user.Password));
        }
    }
}
