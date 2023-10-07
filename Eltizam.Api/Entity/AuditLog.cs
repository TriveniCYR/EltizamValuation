using System;
using System.Collections.Generic;

namespace EltizamValuation.Api.Entity
{
    public partial class AuditLog
    {
        public int Id { get; set; }
        public string UserId { get; set; } = null!;
        public string? ModuleName { get; set; }
        public string? ActionName { get; set; }
        public DateTime? ActionDate { get; set; }
    }
}
