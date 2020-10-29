using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC_vs_API.Models
{
    public class Users
    {
        public int Id { get; set; }
        public string Ecode { get; set; }
        public string FirstName { get; set; }
        public string GivenName { get; set; }
        public string Email { get; set; }
        public string Description { get; set; }
        public string Password { get; set; }
        public string Token { get; set; }
    }
}