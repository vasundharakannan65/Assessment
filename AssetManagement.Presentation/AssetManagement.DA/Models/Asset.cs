using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace AssetManagement.DA.Models
{
    [Table("Asset")]
    public partial class Asset
    {
        public Asset()
        {
            AssetHolderInfos = new HashSet<AssetHolderInfo>();
        }

        [Key]
        public int Id { get; set; }
        public int? BrandId { get; set; }
        [Required]
        [StringLength(100)]
        public string Assetname { get; set; }
        [Required]
        [StringLength(26)]
        public string Modelno { get; set; }
        [Required]
        [StringLength(26)]
        public string Serialno { get; set; }
        public int Quantity { get; set; }
        [Required]
        [StringLength(20)]
        public string Color { get; set; }
        [Required]
        [StringLength(5)]
        public string Size { get; set; }
        [Required]
        [StringLength(80)]
        public string Type { get; set; }
        [Column(TypeName = "decimal(10, 2)")]
        public decimal Price { get; set; }
        [Required]
        [StringLength(250)]
        public string Imagepath { get; set; }

        [ForeignKey(nameof(BrandId))]
        [InverseProperty("Assets")]
        public virtual Brand Brand { get; set; }
        [InverseProperty(nameof(AssetHolderInfo.Asset))]
        public virtual ICollection<AssetHolderInfo> AssetHolderInfos { get; set; }
    }
}
