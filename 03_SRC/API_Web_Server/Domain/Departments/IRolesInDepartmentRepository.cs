using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Departments
{
    public interface IRolesInDepartmentRepository
    {
        List<RolesInDepartments> ListAllRolesInDepartmentsByDeptID(int DeptId);
        //Task<RolesInDepartments> GetRolesInDepartmentsById(int Id);
        string GetRolesInDepartmentsById(int Id, int DeptID);
    }
}
