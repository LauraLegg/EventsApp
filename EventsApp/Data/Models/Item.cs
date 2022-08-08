using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Models
{
    public class Item
    {
        public int ItemID { get; }
        public string Name { get; }
        public string Purpose { get; }
        public int EventID { get; }

        public Item(int ItemID, string Name, string Purpose, int EventID)
        {
            this.ItemID = ItemID;
            this.Name = Name;
            this.Purpose = Purpose;
            this.EventID = EventID;
        }

        public bool Equals(Item other)
        {
            return ItemID == other.ItemID &&
                   Name.Equals(other.Name) &&
                   Purpose.Equals(other.Purpose) &&
                   EventID == EventID;
        }
    }
}
