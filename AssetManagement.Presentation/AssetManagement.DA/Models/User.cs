using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace AssetManagement.DA.Models
{
    [Table("User")]
    public partial class User
    {
        public User()
        {
            AssetHolderInfos = new HashSet<AssetHolderInfo>();
        }

        [Key]
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

        [InverseProperty(nameof(AssetHolderInfo.User))]
        public virtual ICollection<AssetHolderInfo> AssetHolderInfos { get; set; }
    }
}
