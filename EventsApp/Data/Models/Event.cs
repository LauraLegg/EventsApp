using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Models
{
    public class Event
    {
        public int EventID { get; }
        public DateTime StartDate { get; }
        public DateTime EndDate { get; }
        public string Description { get; }

        public Event(int EventID, DateTime StartDate, DateTime EndDate, string Description)
        {
            this.EventID = EventID;
            this.StartDate = StartDate;
            this.EndDate = EndDate;
            this.Description = Description;
        }

        public bool Equals(Event other)
        {
            return EventID == other.EventID &&
                   StartDate == other.StartDate &&
                   EndDate == other.EndDate &&
                   Description.Equals(other.Description);
        }
    }
}
