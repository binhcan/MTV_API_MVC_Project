using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MTV.API.Domain.Departments
{
    public class RolesInDepartments
    {
        [Key]
        [Column(Order = 0)]
        public int Id { get; set; }

        [Key]
        [Column(Order = 0)]
        public int DeptId { get; set; }
        public string RoleName { get; set; }
    }
}
