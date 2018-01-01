namespace Data.Configuration
{
    using System.Data.Entity.ModelConfiguration;
    using Data.Models;

    public class NoteMap : EntityTypeConfiguration<Note>
    {
        public NoteMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);
        }
    }
}