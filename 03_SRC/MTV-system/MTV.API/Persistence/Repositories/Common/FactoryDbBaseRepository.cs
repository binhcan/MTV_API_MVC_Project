using MTV.API.Persistence.Contexts;

namespace MTV.API.Persistence.Repositories.Common
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
