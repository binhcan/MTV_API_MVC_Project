using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using API_Web_Server.Domain.Users;
using API_Web_Server.Extensions;
using AutoMapper;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;

namespace API_Web_Server.Controllers
{
    [EnableCors("CorsPolicy")]
    [Route("all/[controller]")]
    [ApiController]
    public class UsersRolesController : Controller
    {
        private readonly IUsersRolesServices _usersRolesServices;
        private readonly IMapper _mapper;

        //Khởi tạo object
        public UsersRolesController(IUsersRolesServices usersRolesServices, IMapper mapper)
        {
            _usersRolesServices = usersRolesServices;
            _mapper = mapper;
        }

        [HttpPost]
        public async Task<IActionResult> PostAsync([FromBody] UsersRolesRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState.GetErrorMessages());
            var user = _mapper.Map<UsersRolesRequest, UsersRoles>(request);
            var result = await _usersRolesServices.SaveAsync(user);

            if (!result.Success)
                return BadRequest(result.Message);

            var usersResource = _mapper.Map<UsersRoles, UsersRolesResource>(result.UsersRoles);
            return Ok(usersResource);
        }
    }
}
