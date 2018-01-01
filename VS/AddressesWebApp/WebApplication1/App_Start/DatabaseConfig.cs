using System.Data.Entity;
using WebApplication1.Data;

namespace WebApplication1
{
    public class DatabaseConfig
    {
        public static void Initialize()
        {
            Database.SetInitializer(
                new MigrateDatabaseToLatestVersion<ApplicationDbContext, Migrations.Configuration>());
        }
    }
}
