using API_Web_Server.Helper;
using Microsoft.Extensions.Logging;
using System;

namespace API_Web_Server.Domain.Users
{
    public class UsersResponse : BaseResponse
    {
        public Users Users { get; private set; }

        //private readonly ILogger _logger;
        private UsersResponse(bool success, string message, Users users) : base(success, message)
        {
            Users = users;
        }
        /// <summary>
        /// Creates a success response.
        /// </summary>
        /// <param name="users">Saved Users.</param>
        /// <returns>Response.</returns>
        public UsersResponse(Users users) : this(true, string.Empty, users)
        {
            Logging.iLogger.LogInformation(String.Format(API_Message.success("S001"), "Users", users.Ecode));
        }

        /// <summary>
        /// Creates am error response.
        /// </summary>
        /// <param name="users">Error message.</param>
        /// <returns>Response.</returns>
        public UsersResponse(string message, Users users) : this(false, message, users)
        {
            Logging.iLogger.LogError(String.Format(API_Message.error("E001"), "Users", message));
        }

        public UsersResponse(string message) : this(false, message, null)
        {
            Logging.iLogger.LogError(message);
        }
    }
}
