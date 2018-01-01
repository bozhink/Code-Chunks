namespace Data
{
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure.Interception;
    using Common;
    using Data.Configuration;
    using Data.Models;

    public class NotesContext : DbContext
    {
        static NotesContext()
        {
            DbInterception.Add(new FtsInterceptor());
        }

        public NotesContext(string nameOrConnectionString)
            : base(nameOrConnectionString)
        {
        }

        public DbSet<Note> Notes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new NoteMap());
        }
    }
}