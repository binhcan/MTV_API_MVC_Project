using MTV.API.Domain.Home.PermissionPart;
using Microsoft.AspNetCore.Authorization;
using System;
namespace MTV.API.Domain.Home.RolesToPermission
{
    [AttributeUsage(AttributeTargets.Method | AttributeTargets.Class, AllowMultiple =true, Inherited = false)]
    public class HasPermissionAttribute : AuthorizeAttribute
    {
        public HasPermissionAttribute(Permissions permission) : base(permission.ToString()) { }
    }
}
