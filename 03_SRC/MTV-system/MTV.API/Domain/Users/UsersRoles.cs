using System.ComponentModel.DataAnnotations.Schema;

namespace MTV.API.Domain.Users
{
    public class UsersRoles
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Ecode { get; set; }
        public int DeptId { get; set; }
        public int RoleId { get; set; }
    }
}
