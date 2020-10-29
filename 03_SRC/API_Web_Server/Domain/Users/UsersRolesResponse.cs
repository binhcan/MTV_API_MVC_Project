using API_Web_Server.Helper;
using Microsoft.Extensions.Logging;
using System;

namespace API_Web_Server.Domain.Users
{
    public class UsersRolesResponse : BaseResponse
    {
        public UsersRoles UsersRoles { get; private set; }

        //private readonly ILogger _logger;
        private UsersRolesResponse(bool success, string message, UsersRoles usersRoles) : base(success, message)
        {
            UsersRoles = usersRoles;
        }


        public UsersRolesResponse(UsersRoles usersRoles) : this(true, string.Empty, usersRoles)
        {
            Logging.iLogger.LogInformation(String.Format(API_Message.success("S001"), "UsersRoles", usersRoles.Id));
        }

        public UsersRolesResponse(string message, UsersRoles usersRoles) : this(false, message, usersRoles)
        {
            Logging.iLogger.LogError(String.Format(API_Message.error("E001"), "UsersRoles", message));
        }

        public UsersRolesResponse(string message) : this(false, message, null)
        {
            Logging.iLogger.LogError(message);
        }
    }
}
