using API_Web_Server.Domain.Home.PermissionPart;
using System;
using System.ComponentModel.DataAnnotations;

namespace API_Web_Server.Domain.Home
{
    public class ModulesForUser
    {
        [Key]
        [MaxLength(450)] //Matches identity size
        public string UserId { get; set; }
        public PaidForModules AllowedPaidForModules { get; set; }

        public ModulesForUser(string userId, PaidForModules allowedPaidForModules)
        {
            UserId = userId ?? throw new ArgumentNullException(nameof(userId));
            AllowedPaidForModules = allowedPaidForModules;
        }
    }
}
