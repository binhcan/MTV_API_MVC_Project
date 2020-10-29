using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.Home.PermissionContext
{
    public class UserRoleInProjectsResource
    {
        public int Id { get; set; }
        public string Ecode { get; set; }
        public int ProjectId { get; set; }
        public int? RolesInProjectID { get; set; }
        public string? Description { get; set; }
    }
}
