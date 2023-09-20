using System;
using System.Collections.Generic;
using Eltizam.Data.DataAccess.Entity;

#nullable disable

namespace Eltizam.Data.DataAccess.Entity
{
    public partial class UserSessionLogMaster
    {
        public long UserLoginHistoryId { get; set; }
        public int UserId { get; set; }
        public DateTime CreatedDate { get; set; }

        public virtual MasterUser User { get; set; }
    }
}
