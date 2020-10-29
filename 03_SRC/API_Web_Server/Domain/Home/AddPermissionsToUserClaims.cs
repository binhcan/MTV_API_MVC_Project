using API_Web_Server.Domain.Home.RolesToPermission;
using API_Web_Server.Domain.Users;
using API_Web_Server.Persistence.Contexts;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Home
{
    public class AddPermissionsToUserClaims : UserClaimsPrincipalFactory<IdentityUser, IdentityRole>
    {
        private readonly Api_ServerDbContext _apiServerDbContext;

        public AddPermissionsToUserClaims(
            UserManager<IdentityUser> userManager,
            RoleManager<IdentityRole> roleManager,
            IOptions<IdentityOptions> optionsAccessor,
            Api_ServerDbContext apiServerDbContext)
            : base(userManager, roleManager, optionsAccessor)
        {
            _apiServerDbContext = apiServerDbContext;
        }

        protected override async Task<ClaimsIdentity> GenerateClaimsAsync(IdentityUser user)
        {
            var identity = await base.GenerateClaimsAsync(user);
            var rtoPCalcer = new CalcAllowedPermissions(_apiServerDbContext);
            identity.AddClaim(new Claim(PermissionConstants.PackedPermissionClaimType,
                await rtoPCalcer.CalcPermissionsForUser(identity.Claims)));
            return identity;
        }
    }
}
