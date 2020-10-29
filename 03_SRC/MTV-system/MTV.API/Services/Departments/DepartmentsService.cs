using MTV.API.Domain.Departments;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MTV.API.Services
{
    public class DepartmentsService : IDepartmentsService
    {
        private readonly IDepartmentsRepository _deptRepository;

        public DepartmentsService(IDepartmentsRepository deptRepo)
        {
            _deptRepository = deptRepo;
        }

        public async Task<Domain.Departments.Departments> GetDepartmentsById(int Id)
        {
            return await _deptRepository.GetDepartmentsById(Id);
        }

        public async Task<IEnumerable<Domain.Departments.Departments>> ListAllDepartments()
        {
            return await _deptRepository.ListAllDepartments();
        }

        //public async Task<Departments> GetDepartmentsById(int Id)
        //{
        //    return await _deptRepository.GetDepartmentsById(Id);
        //}

        //public async Task<IEnumerable<Departments>> ListAllDepartments()
        //{
        //    return await _deptRepository.ListAllDepartments();
        //}
    }
}
