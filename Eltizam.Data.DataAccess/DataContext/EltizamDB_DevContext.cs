using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Eltizam.Data.DataAccess.Entity;

namespace Eltizam.Data.DataAccess.DataContext
{
    public partial class EltizamDB_DevContext : DbContext
    {
        public EltizamDB_DevContext()
        {
        }

        public EltizamDB_DevContext(DbContextOptions<EltizamDB_DevContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AuditLog> AuditLogs { get; set; } = null!;
        public virtual DbSet<Dictionary> Dictionaries { get; set; } = null!;
        public virtual DbSet<EmailLogHistory> EmailLogHistories { get; set; } = null!;
        public virtual DbSet<MasterAddress> MasterAddresses { get; set; } = null!;
        public virtual DbSet<MasterCity> MasterCities { get; set; } = null!;
        public virtual DbSet<MasterClient> MasterClients { get; set; } = null!;
        public virtual DbSet<MasterClientContact> MasterClientContacts { get; set; } = null!;
        public virtual DbSet<MasterClientType> MasterClientTypes { get; set; } = null!;
        public virtual DbSet<MasterConfig> MasterConfigs { get; set; } = null!;
        public virtual DbSet<MasterContact> MasterContacts { get; set; } = null!;
        public virtual DbSet<MasterCountry> MasterCountries { get; set; } = null!;
        public virtual DbSet<MasterCurrency> MasterCurrencies { get; set; } = null!;
        public virtual DbSet<MasterDepartment> MasterDepartments { get; set; } = null!;
        public virtual DbSet<MasterDesignation> MasterDesignations { get; set; } = null!;
        public virtual DbSet<MasterDictionary> MasterDictionaries { get; set; } = null!;
        public virtual DbSet<MasterDictionaryDetail> MasterDictionaryDetails { get; set; } = null!;
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
        public virtual DbSet<MasterUserAddress> MasterUserAddresses { get; set; } = null!;
        public virtual DbSet<MasterUserContact> MasterUserContacts { get; set; } = null!;
        public virtual DbSet<MasterValuationFee> MasterValuationFees { get; set; } = null!;
        public virtual DbSet<MasterValuationFeeType> MasterValuationFeeTypes { get; set; } = null!;
        public virtual DbSet<MasterVendor> MasterVendors { get; set; } = null!;
        public virtual DbSet<RoleModulePermission> RoleModulePermissions { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=180.149.241.172;Initial Catalog=EltizamDB_Dev;Persist Security Info=True;User ID=eltizam_dbUser;pwd=eltizam234@#$;Connection Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("eltizam_dbUser");

            modelBuilder.Entity<AuditLog>(entity =>
            {
                entity.ToTable("Audit_Log", "dbo");

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
                entity.ToTable("Dictionary", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Type)
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<EmailLogHistory>(entity =>
            {
                entity.ToTable("EmailLogHistory", "dbo");

                entity.HasIndex(e => e.Id, "uq_EmailHistory")
                    .IsUnique();

                entity.Property(e => e.BccAddress)
                    .HasMaxLength(365)
                    .IsUnicode(false);

                entity.Property(e => e.Body).IsUnicode(false);

                entity.Property(e => e.Ccaddress)
                    .HasMaxLength(365)
                    .IsUnicode(false)
                    .HasColumnName("CCAddress");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmailResponse).IsUnicode(false);

                entity.Property(e => e.FromAddress)
                    .HasMaxLength(365)
                    .IsUnicode(false);

                entity.Property(e => e.Subject)
                    .HasMaxLength(365)
                    .IsUnicode(false);

                entity.Property(e => e.ToAddress)
                    .HasMaxLength(365)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterAddress>(entity =>
            {
                entity.ToTable("Master_Address", "dbo");

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
            });

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

            modelBuilder.Entity<MasterClient>(entity =>
            {
                entity.ToTable("Master_Client", "dbo");

                entity.Property(e => e.ClientName)
                    .HasMaxLength(752)
                    .IsUnicode(false)
                    .HasComputedColumnSql("(((([FirstName]+' ')+[MiddleName])+' ')+[LastName])", false);

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

                entity.Property(e => e.TrnexpiryDate)
                    .HasColumnType("datetime")
                    .HasColumnName("TRNExpiryDate");

                entity.Property(e => e.Trnnumber)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("TRNNumber");

                entity.HasOne(d => d.ClientType)
                    .WithMany(p => p.MasterClients)
                    .HasForeignKey(d => d.ClientTypeId)
                    .HasConstraintName("FK_Master_Client_Master_ClientType");
            });

            modelBuilder.Entity<MasterClientContact>(entity =>
            {
                entity.ToTable("Master_ClientContact", "dbo");

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
                entity.ToTable("Master_ClientType", "dbo");

                entity.Property(e => e.ClientType)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterConfig>(entity =>
            {
                entity.ToTable("Master_Config", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterContact>(entity =>
            {
                entity.ToTable("Master_Contact", "dbo");

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
                entity.ToTable("Master_Country", "dbo");

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

            modelBuilder.Entity<MasterCurrency>(entity =>
            {
                entity.ToTable("Master_Currency", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CurrencyCode)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.CurrencyName)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CurrencyValue).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.ExchangeRate).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterDepartment>(entity =>
            {
                entity.ToTable("Master_Department", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Department)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterDesignation>(entity =>
            {
                entity.ToTable("Master_Designation", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Designation)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterDictionary>(entity =>
            {
                entity.ToTable("Master_Dictionary", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Description)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterDictionaryDetail>(entity =>
            {
                entity.ToTable("Master_DictionaryDetail", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Description)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.HasOne(d => d.Dictionary)
                    .WithMany(p => p.MasterDictionaryDetails)
                    .HasForeignKey(d => d.DictionaryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Master_Di__Dicti__12FDD1B2");
            });

            modelBuilder.Entity<MasterDocument>(entity =>
            {
                entity.ToTable("Master_Document", "dbo");

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

                entity.ToTable("Master_Exception", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Message).HasMaxLength(500);

                entity.Property(e => e.Source).HasMaxLength(500);

                entity.Property(e => e.StrackTrace).HasMaxLength(4000);
            });

            modelBuilder.Entity<MasterLocation>(entity =>
            {
                entity.ToTable("Master_Location", "dbo");

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

                entity.ToTable("Master_Module", "dbo");

                entity.Property(e => e.ControlName).HasMaxLength(200);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.HoverIcon)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Icon)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");

                entity.Property(e => e.ModuleName).HasMaxLength(250);

                entity.Property(e => e.ViewName)
                    .HasMaxLength(500)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterOwnershipType>(entity =>
            {
                entity.ToTable("Master_OwnershipType", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.OwnershipType)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterPropertySubType>(entity =>
            {
                entity.ToTable("Master_PropertySubType", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PropertySubType)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.HasOne(d => d.PropertyType)
                    .WithMany(p => p.MasterPropertySubTypes)
                    .HasForeignKey(d => d.PropertyTypeId)
                    .HasConstraintName("FK__Master_Pr__Prope__05A3D694");
            });

            modelBuilder.Entity<MasterPropertyType>(entity =>
            {
                entity.ToTable("Master_PropertyType", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PropertyType)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterQualification>(entity =>
            {
                entity.ToTable("Master_Qualification", "dbo");

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
                entity.ToTable("Master_ResourceType", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.ResourceType)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterRole>(entity =>
            {
                entity.HasKey(e => e.Id);

                entity.ToTable("Master_Role", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.DeletedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");

                entity.Property(e => e.RoleName).HasMaxLength(50);
            });

            modelBuilder.Entity<MasterState>(entity =>
            {
                entity.ToTable("Master_State", "dbo");

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

                entity.ToTable("Master_SubModule", "dbo");

                entity.Property(e => e.ControlName).HasMaxLength(200);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");

                entity.Property(e => e.SubModuleName).HasMaxLength(250);
            });

            modelBuilder.Entity<MasterUser>(entity =>
            {
                entity.ToTable("Master_User", "dbo");

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

                entity.Property(e => e.ForgotPasswordDateTime).HasColumnType("datetime");

                entity.Property(e => e.ForgotPasswordToken)
                    .HasMaxLength(100)
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

            modelBuilder.Entity<MasterUserAddress>(entity =>
            {
                entity.ToTable("Master_UserAddress", "dbo");

                entity.Property(e => e.Address1)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Address2)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Address3)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PinNo)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.City)
                    .WithMany(p => p.MasterUserAddresses)
                    .HasForeignKey(d => d.CityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Master_UserAddress_Master_City");

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.MasterUserAddresses)
                    .HasForeignKey(d => d.CountryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Master_UserAddress_Master_Country");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.MasterUserAddresses)
                    .HasForeignKey(d => d.StateId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Master_UserAddress_Master_State");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.MasterUserAddresses)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Master_UserAddress_Master_User");
            });

            modelBuilder.Entity<MasterUserContact>(entity =>
            {
                entity.ToTable("Master_UserContact", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Email)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Mobile)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.MasterUserContacts)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Master_UserContact_Master_User");
            });

            modelBuilder.Entity<MasterValuationFee>(entity =>
            {
                entity.ToTable("Master_ValuationFees", "dbo");

                entity.Property(e => e.CarpetAreaInSqFt)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CarpetAreaInSqMtr)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.FixedvaluationFees).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.OtherCharges).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.TotalValuationFees).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.ValuationFees).HasColumnType("decimal(18, 6)");

                entity.Property(e => e.Vat)
                    .HasColumnType("decimal(18, 6)")
                    .HasColumnName("VAT");
            });

            modelBuilder.Entity<MasterValuationFeeType>(entity =>
            {
                entity.ToTable("Master_ValuationFeeType", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.ValuationFeeType)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MasterVendor>(entity =>
            {
                entity.ToTable("Master_Vendor", "dbo");

                entity.Property(e => e.BusinessType)
                    .HasMaxLength(250)
                    .IsUnicode(false);

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

                entity.ToTable("RoleModulePermission", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
