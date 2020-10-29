using MTV.API.Domain.Departments;
using MTV.API.Persistence.Contexts;
using MTV.API.Persistence.Repositories.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Persistence.Repositories.Roles
{
    public class RolesInDepartmentRepository : Api_ServerDbBaseRepository, IRolesInDepartmentRepository
    {
        public RolesInDepartmentRepository(Api_ServerDbContext context) : base(context) { }

        public string GetRolesInDepartmentsById(int Id, int DeptID)
        {
            return _context.RolesInDepartment.Where(x => x.Id == Id && x.DeptId == DeptID).Select(x => x.RoleName).FirstOrDefault();
        }

        public List<RolesInDepartments> ListAllRolesInDepartmentsByDeptID(int DeptId)
        {
            return _context.RolesInDepartment.Where(x => x.DeptId == DeptId).ToList();
        }
    }
}
