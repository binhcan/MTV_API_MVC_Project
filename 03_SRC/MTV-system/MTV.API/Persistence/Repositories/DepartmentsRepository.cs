using MTV.API.Domain.Departments;
using MTV.API.Persistence.Contexts;
using MTV.API.Persistence.Repositories.Common;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MTV.API.Persistence.Repositories
{
    public class DepartmentsRepository : Api_ServerDbBaseRepository, IDepartmentsRepository
    {
        public DepartmentsRepository(Api_ServerDbContext context) : base(context) { }

        public async Task<Departments> GetDepartmentsById(int Id)
        {
            return await _context.Departments.FindAsync(Id);
        }

        public async Task<IEnumerable<Departments>> ListAllDepartments()
        {
            return await _context.Departments.ToListAsync();
        }
    }
}
