using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ValuationWeb.Domain.Entities;

namespace ValuationWeb.Domain.ViewModel
{
    public partial class RefreshToken
    {
        public int UserId { get; set; }
        public int Id { get; set; }
        public string? Token { get; set; }
        public DateTime Expires { get; set; }
        public bool IsExpired => DateTime.UtcNow >= Expires;
        public DateTime Created { get; set; }
        public DateTime? Revoked { get; set; }
        public bool IsActive => Revoked == null && !IsExpired;
        public virtual User User { get; set; } = null!;
    }
}
