using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssetManagement.BL.ViewModels
{
    public class AssetViewModel
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public int? BrandId { get; set; }

        [Required]
        [StringLength(25,ErrorMessage ="Asset name must be length of 25")]
        [RegularExpression(@"^[a-zA-Z0-9\s]+$", ErrorMessage = "Special characters are not allowed")]
        public string Assetname { get; set; }

        [Required]
        [StringLength(12,ErrorMessage = "Model No. must be length of 12")]
        [RegularExpression(@"^[a-zA-Z0-9\s]+$", ErrorMessage = "Special characters are not allowed")]
        public string Modelno { get; set; }

        [Required]
        [StringLength(12,ErrorMessage = "Serial No. must be length of 12")]
        [RegularExpression(@"^[0-9\s]+$", ErrorMessage = "Special characters are not allowed")]
        public string Serialno { get; set; } 

        [Required]
        public int Quantity { get; set; }

        [Required]
        [StringLength(20)]
        [RegularExpression(@"^[a-zA-Z0-9\s]+$", ErrorMessage = "Special characters are not allowed")]
        public string Color { get; set; } 

        [Required]
        public string Size { get; set; }

        [Required]
        [StringLength(80)]
        [RegularExpression(@"^[a-zA-Z0-9\s]+$", ErrorMessage = "Special characters are not allowed")]
        public string Type { get; set; } 

        [Required]
        [Column(TypeName = "decimal(10, 2)")]
        public decimal Price { get; set; }

        [Required]
        [StringLength(250)]
        [RegularExpression("[^\\s]+(.*?)\\.(jpg)$",ErrorMessage = "Image must be of JPG type only")]
        public string Imagepath { get; set; }
    }
}
