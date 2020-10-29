using API_Web_Server.Domain.Home.PermissionPart;
using System;
using System.Linq;
using System.Security.Claims;

namespace API_Web_Server.Domain.Home.RolesToPermission
{
    public static class PermissionExtensions
    {
        /// <summary>
        /// This returns true if the current user has the permission
        /// </summary>
        /// <param name="user"></param>
        /// <param name="permission"></param>
        /// <returns></returns>
        public static bool UserHasThisPermission(this ClaimsPrincipal user, Permissions permission)
        {
            var permissionClaim =
                user?.Claims.SingleOrDefault(x => x.Type == PermissionConstants.PackedPermissionClaimType);
            return permissionClaim?.Value.UnpackPermissionsFromString().Contains(permission) == true;
        }
    }
}
