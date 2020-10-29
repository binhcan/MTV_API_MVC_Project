using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_Web_Server.Domain.Mobile_App
{
    public class Mobile_Applications
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string ApplicationName { get; set; }
        public string Version { get; set; }
        public string Path { get; set; }
        public int? BuildNumber { get; set; }
        public string? Project { get; set; }
        public string? Description { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
    }
}
