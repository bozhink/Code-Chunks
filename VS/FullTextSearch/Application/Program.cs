namespace Application
{
    using System;
    using System.Linq;
    using Common;
    using Data;

    public class Program
    {
        public static void Main(string[] args)
        {
            var searchString = FtsInterceptor.Fts("john");
            using (var db = new NotesContext("DefaultConnection"))
            {
                var query = db.Notes.Where(n => n.Content.Contains(searchString));

                Console.WriteLine(query);

                var result = query.Take(10).ToList();
                foreach (var item in result)
                {
                    Console.WriteLine(item.Content);
                }
            }
        }
    }
}