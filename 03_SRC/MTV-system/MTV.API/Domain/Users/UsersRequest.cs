using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Domain.Users
{
    public class UsersRequest
    {
        public string Ecode { get; set; }
        public string FirstName { get; set; }
        public string GivenName { get; set; }
        public string? Email { get; set; }
        public string? Description { get; set; }
        public string Password { get; set; }
    }
}
