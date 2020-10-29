using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_Web_Server.Domain.Users
{
    public class Users
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Ecode { get; set; }
        public string FirstName { get; set; }
        public string GivenName { get; set; }
        public string? Email { get; set; }
        public string? Description { get; set; }
        public string Password { get; set; }
        public string? Address { get; set; }
        public decimal? Phone { get; set; }
        public string? About { get; set; }
        public string? Facebook { get; set; }
        public string? Avatar { get; set; }
        public bool? SettingDarkMode { get; set; }
        public string SidebarColor { get; set; }
        [NotMapped]
        public string? Token { get; set; }
        [NotMapped]
        public List<Dictionary<string, string>> Permissions { get; set; }
    }

    public class UserFullInfo
    {
        public int Id { get; set; }
        public string Ecode { get; set; }
        public string FirstName { get; set; }
        public string GivenName { get; set; }
        public string Email { get; set; }
        public string Description { get; set; }
        public string Password { get; set; }
        public int DeptId { get; set; }
        public string DepartmentName { get; set; }
        public string RoleName { get; set; }
        [NotMapped]
        public string Token { get; set; }

    }

    public class UserModel
    {
        public Users User { get; set; }
        public IEnumerable<Departments.Departments>  Departments { get; set; }
        public IEnumerable<Departments.RolesInDepartments> RolesInDepartments { get; set; }

    }
}
