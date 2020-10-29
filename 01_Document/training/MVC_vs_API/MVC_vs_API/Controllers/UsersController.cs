using MVC_vs_API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace MVC_vs_API.Controllers
{
    public class UsersController : Controller
    {
        // GET: Users
        public async Task<ActionResult> Index()
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("http://10.120.105.25:5000/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                // HTTP GET ALL
                HttpResponseMessage response = await client.GetAsync("all/Users/");
                if (response.IsSuccessStatusCode)
                {
                    List<Users> userList = new List<Users>();
                    userList = await response.Content.ReadAsAsync<List<Users>>();
                    ViewBag.Message = userList;
                }
            }
            return View();
        }

        // GET: Users/Details/5
        public async Task<ActionResult> Details(int id)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("http://10.120.105.25:5000/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                // HTTP GET
                HttpResponseMessage response = await client.GetAsync(String.Format("all/Users/{0}", id));
                if (response.IsSuccessStatusCode)
                {
                    Users user = await response.Content.ReadAsAsync<Users>();
                    ViewBag.Message = user;
                }
            }
            return View();
        }

        // GET: Users/Create
        public ActionResult Create(Users model)
        {
            return View(model);
        }

        // POST: Users/Create
        [HttpPost]
        public async Task<ActionResult> Post2API(FormCollection collection)
        {
            try
            {
                // HTTP POST
                var resUser = new Users()
                {
                    Ecode = collection["Ecode"],
                    FirstName = collection["FirstName"],
                    GivenName = collection["GivenName"],
                    Email = collection["Email"],
                    Password = collection["Password"],
                };

                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("http://10.120.105.25:5000/");
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    // HTTP GET ALL
                    HttpResponseMessage response = await client.PostAsJsonAsync("all/Users", resUser);
                    if (response.IsSuccessStatusCode)
                    {
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        return View();
                    }
                }
            }
            catch
            {
                return View();
            }
        }

        // GET: Users/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("http://10.120.105.25:5000/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                // HTTP GET
                HttpResponseMessage response = await client.GetAsync(String.Format("all/Users/{0}", id));
                if (response.IsSuccessStatusCode)
                {
                    Users user = await response.Content.ReadAsAsync<Users>();
                    return View(user);
                }
            }
            return View();
        }

        // POST: Users/Edit/5
        [HttpPost]
        public async Task<ActionResult> UpdateUser(FormCollection collection)
        {
            try
            {
                // HTTP POST
                var resUser = new Users()
                {
                    Id = Int32.Parse(collection["Id"]),
                    Ecode = collection["Ecode"],
                    FirstName = collection["FirstName"],
                    GivenName = collection["GivenName"],
                    Email = collection["Email"],
                    Password = collection["Password"],
                };

                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("http://10.120.105.25:5000/");
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    // HTTP POST
                    HttpResponseMessage response = await client.PutAsJsonAsync(String.Format("all/Users/{0}", resUser.Id), resUser);
                    if (response.IsSuccessStatusCode)
                    {
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        return View();
                    }
                }
            }
            catch
            {
                return View();
            }
        }

        //// GET: Users/Delete/5
        //public ActionResult Delete(int id)
        //{
        //    return View();
        //}

        // POST: Users/Delete/5
        //[HttpPost]
        public async Task<ActionResult> Delete(int id)
        {
            try
            {
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("http://10.120.105.25:5000/");
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    // HTTP GET ALL
                    HttpResponseMessage response = await client.DeleteAsync(String.Format("all/Users/{0}", id));
                    if (response.IsSuccessStatusCode)
                    {
                        return RedirectToAction("Index");
                    }
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                RedirectToAction("Index");
                throw;
            }
        }
    }
}
