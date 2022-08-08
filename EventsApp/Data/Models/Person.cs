using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Models
{
    public class Person
    {
        public int PersonID { get; }
        public int WID { get; }
        public string FirstName { get; }
        public string LastName { get; }

        public Person(int PersonID, int WID, string FirstName, string LastName)
        {
            this.PersonID = PersonID;
            this.WID = WID;
            this.FirstName = FirstName;
            this.LastName = LastName;
        }

        public bool Equals(Person other)
        {
            return PersonID == other.PersonID &&
                   WID == other.WID &&
                   FirstName.Equals(other.FirstName) &&
                   LastName.Equals(other.LastName);
        }
    }
}
