using API_Web_Server.Domain;
using API_Web_Server.Domain.Departments;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Web_Server.Services
{
    public class DepartmentsService : IDepartmentsService
    {
        private readonly IDepartmentsRepository _deptRepository;
        private readonly IUnitOfWork _unitOfWork;

        public DepartmentsService(IDepartmentsRepository deptRepo, IUnitOfWork uow)
        {
            _deptRepository = deptRepo;
            _unitOfWork = uow;
        }

        public async Task<Departments> GetDepartmentsById(int Id)
        {
            return await _deptRepository.GetDepartmentsById(Id);
        }

        public async Task<IEnumerable<Departments>> ListAllDepartments()
        {
            return await _deptRepository.ListAllDepartments();
        }
    }
}
