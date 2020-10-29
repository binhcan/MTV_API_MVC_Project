using Microsoft.EntityFrameworkCore;
using MTV.API.Domain.Home.PermissionContext;
using MTV.API.Domain.Home.PermissionPart;
using MTV.API.Persistence.Contexts;
using MTV.API.Persistence.Repositories.Common;
using MTV.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Persistence.Repositories.Home
{
    public class UserRoleInProjectsRepository : Api_ServerDbBaseRepository, IUserRoleInProjectsRepository
    {
        public UserRoleInProjectsRepository(Api_ServerDbContext context) : base(context) { }

        public async Task AddAsync(UserRoleInProjects roleInProjects)
        {
            await _context.UserRoleInProjects.AddAsync(roleInProjects);
        }

        public async Task<UserRoleInProjects> DeleteAsync(int id)
        {
            UserRoleInProjects role = await _context.UserRoleInProjects.FindAsync(id);
            if (role != null)
            {
                _context.UserRoleInProjects.Remove(role);
                return role;
            }
            else
            {
                throw new Exception(API_Message.error("E-COM-010"));
            }
        }

        public async Task<UserRoleInProjects> GetAsyncById(int id)
        {
            return await _context.UserRoleInProjects.FindAsync(id);
        }

        public async Task<IEnumerable<UserRoleInProjects>> ListAllRoleInProjects()
        {
            return await _context.UserRoleInProjects.ToListAsync();
        }

        public async Task PutAsync(UserRoleInProjects roleInProjects, int id)
        {
            var tmp = await _context.UserRoleInProjects.FindAsync(id);
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

        public async Task<string> GetPermissionByEcodeAsync(string ecode, List<Dictionary<string, string>> Permissions)
        {
            var lstId = _context.UserRoleInProjects.Where(x => x.Ecode == ecode).Select(x => x.RolesInProjectID).ToList();

            var usersRoles = new List<string>();
            string tmp_string;
            foreach (var id in lstId)
            {
                tmp_string = _context.RoleInProjects.Where(x => x.Id == id).Select(x => x.RoleNameInProject).FirstOrDefault();
                usersRoles.Add(tmp_string);
            }
            foreach (var item in Permissions)
            {
                usersRoles.Add(item["Role"]);
                usersRoles.Add(item["Departments"]);
            }

            var permissionsForUser = await _context.RoleToPermissions.Where(x => usersRoles.Contains(x.RoleName)).Distinct().ToListAsync();

            var tmp = new List<Permissions>();

            foreach (var item in permissionsForUser)
            {
                tmp.AddRange(item.PermissionsInRole.ToList());
            }

            var userModules = _context.ModulesForUsers.Where(x => x.Ecode == ecode).Select(x => x.AllowedPaidForModules).ToListAsync();

            foreach (var item in userModules.Result)
            {
                var x = item.ToString().FindPermissionViaName();
                tmp.Add((Permissions)x);
            }

            var filteredPermissions =
                from permission in tmp.Distinct().ToList()
                //Enable 2 dòng code dưới nếu muốn ràng buộc User chỉ có quyền trên project khi có quyền trên Modules
                //let moduleAttr = typeof(Permissions).GetMember(permission.ToString())[0].GetCustomAttribute<LinkedToModuleAttribute>()
                //where moduleAttr == null || userModules.HasFlag(moduleAttr.PaidForModule)
                select permission;

            return filteredPermissions.PackPermissionsIntoString();
        }

        public async Task AddRangeAsync(IEnumerable<UserRoleInProjects> lstRolesInProjects)
        {
            await _context.UserRoleInProjects.AddRangeAsync(lstRolesInProjects);
        }
    }
}
