using System.Collections.Generic;
using System.Threading.Tasks;

namespace MTV.API.Domain.Departments
{
    public interface IRolesInDepartmentRepository
    {
        List<RolesInDepartments> ListAllRolesInDepartmentsByDeptID(int DeptId);
        //Task<RolesInDepartments> GetRolesInDepartmentsById(int Id);
        string GetRolesInDepartmentsById(int Id, int DeptID);
    }
}
