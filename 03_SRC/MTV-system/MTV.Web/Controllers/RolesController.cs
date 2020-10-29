using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MTV.API.Domain.Home;
using MTV.API.Domain.Home.PermissionPart;
using MTV.API.Domain.Home.RolesToPermission;
using MTV.API.Persistence.Repositories.Home;

namespace MTV.Web.Controllers
{
    [Authorize]
    //[Route("[controller]")]
    [HasPermission(Permissions.ADMINISTRATOR)]
    public class RolesController : Controller
    {
        private readonly IRoleToPermissionsRepository _roleToPermissionsRepository;

        public RolesController(IRoleToPermissionsRepository roleToPermissionsRepository)
        {
            _roleToPermissionsRepository = roleToPermissionsRepository;
        }

        [HasPermission(Permissions.RoleRead)]
        public IActionResult Index()
        {
            return View(new RolePageDto(_roleToPermissionsRepository.ListRolesWithPermissionsExplained().ToList()));
        }

        [HasPermission(Permissions.RoleChange)]
        public IActionResult Create()
        {
            return View(PermissionDisplay.GetPermissionsToDisplay(typeof(Permissions)));
        }
    }
}
