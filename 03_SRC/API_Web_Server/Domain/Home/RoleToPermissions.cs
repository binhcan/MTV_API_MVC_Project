using API_Web_Server.Domain.Home.PermissionPart;
using API_Web_Server.Helper;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace API_Web_Server.Domain.Home
{
    public class RoleToPermissions
    {
        // Database Properties
        [Key]
        [Required(AllowEmptyStrings = false)]
        [MaxLength(450)] //Matches identity size
        public string RoleName { get; private set; }

        [Required(AllowEmptyStrings = false)]
        public string Description { get; private set; }

        // Properties
        private string _permissionsInRole;
        private RoleToPermissions() { }
        /// <summary>
        /// This returns the list of permissions in this role
        /// </summary>
        public IEnumerable<Permissions> PermissionsInRole => _permissionsInRole.UnpackPermissionsFromString();

        /// <summary>
        /// This creates the Role with its permissions
        /// </summary>
        /// <param name="roleName"></param>
        /// <param name="description"></param>
        /// <param name="permissions"></param>
        public RoleToPermissions(string roleName, string description, ICollection<Permissions> permissions)
        {
            RoleName = roleName;
            Update(description, permissions);
        }

        public void Update(string description, ICollection<Permissions> permissions)
        {
            Description = description;
            if (permissions == null || !permissions.Any())
                throw new InvalidOperationException(API_Message.error("E-COM-003"));

            _permissionsInRole = permissions.PackPermissionsIntoString();
        }
    }
}
