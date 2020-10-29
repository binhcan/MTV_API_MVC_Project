using API_Web_Server.Persistence.Contexts;

namespace API_Web_Server.Persistence.Repositories.Common
{
    public class FactoryDbBaseRepository
    {
        protected readonly FactoryDbContext _context;

        public FactoryDbBaseRepository(FactoryDbContext context)
        {
            _context = context;
        }
    }
}
