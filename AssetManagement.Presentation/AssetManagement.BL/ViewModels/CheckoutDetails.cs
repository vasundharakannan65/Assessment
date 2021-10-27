using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssetManagement.BL.ViewModels
{
    public class CheckoutDetails
    {
        public int Id { get; set; }
        [Required]
        [StringLength(26)]
        public string Username { get; set; }
        [Required]
        [StringLength(26)]
        public string Companyname { get; set; }
        [Required]
        [StringLength(100)]
        public string Address { get; set; }
        [Required]
        [StringLength(10)]
        public string Mobilenumber { get; set; }
        public DateTime DateIn { get; set; }
        [Column(TypeName = "date")]
        public DateTime DateOut { get; set; }
        public bool Signature { get; set; }

    }
}
