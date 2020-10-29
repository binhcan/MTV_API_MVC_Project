using MTV.API.Domain.Factory.ItemVendlot;
using Microsoft.EntityFrameworkCore;

namespace MTV.API.Persistence.Contexts
{
    public class FactoryDbContext : DbContext
    {
        public DbSet<TEVTB_ItemVendlot> TEVTB_ItemVendlot { get; set; }
        public FactoryDbContext(DbContextOptions<FactoryDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.HasDefaultSchema("dbo");
            builder.Entity<TEVTB_ItemVendlot>()
                .HasKey(it => it.RowPointer);
            //builder.Query<PoItemMst>();
        }
    }
}
