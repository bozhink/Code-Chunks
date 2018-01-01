using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*
 * Task 2. Make_Чуек in C#
 *
 *    Refactor the following examples to produce code with well-named C# identifiers.
 */

namespace NamingIdentifiersHomework
{
    public class People
    {
        public List<Person> peopleList;
        
        public enum Gender { Male, Female };

        public class Person
        {
            public Gender gender { get; set; }
            public string name { get; set; }
            public int age { get; set; }
        }

        public People()
        {
            peopleList = new List<Person>();
        }

        public void MakePerson(int magicNumberOfPerson)
        {
            Person person = new Person();
            person.age = magicNumberOfPerson;
            if (magicNumberOfPerson % 2 == 0)
            {
                person.name = "Батката";
                person.gender = Gender.Male;
            }
            else
            {
                person.name = "Мацето";
                person.gender = Gender.Female;
            }

            peopleList.Add(person);
        }
    }
}
