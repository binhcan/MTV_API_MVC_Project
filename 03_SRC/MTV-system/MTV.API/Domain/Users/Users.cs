using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MTV.API.Domain.Users
{
    public class Users
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        [Required]
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
        public string Ecode { get; set; }
        public string FirstName { get; set; }
        public string GivenName { get; set; }
        public List<SelectListItem> Departments { get; set; }
        public List<SelectListItem> RolesInDepartments { get; set; }

        public UserOnProjectModel[] PermissionInProjects { get; set; }
        public int[] ListProjectID { get; set; }
        public int[] ListRoleInProjectID { get; set; }

        public int DepId { get; set; }
        public int RolesInDepartmentId { get; set; }
        public int NoOfProject { get; set; }
        
        public bool IsAdmin { get; set; }
        public List<SelectListItem> AdminPermissions { get; set; }
        public int AdminDeptID { get; set; }
        public int AdminPermissionID { get; set; }
        public string Message { get; set; }
        public int flag { get; set; }
    }

    public class UserOnProjectModel
    {
        public int ProjectID { get; set; }
        public int RolesInProjectId { get; set; }
        public List<SelectListItem> Projects { get; set; }
        public List<SelectListItem> RolesInProjects { get; set; }

        //public UserOnProjectModel(List<SelectListItem> projects, List<SelectListItem> rolesInProjects, int projectID, int rolesInProjectId)
        //{
        //    Projects = projects;
        //    RolesInProjects = rolesInProjects;
        //    ProjectID = projectID;
        //    RolesInProjectId = rolesInProjectId;
        //}

    }
}
