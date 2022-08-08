using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Models
{
    public class Attendance
    {
        public int PersonID { get; }
        public int EventID { get; }
        public int RoleID { get; }
        public int ItemID { get; }
        public DateTime StartDate { get; }
        public DateTime EndDate { get; }
        public string Reason { get; }

        public Attendance(int PersonID, int EventID, int RoleID, int ItemID, DateTime StartDate, DateTime EndDate, string Reason)
        {
            this.PersonID = PersonID;
            this.EventID = EventID;
            this.RoleID = RoleID;
            this.ItemID = ItemID;
            this.StartDate = StartDate;
            this.EndDate = EndDate;
            this.Reason = Reason;
        }

        public bool Equals(Attendance other)
        {
            return PersonID == other.PersonID &&
                   EventID == other.EventID &&
                   RoleID == other.RoleID &&
                   ItemID == other.ItemID &&
                   StartDate == other.StartDate &&
                   EndDate == other.EndDate &&
                   Reason == other.Reason;
        }
    }
}
