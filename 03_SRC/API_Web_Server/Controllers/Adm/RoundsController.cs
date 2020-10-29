using API_Web_Server.Domain.Adm.LuckyDraw;
using API_Web_Server.Domain.Users;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Dynamic;
using System.Linq;
using System.Threading.Tasks;

namespace API_Web_Server.Controllers.Adm
{
    [Authorize]
    public class RoundsController : Controller
    {
        private readonly IRewardsService _rewardsService;
        private readonly IResultsServices _resultsService;
        private readonly IUsersService _usersService;
        private readonly IRoundsServices _roundsServices;

        public RoundsController(IRewardsService rewardsService, IResultsServices resultsService, IUsersService usersService, IRoundsServices roundsServices)
        {
            _rewardsService = rewardsService;
            _resultsService = resultsService;
            _usersService = usersService;
            _roundsServices = roundsServices;
        }

        public async Task<ActionResult> Index(int id)
        {
            var model = await _roundsServices.GetRoundsAsyncById(id);
            //return PartialView("~/Views/Rounds/_Stages.cshtml", model);
            return PartialView("~/Views/Rewards/_Stages.cshtml", model);
        }

        public Task<ActionResult> Details(int roundID)
        {
            return null;
        }
    }
}
