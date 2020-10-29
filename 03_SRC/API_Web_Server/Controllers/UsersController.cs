using API_Web_Server.Domain.Departments;
using API_Web_Server.Domain.Home;
using API_Web_Server.Domain.Home.PermissionPart;
using API_Web_Server.Domain.Home.RolesToPermission;
using API_Web_Server.Domain.Users;
using API_Web_Server.Extensions;
using API_Web_Server.Helper;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Web_Server.Controllers
{
    [Authorize]
    [EnableCors("CorsPolicy")]
    [Route("[controller]")]
    [ApiController]
    public class UsersController : Controller
    {
        private readonly IUsersService _usersService;
        private readonly IUsersRolesRepository _userRolesRepository;
        private readonly IDepartmentsRepository _departmentRepository;
        private readonly IRolesInDepartmentRepository _rolesInDepartmentRepository;
        private readonly IModulesForUserRepository _modulesForUserRepository;
        private readonly IRoleToPermissionsRepository _roleToPermissionsRepository;
        private readonly IMapper _mapper;

        //Khởi tạo object
        public UsersController(IUsersService usersService, IUsersRolesRepository userRolesRepository, IDepartmentsRepository departmentRepository, IRolesInDepartmentRepository rolesInDepartmentRepository, IModulesForUserRepository modulesForUserRepository, IRoleToPermissionsRepository roleToPermissionsRepository, IMapper mapper)
        {
            _usersService = usersService;
            _userRolesRepository = userRolesRepository;
            _departmentRepository = departmentRepository;
            _rolesInDepartmentRepository = rolesInDepartmentRepository;
            _modulesForUserRepository = modulesForUserRepository;
            _roleToPermissionsRepository = roleToPermissionsRepository;
            _mapper = mapper;
        }

        [Route("Index")]
        public async Task<ActionResult> Index()
        {
            var user = new Users
            {
                FirstName = HttpContext.Session.GetString("Fname"),
                GivenName = HttpContext.Session.GetString("Gname"),
                Email = HttpContext.Session.GetString("Email"),
                Description = HttpContext.Session.GetString("Description"),
                Address = HttpContext.Session.GetString("Address"),
                //Phone = decimal.Parse(HttpContext.Session.GetString("Phone")),
                About = HttpContext.Session.GetString("About"),
                Facebook = HttpContext.Session.GetString("Facebook"),
                Avatar = HttpContext.Session.GetString("Avatar"),
                //SettingDarkMode = bool.Parse(HttpContext.Session.GetString("SettingDarkMode")),
                SidebarColor = HttpContext.Session.GetString("SidebarColor")

            };
            return View(user);
        }

        [Route("Manager")]
        //[HasPermission(Permissions.AI)] // Calling as a policy
        public async Task<ActionResult> UsersManager(string currentFilter, string searchString, int pageNumber = 1)
        {
            var lstUsers = await _usersService.ListAllUsers();
            if (searchString != null)
            {
                pageNumber = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewData["CurrentFilter"] = searchString;

            if (!String.IsNullOrEmpty(searchString))
            {
                lstUsers = lstUsers.Where(user => user.Ecode.Contains(searchString) || user.FirstName.Contains(searchString) || user.GivenName.Contains(searchString));
            }

            int pageSize = 30;
            return View(await Pagination<UserFullInfo>.CreateAsync(lstUsers, pageNumber, pageSize));
        }

        [Route("Create")]
        public async Task<ActionResult> Create(int DeptId = 0)
        {
            //dynamic tranfer = new ExpandoObject();
            //tranfer.Department = lstDepartment;
            //tranfer.RolesInDepartment = lstRolesInDepartment;

            var lstDepartment = _departmentRepository.ListAllDepartments();
            var xxx = lstDepartment.Result.FirstOrDefault();
            var valueGetRoleInDepartment = DeptId == 0 ? xxx.Id : DeptId;
            var lstRolesInDepartment = _rolesInDepartmentRepository.ListAllRolesInDepartmentsByDeptID(valueGetRoleInDepartment);
            ViewData["DeptID"] = DeptId;
            var user = new UserModel
            {
                User = new Users(),
                Departments = await lstDepartment,
                RolesInDepartments = lstRolesInDepartment
            };
            //ViewBag.Departments = new SelectList((System.Collections.IEnumerable)lstDepartment, "Id", "DepartmentName");
            //ViewBag.RolesInDepartment = lstRolesInDepartment;
            return View(user);
        }

        [HttpPost]
        //[ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(IFormCollection collection)
        {
            try
            {
                var user = new Users
                {
                    Ecode = collection["Data"],
                };
                await _usersService.SaveAsync(user);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        //==============================================================================================================
        //=========================================== API LOGIC IMPLEMENT AREA =========================================
        //==============================================================================================================
        // GET: /Users/api/
        [AllowAnonymous]
        [HttpGet]
        [Route("API")]
        public async Task<IEnumerable<UsersResource>> GetUsersAsync()
        {
            Logging.iLogger.LogInformation("Log messags API");
            var users = await _usersService.ListAllUsers();
            var usersResources = _mapper.Map<IEnumerable<UserFullInfo>, IEnumerable<UsersResource>>(users);
            return usersResources;
        }

        // GET: api/Users/id
        [HttpGet("API/{id}")]
        public async Task<UsersResource> GetUsersAsyncById(int id)
        {
            var users = await _usersService.GetAsyncById(id);
            var usersResources = _mapper.Map<Users, UsersResource>(users);
            return usersResources;
        }

        // GET: api/Users/eCode/pw
        [AllowAnonymous]
        [HttpGet("API/{eCode}/{password}")]
        public async Task<UsersResource> Authenticate(string eCode, string password)
        {
            var user = await _usersService.Authenticate(eCode, password);
            if (user.Token != null)
            {
                if (user.Ecode == "111070")
                {
                    HttpContext.Session.SetString("Permissions", "H4-0010001100130012");
                }
                else
                {
                    HttpContext.Session.SetString("Permissions", "H4-0021003000310010001100130012");
                }
                HttpContext.Session.SetString("Fname", user.FirstName ?? "");
                HttpContext.Session.SetString("Gname", user.GivenName ?? "");
                HttpContext.Session.SetString("Email", user.Email ?? "");
                HttpContext.Session.SetString("Description", user.Description ?? "");
                HttpContext.Session.SetString("Address", user.Address ?? "Meiko Towada Việt Nam");
                HttpContext.Session.SetString("Phone", (user.Phone ?? 0123456789).ToString());
                HttpContext.Session.SetString("About", user.About ?? "");
                HttpContext.Session.SetString("Facebook", user.Facebook ?? "");
                HttpContext.Session.SetString("Avatar", user.Avatar ?? "");
                HttpContext.Session.SetString("SettingDarkMode", user.SettingDarkMode.ToString());
                HttpContext.Session.SetString("SidebarColor", user.SidebarColor ?? "");
                HttpContext.Session.SetString("JWToken", user.Token);
            }
            //if (users == null)
            //    return BadRequest(error: ModelState.GetErrorMessages());
            var usersResources = _mapper.Map<Users, UsersResource>(user);
            return usersResources;
        }

        // POST: Users/API
        [HttpPost("API")]
        public async Task<IActionResult> PostAsync([FromBody] UsersRequest usersRequest)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState.GetErrorMessages());
            var user = _mapper.Map<UsersRequest, Users>(usersRequest);
            var result = await _usersService.SaveAsync(user);

            if (!result.Success)
                return BadRequest(result.Message);

            var usersResource = _mapper.Map<Users, UsersResource>(result.Users);
            return Ok(usersResource);
        }

        public IActionResult PostAsync2([FromBody] UsersRequest usersRequest)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState.GetErrorMessages());
            var user = _mapper.Map<UsersRequest, Users>(usersRequest);
            var result = _usersService.SaveAsync(user);

            //if (!result.Success)
            //    return BadRequest(result.Message);

            //var usersResource = _mapper.Map<Users, UsersResource>(result.Users);
            return Ok(result);
        }

        // PUT: api/Users/5
        [HttpPut("API/{id}")]
        public async Task<IActionResult> PutAsync(UsersRequest usersRequest, int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState.GetErrorMessages());
            }
            var user = _mapper.Map<UsersRequest, Users>(usersRequest);
            var result = await _usersService.PutAsync(user, id);

            if (!result.Success)
                return BadRequest(result.Message);

            var usersResource = _mapper.Map<Users, UsersResource>(result.Users);
            return Ok(usersResource);
        }

        // DELETE: api/Users/5
        [HttpDelete("API/{id}")]
        public async Task<IActionResult> DeleteAsync(int id)
        {
            //if (!ModelState.IsValid)
            //{
            //    return BadRequest(ModelState.GetErrorMessages());
            //}
            //var user = _mapper.Map<UsersRequest, Users>(usersRequest);
            var result = await _usersService.DeleteAsync(id);

            if (!result.Success)
                return BadRequest(result.Message);

            var usersResource = _mapper.Map<Users, UsersResource>(result.Users);
            return Ok(usersResource);
        }
    }
}