using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Data.Models
{
    public class Address
    {
        private ICollection<Person> people;

        public Address()
        {
            this.people = new HashSet<Person>();
        }

        [Key]
        public int Id { get; set; }

        [MaxLength(200)]
        public string AddressString { get; set; }

        public virtual int CityId { get; set; }

        public virtual City City { get; set; }

        public virtual ICollection<Person> People
        {
            get
            {
                return this.people;
            }

            set
            {
                this.people = value;
            }
        }
    }
}
