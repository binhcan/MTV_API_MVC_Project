using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.Home.PermissionContext
{
    public class RoleInProjects
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public int ProjectId { get; set; }
        public string? RoleNameInProject { get; set; }
    }    

    public interface IRoleInProjectsRepository
    {
        Task<IEnumerable<RoleInProjects>> ListRoleInProjects();
        Task<RoleInProjects> GetAsyncById(int id);
        Task AddAsync(RoleInProjects roleInProjects);
        Task PutAsync(RoleInProjects roleInProjects, int id);
        Task<RoleInProjects> DeleteAsync(int id);
        Task<IEnumerable<RoleInProjects>> ListRoleInProjectsByProjectID(int id);
    }

    public interface IRoleInProjectsServices
    {
        Task<IEnumerable<RoleInProjects>> ListRoleInProjects();
        Task<RoleInProjects> GetAsyncById(int id);
        Task AddAsync(RoleInProjects roleInProjects);
        Task PutAsync(RoleInProjects roleInProjects, int id);
        Task<RoleInProjects> DeleteAsync(int id);
        Task<IEnumerable<RoleInProjects>> ListRoleInProjectsByProjectID(int id);
    }
}
