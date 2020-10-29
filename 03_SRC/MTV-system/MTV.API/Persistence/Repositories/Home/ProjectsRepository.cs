using Microsoft.EntityFrameworkCore;
using MTV.API.Domain.Home.PermissionContext;
using MTV.API.Persistence.Contexts;
using MTV.API.Persistence.Repositories.Common;
using MTV.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Persistence.Repositories.Home
{
    public class ProjectsRepository : Api_ServerDbBaseRepository, IProjectsRepository
    {
        public ProjectsRepository(Api_ServerDbContext context) : base(context) { }

        public async Task AddAsync(Projects project)
        {
            await _context.Projects.AddAsync(project);
        }

        public async Task<Projects> DeleteAsync(int id)
        {
            Projects project = await _context.Projects.FindAsync(id);
            if (project != null)
            {
                _context.Projects.Remove(project);
                return project;
            }
            else
            {
                throw new Exception(API_Message.error("E-COM-010"));
            }
        }

        public async Task<Projects> GetAsyncById(int id)
        {
            return await _context.Projects.FindAsync(id);
        }

        public async Task<IEnumerable<Projects>> ListAllProjects()
        {
            return await _context.Projects.ToListAsync();
        }

        public async Task PutAsync(Projects project, int id)
        {
            var tmp = await _context.Projects.FindAsync(id);
            if (tmp != null)
            {
                foreach (var prop in project.GetType().GetProperties())
                {
                    foreach (var tmp_prop in tmp.GetType().GetProperties())
                    {
                        if (tmp_prop == prop)
                        {
                            if (tmp_prop.Name != "Id")
                            {
                                var x_value = prop.GetValue(project, null) ?? tmp_prop.GetValue(tmp, null);
                                tmp_prop.SetValue(tmp, x_value);
                            }

                        }
                    }
                }
                _context.Entry(tmp).State = EntityState.Modified;
            }
            else
            {
                throw new Exception(API_Message.error("E-COM-010"));
            }
        }
    }
}
