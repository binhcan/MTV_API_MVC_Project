using System.ComponentModel.DataAnnotations.Schema;

namespace MTV.API.Domain.Home.PermissionContext
{
    public class UserRoleInProjects
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Ecode { get; set; }
        public int ProjectId { get; set; }
        public int? RolesInProjectID { get; set; }
        public string? Description { get; set; }
    }
}
