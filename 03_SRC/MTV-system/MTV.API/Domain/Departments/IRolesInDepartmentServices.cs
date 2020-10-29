using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.Departments
{
    public interface IRolesInDepartmentServices
    {
        List<RolesInDepartments> ListAllRolesInDepartmentsByDeptID(int DeptId);
        //Task<RolesInDepartments> GetRolesInDepartmentsById(int Id);
        string GetRolesInDepartmentsById(int Id, int DeptID);
    }
}
