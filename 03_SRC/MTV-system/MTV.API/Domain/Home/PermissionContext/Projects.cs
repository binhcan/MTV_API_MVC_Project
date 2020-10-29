using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.Home.PermissionContext
{
    public class Projects
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string? ProjectName { get; set; }
        public int? DepartmentId { get; set; }
        public string? Detail { get; set; }
        public DateTime? CreateDate { get; set; }
    }

    public interface IProjectsRepository
    {
        Task<IEnumerable<Projects>> ListAllProjects();
        Task<Projects> GetAsyncById(int id);
        Task AddAsync(Projects project);
        Task PutAsync(Projects project, int id);
        Task<Projects> DeleteAsync(int id);
    }

    public interface IProjectsServices
    {
        Task<IEnumerable<Projects>> ListAllProjects();
        Task<Projects> GetAsyncById(int id);
        Task AddAsync(Projects project);
        Task PutAsync(Projects project, int id);
        Task<Projects> DeleteAsync(int id);
    }
}
