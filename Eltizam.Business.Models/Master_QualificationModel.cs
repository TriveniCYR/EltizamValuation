﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class Master_QualificationModel
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Qualification { get; set; }
        public string Subject { get; set; }
        public string Institute { get; set; }
        public string Grade { get; set; }
        public string YearOfInstitute { get; set; }
        public int IsActive { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedBy { get; set; }
    }
}
