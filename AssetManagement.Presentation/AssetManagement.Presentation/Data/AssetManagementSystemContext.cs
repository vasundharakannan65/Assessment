using System;
using AssetManagement.DA.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace AssetManagement.Presentation.Data
{
    public partial class AssetManagementSystemContext : DbContext
    {
        public AssetManagementSystemContext()
        {
        }

        public AssetManagementSystemContext(DbContextOptions<AssetManagementSystemContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Asset> Assets { get; set; }
        public virtual DbSet<AssetHolderInfo> AssetHolderInfos { get; set; }
        public virtual DbSet<Brand> Brands { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=Trainee-06;Database=AssetManagementSystem;User Id=SA;Password=MyPassword123");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Asset>(entity =>
            {
                entity.Property(e => e.Assetname).IsUnicode(false);

                entity.Property(e => e.Color).IsUnicode(false);

                entity.Property(e => e.Imagepath).IsUnicode(false);

                entity.Property(e => e.Modelno).IsUnicode(false);

                entity.Property(e => e.Serialno).IsUnicode(false);

                entity.Property(e => e.Size).IsUnicode(false);

                entity.Property(e => e.Type).IsUnicode(false);

                entity.HasOne(d => d.Brand)
                    .WithMany(p => p.Assets)
                    .HasForeignKey(d => d.BrandId)
                    .HasConstraintName("FK__Asset__BrandId__571DF1D5");
            });

            modelBuilder.Entity<AssetHolderInfo>(entity =>
            {
                entity.HasOne(d => d.Asset)
                    .WithMany(p => p.AssetHolderInfos)
                    .HasForeignKey(d => d.AssetId)
                    .HasConstraintName("FK__AssetHold__Asset__5BE2A6F2");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AssetHolderInfos)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK__AssetHold__UserI__5AEE82B9");
            });

            modelBuilder.Entity<Brand>(entity =>
            {
                entity.Property(e => e.Brandname).IsUnicode(false);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.Address).IsUnicode(false);

                entity.Property(e => e.Companyname).IsUnicode(false);

                entity.Property(e => e.Mobilenumber).IsUnicode(false);

                entity.Property(e => e.Username).IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
