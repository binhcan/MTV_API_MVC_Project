using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Web_Server.Domain.Departments
{
    public interface IDepartmentsRepository
    {
        Task<IEnumerable<Departments>> ListAllDepartments();
        Task<Departments> GetDepartmentsById(int Id);
    }
}
