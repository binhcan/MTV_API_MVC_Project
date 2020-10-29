
using System.ComponentModel.DataAnnotations.Schema;

namespace MTV.API.Domain.Departments
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
