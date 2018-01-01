using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NamingIdentifiersHomework
{
    class Program
    {
        static void Main(string[] args)
        {
            ConsolePrinter.PrintTrue();

            People people = new People();
            people.MakePerson(29);
            people.MakePerson(32);
            foreach (People.Person person in people.peopleList)
            {
                Console.WriteLine("name: {0}, age: {1}, gender: {2}", person.name,
                    person.age, person.gender);
            }
        }
    }
}
