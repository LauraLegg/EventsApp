using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Models
{
    public class Role
    {
		public int RoleID { get; }
		public string Title { get; }
		public string Description { get; }

		public Role(int RoleID, string Title, string Description)
		{
			this.RoleID = RoleID;
			this.Title = Title;
			this.Description = Description;
		}

        public bool Equals(Role other)
        {
            return RoleID == other.RoleID &&
                   Title.Equals(other.Title) &&
                   Description.Equals(other.Description);
        }
    }
}
