using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Utility;

namespace Eltizam.Data.DataAccess.DataContext
{
    public partial class EltizamContext : DbContext
    {
        public EltizamContext()
        {
        }

        public EltizamContext(DbContextOptions<EltizamContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AuditLog> AuditLogs { get; set; } = null!;
        public virtual DbSet<Dictionary> Dictionaries { get; set; } = null!;
        public virtual DbSet<MasterAddress> MasterAddresses { get; set; } = null!;
        public virtual DbSet<MasterCity> MasterCities { get; set; } = null!;
        public virtual DbSet<MasterClient> MasterClients { get; set; } = null!;
        public virtual DbSet<MasterClientContact> MasterClientContacts { get; set; } = null!;
        public virtual DbSet<MasterClientType> MasterClientTypes { get; set; } = null!;
        public virtual DbSet<MasterContact> MasterContacts { get; set; } = null!;
        public virtual DbSet<MasterCountry> MasterCountries { get; set; } = null!;
        public virtual DbSet<MasterDepartment> MasterDepartments { get; set; } = null!;
        public virtual DbSet<MasterDesignation> MasterDesignations { get; set; } = null!;
        public virtual DbSet<MasterDocument> MasterDocuments { get; set; } = null!;
        public virtual DbSet<MasterException> MasterExceptions { get; set; } = null!;
        public virtual DbSet<MasterLocation> MasterLocations { get; set; } = null!;
        public virtual DbSet<MasterModule> MasterModules { get; set; } = null!;
        public virtual DbSet<MasterOwnershipType> MasterOwnershipTypes { get; set; } = null!;
        public virtual DbSet<MasterPropertySubType> MasterPropertySubTypes { get; set; } = null!;
        public virtual DbSet<MasterPropertyType> MasterPropertyTypes { get; set; } = null!;
        public virtual DbSet<MasterQualification> MasterQualifications { get; set; } = null!;
        public virtual DbSet<MasterResourceType> MasterResourceTypes { get; set; } = null!;
        public virtual DbSet<MasterRole> MasterRoles { get; set; } = null!;
        public virtual DbSet<MasterState> MasterStates { get; set; } = null!;
        public virtual DbSet<MasterSubModule> MasterSubModules { get; set; } = null!;
        public virtual DbSet<MasterUser> MasterUsers { get; set; } = null!;
        public virtual DbSet<MasterValuationFee> MasterValuationFees { get; set; } = null!;
        public virtual DbSet<MasterValuationFeeType> MasterValuationFeeTypes { get; set; } = null!;
        public virtual DbSet<MasterVendor> MasterVendors { get; set; } = null!;
        public virtual DbSet<RoleModulePermission> RoleModulePermissions { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {

                optionsBuilder.UseSqlServer(DatabaseConnection.EltizamDatabaseConnection);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AuditLog>(entity =>
            {
                entity.ToTable("Audit_Log");

                entity.Property(e => e.ActionDate).HasColumnType("datetime");

                entity.Property(e => e.ActionName)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ModuleName)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.UserId)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Dictionary>(entity =>
            {
                entity.ToTable("Dictionary");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Type)
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterAddress>(entity =>
            {
                entity.ToTable("Master_Address");

                entity.Property(e => e.Address1)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Address2)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Address3)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.AlternateEmail)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.AlternatePhone)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Email)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Landlinephone)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Landmark)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Phone)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.PinNo)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.TableName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.HasOne(d => d.City)
                    .WithMany(p => p.MasterAddresses)
                    .HasForeignKey(d => d.CityId)
                    .HasConstraintName("FK_Master_Address_Master_City");

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.MasterAddresses)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK_Master_Address_Master_Country");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.MasterAddresses)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_Master_Address_Master_State");
            });

            modelBuilder.Entity<MasterCity>(entity =>
            {
                entity.ToTable("Master_City");

                entity.Property(e => e.CityName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Stdcode)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterClient>(entity =>
            {
                entity.ToTable("Master_Client");

                entity.Property(e => e.Address1)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Address2)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Company)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.FirstName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.LicenseNumber)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Logo)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.MiddleName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PinNo)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.TrnexpiryDate)
                    .HasColumnType("datetime")
                    .HasColumnName("TRNExpiryDate");

                entity.Property(e => e.Trnnumber)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("TRNNumber");

                entity.HasOne(d => d.City)
                    .WithMany(p => p.MasterClients)
                    .HasForeignKey(d => d.CityId)
                    .HasConstraintName("FK_Master_Client_Master_City");

                entity.HasOne(d => d.ClientType)
                    .WithMany(p => p.MasterClients)
                    .HasForeignKey(d => d.ClientTypeId)
                    .HasConstraintName("FK_Master_Client_Master_ClientType");

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.MasterClients)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK_Master_Client_Master_Country");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.MasterClients)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_Master_Client_Master_State");
            });

            modelBuilder.Entity<MasterClientContact>(entity =>
            {
                entity.ToTable("Master_ClientContact");

                entity.Property(e => e.ContactPerson)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.Department)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Designation)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.Client)
                    .WithMany(p => p.MasterClientContacts)
                    .HasForeignKey(d => d.ClientId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Master_ClientContact_Master_Client");
            });

            modelBuilder.Entity<MasterClientType>(entity =>
            {
                entity.ToTable("Master_ClientType");

                entity.Property(e => e.ClientType)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterContact>(entity =>
            {
                entity.ToTable("Master_Contact");

                entity.Property(e => e.ContactPersonName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Department)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Designation)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Mobile)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.TableName)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterCountry>(entity =>
            {
                entity.ToTable("Master_Country");

                entity.Property(e => e.CountryCode)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.CountryName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.IsdcountryCode)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("ISDCountryCode");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterDepartment>(entity =>
            {
                entity.ToTable("Master_Department");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Department)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterDesignation>(entity =>
            {
                entity.ToTable("Master_Designation");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Designation)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterDocument>(entity =>
            {
                entity.ToTable("Master_Document");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.DocumentName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.FileName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.FilePath)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.FileType)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.TableName)
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterException>(entity =>
            {
                entity.HasKey(e => e.ExceptionId);

                entity.ToTable("Master_Exception");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Message).HasMaxLength(500);

                entity.Property(e => e.Source).HasMaxLength(500);

                entity.Property(e => e.StrackTrace).HasMaxLength(4000);
            });

            modelBuilder.Entity<MasterLocation>(entity =>
            {
                entity.ToTable("Master_Location");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Latitude).HasMaxLength(50);

                entity.Property(e => e.LocationName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Longitude).HasMaxLength(50);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Sector)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.HasOne(d => d.City)
                    .WithMany(p => p.MasterLocations)
                    .HasForeignKey(d => d.CityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Master_Location_Master_City");

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.MasterLocations)
                    .HasForeignKey(d => d.CountryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Master_Location_Master_Country");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.MasterLocations)
                    .HasForeignKey(d => d.StateId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Master_Location_Master_State");
            });

            modelBuilder.Entity<MasterModule>(entity =>
            {
                entity.HasKey(e => e.ModuleId);

                entity.ToTable("Master_Module");

                entity.Property(e => e.ControlName).HasMaxLength(200);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");

                entity.Property(e => e.ModuleName).HasMaxLength(250);
            });

            modelBuilder.Entity<MasterOwnershipType>(entity =>
            {
                entity.ToTable("Master_OwnershipType");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.OwnershipType)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterPropertySubType>(entity =>
            {
                entity.ToTable("Master_PropertySubType");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PropertySubType)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterPropertyType>(entity =>
            {
                entity.ToTable("Master_PropertyType");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PropertyType)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterQualification>(entity =>
            {
                entity.ToTable("Master_Qualification");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Grade)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Institute)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Qualification)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Subject)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.TableName)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.YearOfInstitute)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterResourceType>(entity =>
            {
                entity.ToTable("Master_ResourceType");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.ResourceType)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterRole>(entity =>
            {
                entity.HasKey(e => e.RoleId);

                entity.ToTable("Master_Role");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.DeletedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");

                entity.Property(e => e.RoleName).HasMaxLength(50);
            });

            modelBuilder.Entity<MasterState>(entity =>
            {
                entity.ToTable("Master_State");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.StateCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.StateName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.MasterStates)
                    .HasForeignKey(d => d.CountryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Master_State_Master_Country");
            });

            modelBuilder.Entity<MasterSubModule>(entity =>
            {
                entity.HasKey(e => e.SubModuleId);

                entity.ToTable("Master_SubModule");

                entity.Property(e => e.ControlName).HasMaxLength(200);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");

                entity.Property(e => e.SubModuleName).HasMaxLength(250);
            });

            modelBuilder.Entity<MasterUser>(entity =>
            {
                entity.ToTable("Master_User");

                entity.Property(e => e.CompanyName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.DateOfBirth).HasColumnType("datetime");

                entity.Property(e => e.Email)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Gender)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.LastName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.LicenseNo)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.MiddleName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Password)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.UserName)
                    .HasMaxLength(752)
                    .IsUnicode(false)
                    .HasComputedColumnSql("(((([FirstName]+' ')+[MiddleName])+' ')+[LastName])", false);

                entity.HasOne(d => d.Department)
                    .WithMany(p => p.MasterUsers)
                    .HasForeignKey(d => d.DepartmentId)
                    .HasConstraintName("FK_Master_User_Master_Department");

                entity.HasOne(d => d.Designation)
                    .WithMany(p => p.MasterUsers)
                    .HasForeignKey(d => d.DesignationId)
                    .HasConstraintName("FK_Master_User_Master_Designation");
            });

            modelBuilder.Entity<MasterValuationFee>(entity =>
            {
                entity.ToTable("Master_ValuationFees");

                entity.Property(e => e.CarpetAreaInSqFt)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CarpetAreaInSqMtr)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.OtherCharges).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.TotalValuationFees).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.ValuationFees).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.Vat)
                    .HasColumnType("decimal(18, 6)")
                    .HasColumnName("VAT");

                entity.HasOne(d => d.ClientType)
                    .WithMany(p => p.MasterValuationFees)
                    .HasForeignKey(d => d.ClientTypeId)
                    .HasConstraintName("FK_Master_ValuationFees_Master_ClientType");

                entity.HasOne(d => d.OwnershipType)
                    .WithMany(p => p.MasterValuationFees)
                    .HasForeignKey(d => d.OwnershipTypeId)
                    .HasConstraintName("FK_Master_ValuationFees_Master_OwnershipType");

                entity.HasOne(d => d.PropertySubType)
                    .WithMany(p => p.MasterValuationFees)
                    .HasForeignKey(d => d.PropertySubTypeId)
                    .HasConstraintName("FK_Master_ValuationFees_Master_PropertySubType");

                entity.HasOne(d => d.PropertyType)
                    .WithMany(p => p.MasterValuationFees)
                    .HasForeignKey(d => d.PropertyTypeId)
                    .HasConstraintName("FK_Master_ValuationFees_Master_PropertyType");

                entity.HasOne(d => d.ValuationFeeType)
                    .WithMany(p => p.MasterValuationFees)
                    .HasForeignKey(d => d.ValuationFeeTypeId)
                    .HasConstraintName("FK_Master_ValuationFees_Master_ValuationFeeType");
            });

            modelBuilder.Entity<MasterValuationFeeType>(entity =>
            {
                entity.ToTable("Master_ValuationFeeType");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.ValuationFeeType)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterVendor>(entity =>
            {
                entity.ToTable("Master_Vendor");

                entity.Property(e => e.CompanyDescription)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.CompanyName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EstimattionDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.VendorName)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<RoleModulePermission>(entity =>
            {
                entity.HasKey(e => e.RoleModuleId);

                entity.ToTable("RoleModulePermission");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
