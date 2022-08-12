using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Models
{
    public class Organization
    {
        public int OrganizationID { get; }
        public string Name { get; }
        public string Description { get; }
                
        public Organization(int OrganizationID, string Name, string Description)
        {
            this.OrganizationID = OrganizationID;
            this.Name = Name;
            this.Description = Description;
        }

        public bool Equals(Organization other)
        {
            return OrganizationID == other.OrganizationID &&
                   Name.Equals(other.Name) &&
                   Description.Equals(other.Description);
        }
    }
}
