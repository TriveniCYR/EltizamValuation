using AutoMapper.Configuration.Annotations;
using Eltizam.Resource.Resources;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Eltizam.Business.Models
{
    public class ValuationInvoicePaymentModel
    {
        public int Id { get; set; }
        public int ValuationRequestId { get; set; }
        public string? ReferenceNO { get; set; }
        [RegularExpression("^[a-zA-Z0-9]*$", ErrorMessage = "Special characters are not allowed in InvoiceNo")]
        public string InvoiceNo { get; set; }

        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'TransactionMode' field is required.")]
        public int TransactionModeId { get; set; } 
        public string? TransactionMode { get; set; } 
        public string? UserName { get; set; }

        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime TransactionDate { get; set; }
        [Required(ErrorMessageResourceType = typeof(Validation), ErrorMessageResourceName = "Required")]
        [Range(1, int.MaxValue, ErrorMessage = "The 'Amount' field is required.")]
        public decimal Amount { get; set; }
        public decimal? Balance { get; set; }
        public string? Note { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public bool IsDeleted { get; set; }
        public int IsCompleted { get; set; }

    }
}
