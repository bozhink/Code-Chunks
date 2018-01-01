using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WebApplication1.Data.Models
{
    public class Person
    {
        private ICollection<Address> addresses;

        public Person()
        {
            this.addresses = new HashSet<Address>();
        }

        [Key]
        public int Id { get; set; }

        [MaxLength(100)]
        public string FirstName { get; set; }

        [Required]
        [MaxLength(100)]
        public string LastName { get; set; }

        [MaxLength(10)]
        public string Prefix { get; set; }

        [MaxLength(10)]
        public string Suffix { get; set; }

        public virtual ICollection<Address> Addresses
        {
            get
            {
                return this.addresses;
            }

            set
            {
                this.addresses = value;
            }
        }
    }
}
