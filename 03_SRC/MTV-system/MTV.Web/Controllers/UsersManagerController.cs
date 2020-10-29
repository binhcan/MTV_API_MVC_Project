using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.CodeAnalysis.FlowAnalysis;
using MTV.API.Domain.Departments;
using MTV.API.Domain.Home;
using MTV.API.Domain.Home.PermissionContext;
using MTV.API.Domain.Home.PermissionPart;
using MTV.API.Domain.Home.RolesToPermission;
using MTV.API.Domain.Users;
using MTV.API.Extensions;
using MTV.Utilities;

namespace MTV.Web.Controllers
{
    [Authorize]
    [Route("[controller]")]
    [HasPermission(Permissions.ADMINISTRATOR)]
    public class UsersManagerController : Controller
    {
        private readonly IUsersService _usersService;
        private readonly IUsersRolesServices _userRolesService;
        private readonly IDepartmentsService _departmentsService;
        private readonly IRolesInDepartmentServices _rolesInDepartmentServices;
        private readonly IProjectsServices _projectServices;
        private readonly IRoleInProjectsServices _roleInProjectsServices;
        private readonly IModulesForUserRepository _modulesForUserRepository;
        private readonly IRoleToPermissionsRepository _roleToPermissionsRepository;

        public UsersManagerController(IUsersService usersService, IUsersRolesServices userRolesService, IDepartmentsService departmentsService, IRolesInDepartmentServices rolesInDepartmentServices, IProjectsServices projectServices, IRoleInProjectsServices roleInProjectsServices, IModulesForUserRepository modulesForUserRepository, IRoleToPermissionsRepository roleToPermissionsRepository)
        {
            _usersService = usersService;
            _userRolesService = userRolesService;
            _departmentsService = departmentsService;
            _rolesInDepartmentServices = rolesInDepartmentServices;
            _projectServices = projectServices;
            _roleInProjectsServices = roleInProjectsServices;
            _modulesForUserRepository = modulesForUserRepository;
            _roleToPermissionsRepository = roleToPermissionsRepository;
        }

        public IActionResult Index()
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
                Avatar = HttpContext.Session.GetString("Avatar"),
                //SettingDarkMode = bool.Parse(HttpContext.Session.GetString("SettingDarkMode")),
                SidebarColor = HttpContext.Session.GetString("SidebarColor")

            };
            return View(user);
        }

        [Route("Manager")]
        [HasPermission(Permissions.UserRead)]
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
        [HasPermission(Permissions.UserChange)]
        public async Task<ActionResult> Create(string ecode, string firstName, string givenName, int DepId, int RolesInDepartmentId, int[] ListProjectID, int[] ListRoleInProjectID, int NoOfProject, bool isAdmin, int AdminPermissionID, int flag, string message=null)
        {
            if (flag != 0)
            {
                NoOfProject = flag;
            }

            if (flag > 20)
            {
                return RedirectToAction("Index");
            }

            ViewData["No"] = NoOfProject;

            //var lstDepartment = _departmentsService.ListAllDepartments().Result.Where(x => x.DepartmentName != "Administrator");
            var lstDepartment = _departmentsService.ListAllDepartments().Result;

            var xxx = lstDepartment.FirstOrDefault();
            var valueGetRoleInDepartment = DepId == 0 ? xxx.Id : DepId;
            var lstRolesInDepartment = _rolesInDepartmentServices.ListAllRolesInDepartmentsByDeptID(valueGetRoleInDepartment);

            List<SelectListItem> Departments = new List<SelectListItem>();
            List<SelectListItem> RolesInDepartments = new List<SelectListItem>();
            foreach (var dept in lstDepartment)
            {
                if (!dept.DepartmentName.Equals("Administrator"))
                {
                    Departments.Add(new SelectListItem { Text = dept.DepartmentName, Value = dept.Id.ToString() });
                }
            }

            foreach (var roles in lstRolesInDepartment)
            {
                RolesInDepartments.Add(new SelectListItem { Text = roles.RoleName, Value = roles.Id.ToString() });
            }

            var lstProjectID = ListProjectID.Length == 0 ? new int[NoOfProject + 1]: ListProjectID;
            var lstRoleInProjectID = ListRoleInProjectID.Length == 0? new int[NoOfProject + 1]: ListRoleInProjectID;

            var lstPermisionOnProjects = new UserOnProjectModel[NoOfProject + 1];

            for (int i = 0; i < lstPermisionOnProjects.Length; i++)
            {
                List<SelectListItem> Projects = new List<SelectListItem>();
                List<SelectListItem> RolesInProjects = new List<SelectListItem>();

                var lstProjects = _projectServices.ListAllProjects();
                foreach (var project in lstProjects.Result)
                {
                    Projects.Add(new SelectListItem { Text = project.ProjectName, Value = project.Id.ToString() });
                }

                var yyy = lstProjects.Result.FirstOrDefault();
                var projectId = lstProjectID[i] == 0 ? yyy.Id : lstProjectID[i];
                var lstRolesInProjects = _roleInProjectsServices.ListRoleInProjectsByProjectID(projectId);
                foreach (var role in lstRolesInProjects.Result)
                {
                    RolesInProjects.Add(new SelectListItem { Text = role.RoleNameInProject, Value = role.Id.ToString() });
                }
                lstPermisionOnProjects[i] = new UserOnProjectModel { Projects = Projects, RolesInProjects = RolesInProjects };

            }
            List<SelectListItem> adminPermissions = new List<SelectListItem>();
            var adminDeptID = lstDepartment.Where(x => x.DepartmentName.Equals("Administrator")).FirstOrDefault().Id;
            if (isAdmin)
            {
                var lstRolesAdmin =  _rolesInDepartmentServices.ListAllRolesInDepartmentsByDeptID(adminDeptID);

                foreach (var item in lstRolesAdmin)
                {
                    adminPermissions.Add(new SelectListItem { Text = item.RoleName, Value = item.Id.ToString() });
                }
            }

            var user = new UserModel
            {
                Ecode = ecode ?? "",
                FirstName = firstName ?? "",
                GivenName = givenName ?? "",
                Departments = Departments,
                RolesInDepartments = RolesInDepartments,
                PermissionInProjects = lstPermisionOnProjects,
                ListProjectID = lstProjectID,
                ListRoleInProjectID = lstRoleInProjectID,
                DepId = DepId,
                RolesInDepartmentId = RolesInDepartmentId,
                NoOfProject = NoOfProject,
                IsAdmin = isAdmin,
                AdminPermissions = adminPermissions,
                AdminPermissionID = AdminPermissionID,
                AdminDeptID = adminDeptID,
                Message = message?? "",
                flag = NoOfProject,
            };
            return View(user);
        }

        [HttpPost]
        //[ValidateAntiForgeryToken]
        [HasPermission(Permissions.UserChange)]
        public async Task<ActionResult> PostDataCreate(IFormCollection collection, UserModel model)
        {
            try
            {
                var user = new Users
                {
                    Ecode = collection["Ecode"],
                    FirstName = collection["FirstName"],
                    GivenName = collection["GivenName"],
                    Password = "Mtv@123456",
                };

                List<(int, int)> lstPermissonInProjects = new List<(int, int)>();
                List<(int, int)> lstPermissonInDepartments = new List<(int, int)>();
                int i = 0;
                while (!String.IsNullOrEmpty(collection["ListProjectID[{0}]".FormatWith(i)]))
                {
                    lstPermissonInProjects.Add((Int32.Parse(collection["ListProjectID[{0}]".FormatWith(i)]), Int32.Parse(collection["ListRoleInProjectID[{0}]".FormatWith(i)])));
                    i++;
                }

                lstPermissonInDepartments.Add((Int32.Parse(collection["DepId"]), Int32.Parse(collection["RolesInDepartmentId"])));
                if (!String.IsNullOrEmpty(collection["AdminPermissionID"]))
                {
                    lstPermissonInDepartments.Add((Int32.Parse(collection["AdminDeptID"]), Int32.Parse(collection["AdminPermissionID"])));
                }

                await _usersService.CreateUserWithPermission(user, lstPermissonInDepartments, lstPermissonInProjects);
                return RedirectToAction(nameof(UsersManager), new { searchString = user.Ecode });
            }
            catch(Exception ex)
            {
                model.Message = ex.Message;
                return RedirectToAction(nameof(Create), model);
            }
        }

    }
}
