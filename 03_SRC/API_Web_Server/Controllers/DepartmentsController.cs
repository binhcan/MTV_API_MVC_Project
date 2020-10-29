using API_Web_Server.Domain.Departments;
using AutoMapper;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_Web_Server.Controllers
{
    [EnableCors("CorsPolicy")]
    [Route("all/[controller]")]
    [ApiController]
    public class DepartmentsController : Controller
    {
        private readonly IDepartmentsService _departmentsService;
        private readonly IMapper _mapper;

        public DepartmentsController(IDepartmentsService departmentsService, IMapper mapper)
        {
            _departmentsService = departmentsService;
            _mapper = mapper;
        }

        [HttpGet]
        public async Task<IEnumerable<DepartmentsResource>> ListAllDepartments()
        {
            var depts = await _departmentsService.ListAllDepartments();
            var deptRes = _mapper.Map<IEnumerable<Departments>, IEnumerable<DepartmentsResource>>(depts);
            return deptRes;
        }

        [HttpGet("{Id}")]
        public Task<DepartmentsResource> ListDepartmentsById(int Id)
        {
            return null;
        }
    }
}
