using MTV.API.Domain.Home.PermissionPart;
using System;
using System.ComponentModel.DataAnnotations;

namespace MTV.API.Domain.Home
{
    public class ModulesForUser
    {
        [Key]
        public int Id { get; set; }
        public string Ecode { get; set; }
        public PaidForModules AllowedPaidForModules { get; set; }
    }
}
