using System;
using System.Collections.Generic;
using ValuationWeb.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Eltizam.Data.DataAccess.Entity;

namespace ValuationWeb.Persistence
{
    public partial class ValuationDbContext : DbContext
    {
        public ValuationDbContext()
        {
        }

        public ValuationDbContext(DbContextOptions<ValuationDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Branch> Branches { get; set; } = null!;
        public virtual DbSet<MasterCity> MasterCities { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseCollation("Cyrillic_General_CI_AI");

            modelBuilder.Entity<MasterCity>(entity =>
            {
                entity.ToTable("Master_City", "dbo");

                entity.Property(e => e.CityName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Stdcode)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("STDCode");
            });

            modelBuilder.Entity<Branch>(entity =>
            {
                entity.ToTable("Branch", "dbo");

                entity.Property(e => e.Accountant).HasMaxLength(255);

                entity.Property(e => e.AccountantPost).HasMaxLength(255);

                entity.Property(e => e.Address).HasMaxLength(255);

                entity.Property(e => e.BankCode)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.CloseDate).HasColumnType("date");

                entity.Property(e => e.JurName).HasMaxLength(255);

                entity.Property(e => e.License).HasMaxLength(50);

                entity.Property(e => e.Manager).HasMaxLength(255);

                entity.Property(e => e.ManagerPost).HasMaxLength(255);

                entity.Property(e => e.Modified)
                    .HasPrecision(3)
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.NameShort).HasMaxLength(50);

                entity.Property(e => e.OpenDate).HasColumnType("date");

                entity.Property(e => e.Phone).HasMaxLength(50);

                entity.Property(e => e.User)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Warrant).HasMaxLength(50);
            });

            modelBuilder.Entity<RefreshToken>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.Id })
                    .HasName("PK_RefreshToken_1");

                entity.ToTable("RefreshToken", "dbo");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.HasOne(d => d.User)
                    .WithMany(p => p.RefreshTokens)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_RefreshToken_User");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User", "dbo");

                entity.HasIndex(e => e.UserName, "UIX_User")
                    .IsUnique();

                entity.Property(e => e.Address)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.AllowTemplateTesting).HasDefaultValueSql("((2))");

                entity.Property(e => e.CloseDate).HasColumnType("date");

                entity.Property(e => e.Description).HasMaxLength(255);

                entity.Property(e => e.Email)
                    .HasMaxLength(356)
                    .IsUnicode(false);

                entity.Property(e => e.EmployeeNum)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .HasMaxLength(80)
                    .IsUnicode(false);

                entity.Property(e => e.ForgotPasswordToken)
                    .HasMaxLength(350)
                    .IsUnicode(false);

                entity.Property(e => e.Gender)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.LastLoginDate).HasPrecision(3);

                entity.Property(e => e.LastLoginIp)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("LastLoginIP");

                entity.Property(e => e.LastLoginMachine)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .HasMaxLength(80)
                    .IsUnicode(false);

                entity.Property(e => e.Mobile)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Mobile2)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.OpenDate).HasColumnType("date");

                entity.Property(e => e.Password)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.PasswordExpirationDate).HasColumnType("date");

                entity.Property(e => e.Prefix)
                    .HasMaxLength(3)
                    .IsUnicode(false);

                entity.Property(e => e.State).HasDefaultValueSql("((1))");

                entity.Property(e => e.UserName)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.HasSequence("ArcaRequestOrderId", "dbo");

            modelBuilder.HasSequence("LogObjectId", "dbo");

            modelBuilder.HasSequence<int>("OwnerGroupId", "dbo")
                .StartsAt(5000)
                .HasMin(5000);

            modelBuilder.HasSequence("StatementId", "dbo");

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
