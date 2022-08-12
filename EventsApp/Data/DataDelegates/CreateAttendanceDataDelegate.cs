using System;
using System.Collections.Generic;
using System.Text;
using Data.Models;
using System.Data.SqlClient;

namespace Data.DataDelegates
{
    internal class CreateAttendanceDataDelegate
    {
        private readonly int _personID;
        private readonly int _eventID;
        private readonly int _roleID;
        private readonly int _itemID;
        private readonly DateTime _startDate;
        private readonly DateTime _endDate;
        private readonly Reason _reason;

        public CreateAttendanceDataDelegate(int personID, int eventID, int roleID, int itemID, DateTime start, DateTime end, Reason reason)
        {
            _personID = personID;
            _eventID = eventID;
            _roleID = roleID;
            _itemID = itemID;
            _startDate = start;
            _endDate = end;
            _reason = reason;
        }


    }
}
