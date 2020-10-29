using System;
using System.ComponentModel.DataAnnotations.Schema;
namespace API_Web_Server.Domain.Uploaders
{
    public class Files
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Guid { get; set; }
        public string FileName { get; set; }
        public string? Extension { get; set; }
        public string? UserCreate { get; set; }
        public string? UserUpdate { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
    }
}
