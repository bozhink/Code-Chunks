using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;
using WebApplication1.Data.Models;

namespace WebApplication1.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }

        public DbSet<City> Cities { get; set; }

        public DbSet<Address> Addresses { get; set; }

        public DbSet<Person> People { get; set; }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}
