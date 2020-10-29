using MTV.API.Domain.Home.RolesToPermission;
using MTV.API.Persistence.Contexts;
using MTV.API.Persistence.Repositories.Common;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace MTV.API.Helper
{
    public class ClaimsProvider : Api_ServerDbBaseRepository, IClaimsTransformation
    {
        public ClaimsProvider(Api_ServerDbContext context) : base(context) { }

        public Task<ClaimsPrincipal> TransformAsync(ClaimsPrincipal principal)
        {
            if (principal == null)
            {
                throw new ArgumentNullException(nameof(principal));
            }
            var ecode = principal.FindFirst(ClaimTypes.Name);
            var roleOfEmp = _context.UserWithRoles.Where(user => user.Ecode == ecode.Value).ToListAsync();
            //return claim != null ? claim.Value : null;

            var ci = (ClaimsIdentity)principal.Identity;
            var c = new Claim("Permissions", "H4-00100011001300120030");
            ci.AddClaim(c);
            c = new Claim(ClaimTypes.Role, "Manager");
            ci.AddClaim(c);
            c = new Claim(ClaimTypes.Role, "Admin");
            ci.AddClaim(c);
            return Task.FromResult(principal);
        }

        //private readonly RequestDelegate _next;

        //public ClaimsProvider(RequestDelegate next)
        //{
        //    _next = next;
        //}

        //public async Task InvokeAsync(HttpContext httpContext)
        //{
        //    if (httpContext.User != null && httpContext.User.Identity.IsAuthenticated)
        //    {
        //        //var rtoPCalcer = new CalcAllowedPermissions(_apiServerDbContext);
        //        //identity.AddClaim(new Claim(PermissionConstants.PackedPermissionClaimType,
        //        //    await rtoPCalcer.CalcPermissionsForUser(identity.Claims)));
        //        //return identity;
        //        var claims = new List<Claim>
        //        {
        //            new Claim("http://schemas.microsoft.com/ws/2008/06/identity/claims/role", "Admin"),
        //            new Claim("http://schemas.microsoft.com/ws/2008/06/identity/claims/role", "Manager"),
        //            new Claim("Permissions", "H4-0021003000310010001100130012"),
        //            //new Claim(PermissionConstants.PackedPermissionClaimType.ToString(), await rtoPCalcer.CalcPermissionsForUser(identity.Claims))
        //        };
        //        var appIdentity = new ClaimsIdentity(claims);
        //        httpContext.User.AddIdentity(appIdentity);
        //    }

        //    await _next(httpContext);
        //}
    }
}
