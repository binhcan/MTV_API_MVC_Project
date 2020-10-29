using System;
using System.ComponentModel;
using System.Linq;

namespace API_Web_Server.Domain.Home.PermissionPart
{
    public static class PermissionChecker
    {
        public static bool ThisPermissionIsAllowed(this string packedPermissions, string permissionName)
        {
            var usersPermissions = packedPermissions.UnpackPermissionsFromString().ToArray();

            if (!Enum.TryParse(permissionName, true, out Permissions permissionToCheck))
                throw new InvalidEnumArgumentException($"{permissionName} could not be converted to a {nameof(Permissions)}.");

            return usersPermissions.Contains(permissionToCheck);
        }
    }
}
