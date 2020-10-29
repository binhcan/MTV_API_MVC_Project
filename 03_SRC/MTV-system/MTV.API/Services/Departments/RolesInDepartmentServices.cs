using MTV.API.Domain.Departments;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Services.Departments
{
    public class RolesInDepartmentServices : IRolesInDepartmentServices
    {
        private readonly IRolesInDepartmentRepository _rolesInDeptRepo;

        public RolesInDepartmentServices(IRolesInDepartmentRepository rolesInDeptRepo)
        {
            _rolesInDeptRepo = rolesInDeptRepo;
        }

        public string GetRolesInDepartmentsById(int Id, int DeptID)
        {
            return _rolesInDeptRepo.GetRolesInDepartmentsById(Id, DeptID);
        }

        public List<RolesInDepartments> ListAllRolesInDepartmentsByDeptID(int DeptId)
        {
            return _rolesInDeptRepo.ListAllRolesInDepartmentsByDeptID(DeptId);
        }
    }
}
