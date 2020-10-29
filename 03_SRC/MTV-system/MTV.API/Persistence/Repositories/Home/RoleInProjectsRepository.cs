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
    public class RoleInProjectsRepository : Api_ServerDbBaseRepository, IRoleInProjectsRepository
    {
        public RoleInProjectsRepository(Api_ServerDbContext context) : base(context) { }

        public async Task AddAsync(RoleInProjects roleInProjects)
        {
            await _context.RoleInProjects.AddAsync(roleInProjects);
        }

        public async Task<RoleInProjects> DeleteAsync(int id)
        {
            RoleInProjects rolepr = await _context.RoleInProjects.FindAsync(id);
            if (rolepr != null)
            {
                _context.RoleInProjects.Remove(rolepr);
                return rolepr;
            }
            else
            {
                throw new Exception(API_Message.error("E-COM-010"));
            }
        }

        public async Task<RoleInProjects> GetAsyncById(int id)
        {
            return await _context.RoleInProjects.FindAsync(id);
        }

        public async Task<IEnumerable<RoleInProjects>> ListRoleInProjects()
        {
            return await _context.RoleInProjects.ToListAsync();
        }

        public async Task PutAsync(RoleInProjects roleInProjects, int id)
        {
            var tmp = await _context.RoleInProjects.FindAsync(id);
            if (tmp != null)
            {
                foreach (var prop in roleInProjects.GetType().GetProperties())
                {
                    foreach (var tmp_prop in tmp.GetType().GetProperties())
                    {
                        if (tmp_prop == prop)
                        {
                            if (tmp_prop.Name != "Id")
                            {
                                var x_value = prop.GetValue(roleInProjects, null) ?? tmp_prop.GetValue(tmp, null);
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

        public async Task<IEnumerable<RoleInProjects>> ListRoleInProjectsByProjectID(int id)
        {
            return await _context.RoleInProjects.Where(x => x.ProjectId == id).ToListAsync();
        }
    }
}
