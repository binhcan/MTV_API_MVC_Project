using Microsoft.AspNetCore.Authorization;
using System.Linq;
using System.Threading.Tasks;
using MTV.API.Domain.Home.PermissionPart;

namespace MTV.API.Domain.Home.RolesToPermission
{
    public class PermissionHandler : AuthorizationHandler<PermissionRequirement>
    {
        protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, PermissionRequirement requirement)
        {
            var permissionsClaim =
                context.User.Claims.SingleOrDefault(c => c.Type == PermissionConstants.PackedPermissionClaimType);
            // If user does not have the scope claim, get out of here
            if (permissionsClaim == null)
                return Task.CompletedTask;

            if (permissionsClaim.Value.ThisPermissionIsAllowed(requirement.PermissionName))
                context.Succeed(requirement);

            return Task.CompletedTask;
        }
    }
}
