﻿using Microsoft.AspNetCore.Authorization;
using System;

namespace MTV.API.Domain.Home.RolesToPermission
{
    public class PermissionRequirement : IAuthorizationRequirement
    {
        public PermissionRequirement(string permissionName)
        {
            PermissionName = permissionName ?? throw new ArgumentNullException(nameof(permissionName));
        }

        public string PermissionName { get; }
    }
}
