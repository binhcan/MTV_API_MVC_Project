
using System.ComponentModel.DataAnnotations.Schema;

namespace API_Web_Server.Domain.Departments
{
    public class Departments
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public int ModuleNo { get; set; }
        public string DepartmentName { get; set; }
        public string? Description { get; set; }
    }
}
