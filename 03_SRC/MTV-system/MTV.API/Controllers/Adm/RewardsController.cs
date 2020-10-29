using MTV.API.Domain.Adm.LuckyDraw;
using MTV.API.Domain.Users;
using MTV.API.Helper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Dynamic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Controllers.Adm
{
    [Authorize]
    public class RewardsController : Controller
    {
        private readonly IRewardsService _rewardsService;
        private readonly IResultsServices _resultsService;
        private readonly IUsersService _usersService;
        private readonly IRoundsServices _roundsServices;

        public RewardsController(IRewardsService rewardsService, IResultsServices resultsService, IUsersService usersService, IRoundsServices roundsServices)
        {
            _rewardsService = rewardsService;
            _resultsService = resultsService;
            _usersService = usersService;
            _roundsServices = roundsServices;
        }

        public async Task<ActionResult> Index()
        {
            var results = await _rewardsService.ListAllRewards();
            var totalWinner =  _resultsService.ListAllResults().Result.Count();
            ViewBag.Message = results;
            ViewBag.Total = totalWinner;
            return View();
        }

        // GET: Users/Create
        [Route("Create")]
        public ActionResult Create(Rewards reward)
        {
            return View(reward);
        }

        //Tạo mới 1 phần quà của lucky draw.
        [HttpPost]
        public async Task<ActionResult> Post2API(IFormCollection collection)
        {
            try
            {
                // HTTP POST
                var resReward = new Rewards()
                {
                    Name = collection["Name"],
                    Quantity = Int32.Parse(collection["Quantity"]),
                    Image = collection["Image"],
                    Round = Int32.Parse(collection["Round"]),
                    NoOfRound = Int32.Parse(collection["NoOfRound"]),
                    CreateDate = DateTime.Now,
                };

                await _rewardsService.AddAsync(resReward);
                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("Index");
            }
        }

        //Details
        [Route("Drawing")]
        public async Task<ActionResult> Details(int id)
        {
            dynamic mymodel = new ExpandoObject();
            var rnd = new Random();
            var reward = await _rewardsService.GetAsyncById(id);
            var allEmployee = await _usersService.ListAllUsers();
            var lstStage = await _roundsServices.ListAllStageByRound(reward.Round);


            var wonPeople = await _resultsService.ListAllResults();
            var emp = new Users();
            foreach (var item in wonPeople)
            {
                emp = await _usersService.GetAsyncByEcode(item.Ecode);
                //allEmployee = allEmployee.Where(val => val.Ecode != emp.Ecode).ToArray();
            }

            var winners = allEmployee.OrderBy(x => rnd.Next()).Take(reward.Quantity).ToArray();



            foreach (var item in winners)
            {
                var winner2Insert = new Results
                {
                    Ecode = item.Ecode,
                    WinOnRound = reward.Round,
                    WinOnStage = 1
                };
                await _resultsService.AddResultsAsync(winner2Insert);
            }

            var totalWinner = _resultsService.ListAllResults().Result.Count();

            mymodel.Rewards = reward;
            mymodel.Stages = lstStage;
            mymodel.Winners = winners;
            mymodel.TotalWinner = totalWinner;
            //ViewBag.Message = results;
            return View(mymodel);
        }
    }
}
