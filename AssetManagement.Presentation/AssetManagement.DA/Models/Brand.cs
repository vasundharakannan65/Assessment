using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace AssetManagement.DA.Models
{
    [Table("Brand")]
    public partial class Brand
    {
        public Brand()
        {
            Assets = new HashSet<Asset>();
        }

        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(100)]
        public string Brandname { get; set; }

        [InverseProperty(nameof(Asset.Brand))]
        public virtual ICollection<Asset> Assets { get; set; }
    }
}
