using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace AssetManagement.DA.Models
{
    [Table("AssetHolderInfo")]
    public partial class AssetHolderInfo
    {
        [Key]
        public int Id { get; set; }
        public int? AssetId { get; set; }
        public int? UserId { get; set; }
        [Column(TypeName = "date")]
        public DateTime DateIn { get; set; }
        [Column(TypeName = "date")]
        public DateTime DateOut { get; set; }
        public bool Signature { get; set; }

        [ForeignKey(nameof(AssetId))]
        [InverseProperty("AssetHolderInfos")]
        public virtual Asset Asset { get; set; }
        [ForeignKey(nameof(UserId))]
        [InverseProperty("AssetHolderInfos")]
        public virtual User User { get; set; }
    }
}
