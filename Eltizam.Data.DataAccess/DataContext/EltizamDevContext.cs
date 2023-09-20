using Microsoft.EntityFrameworkCore;
using Eltizam.Data.DataAccess.Entity;
using Eltizam.Utility;
namespace Eltizam.Data.DataAccess.DataContext
{
    public partial class EltizamDevContext : DbContext
    {
        public EltizamDevContext()
        {
        }

        public EltizamDevContext(DbContextOptions<EltizamDevContext> options)
            : base(options)
        {
        }
        public virtual DbSet<Upload> Uploads { get; set; }
        public virtual DbSet<Tbl_User> TblUsers { get; set; }
       
        public virtual DbSet<MasterAuditLog> MasterAuditLogs { get; set; }
      
        public virtual DbSet<MasterBerequirement> MasterBerequirements { get; set; }
        public virtual DbSet<MasterBusinessUnit> MasterBusinessUnits { get; set; }
        public virtual DbSet<MasterBusinessUnitRegionMapping> MasterBusinessUnitRegionMappings { get; set; }
        public virtual DbSet<MasterCountry> MasterCountries { get; set; }
        public virtual DbSet<MasterCurrency> MasterCurrencies { get; set; }
        public virtual DbSet<MasterCurrencyCountryMapping> MasterCurrencyCountryMappings { get; set; }
        public virtual DbSet<MasterDepartment> MasterDepartments { get; set; }
        public virtual DbSet<MasterDepartmentBusinessUnitMapping> MasterDepartmentBusinessUnitMappings { get; set; }
        public virtual DbSet<MasterException> MasterExceptions { get; set; }
                
        public virtual DbSet<MasterRole> MasterRoles { get; set; }
     
        public virtual DbSet<MasterUser> MasterUsers { get; set; }
        
      
       
     
       
       
        public virtual DbSet<TblSessionManager> TblSessionManagers { get; set; }
        public virtual DbSet<UserSessionLogMaster> UserSessionLogMasters { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {

                optionsBuilder.UseSqlServer(DatabaseConnection.NPDDatabaseConnection);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("Eltizamdev_dbUser")
                .HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Tbl_User>(entity =>
            {
                entity.HasKey(e => e.Id);

                entity.ToTable("Tbl_User", "dbo");

                entity.Property(e => e.Name).HasMaxLength(100);

                entity.Property(e => e.Mobile).HasMaxLength(50);

                entity.Property(e => e.Email).HasMaxLength(100);

                entity.Property(e => e.Password).HasMaxLength(500);

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.IsActive)
                    .HasDefaultValueSql("((1))");
            });

           

            modelBuilder.Entity<MasterAuditLog>(entity =>
            {
                entity.HasKey(e => e.AuditLogId);

                entity.ToTable("Master_AuditLog", "dbo");

                entity.Property(e => e.ActionType).HasMaxLength(20);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");
            });

          

            modelBuilder.Entity<MasterBerequirement>(entity =>
            {
                entity.HasKey(e => e.BerequirementId);

                entity.ToTable("Master_BERequirement", "dbo");

                entity.Property(e => e.BerequirementId).HasColumnName("BERequirementId");

                entity.Property(e => e.BerequirementName)
                    .HasMaxLength(100)
                    .HasColumnName("BERequirementName");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterBusinessUnit>(entity =>
            {
                entity.HasKey(e => e.BusinessUnitId);

                entity.ToTable("Master_BusinessUnit", "dbo");

                entity.Property(e => e.BusinessUnitName).HasMaxLength(100);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterBusinessUnitRegionMapping>(entity =>
            {
                entity.HasKey(e => e.BusinessUnitCountryMappingId)
                    .HasName("PK_Master_BusinessCountryMapping");

                entity.ToTable("Master_BusinessUnitRegionMapping", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.HasOne(d => d.BusinessUnit)
                    .WithMany(p => p.MasterBusinessUnitRegionMappings)
                    .HasForeignKey(d => d.BusinessUnitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Master_BusinessUnitId");

                //entity.HasOne(d => d.Region)
                //    .WithMany(p => p.MasterBusinessUnitRegionMappings)
                //    .HasForeignKey(d => d.RegionId)
                //    .OnDelete(DeleteBehavior.ClientSetNull)
                //    .HasConstraintName("FK_Master_CountryId");
            });

            modelBuilder.Entity<MasterCountry>(entity =>
            {
                entity.HasKey(e => e.CountryId);

                entity.ToTable("Master_Country", "dbo");

                entity.Property(e => e.CountryId).HasColumnName("CountryID");

                entity.Property(e => e.CountryCode).HasMaxLength(5);

                entity.Property(e => e.CountryName).HasMaxLength(100);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.IsdcountryCode)
                    .HasMaxLength(5)
                    .HasColumnName("ISDCountryCode");

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterCurrency>(entity =>
            {
                entity.HasKey(e => e.CurrencyId);

                entity.ToTable("Master_Currency", "dbo");

                entity.Property(e => e.CurrencyId).HasColumnName("CurrencyID");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CurrencyCode).HasMaxLength(10);

                entity.Property(e => e.CurrencyName).HasMaxLength(100);

                entity.Property(e => e.CurrencySymbol).HasMaxLength(5);

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterCurrencyCountryMapping>(entity =>
            {
                entity.HasKey(e => e.CurrencyCountryMappingId);

                entity.ToTable("Master_CurrencyCountryMapping", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                //entity.HasOne(d => d.Country)
                //    .WithMany(p => p.MasterCurrencyCountryMappings)
                //    .HasForeignKey(d => d.CountryId)
                //    .OnDelete(DeleteBehavior.ClientSetNull)
                //    .HasConstraintName("FK_Master_CurrencyCountryMapping_Master_Country");

                entity.HasOne(d => d.Currency)
                    .WithMany(p => p.MasterCurrencyCountryMappings)
                    .HasForeignKey(d => d.CurrencyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Master_CurrencyCountryMapping_Master_Currency");
            });

            modelBuilder.Entity<MasterDepartment>(entity =>
            {
                entity.HasKey(e => e.DepartmentId);

                entity.ToTable("Master_Department", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.DepartmentName).HasMaxLength(100);

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<MasterDepartmentBusinessUnitMapping>(entity =>
            {
                entity.HasKey(e => e.DepartmentBusinessUnitMappingId)
                    .HasName("PK_Master_BusinessBusinessUnitMapping");

                entity.ToTable("Master_DepartmentBusinessUnitMapping", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.HasOne(d => d.BusinessUnit)
                    .WithMany(p => p.MasterDepartmentBusinessUnitMappings)
                    .HasForeignKey(d => d.BusinessUnitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Master_DepartmentBusinessUnitMapping_Master_BusinessUnit");

                entity.HasOne(d => d.Department)
                    .WithMany(p => p.MasterDepartmentBusinessUnitMappings)
                    .HasForeignKey(d => d.DepartmentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Master_DepartmentId");
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



         


            modelBuilder.Entity<MasterRole>(entity =>
            {
                entity.HasKey(e => e.RoleId);

                entity.ToTable("Master_Role", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.DeletedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");

                entity.Property(e => e.RoleName).HasMaxLength(50);
            });

          

            modelBuilder.Entity<MasterUser>(entity =>
            {
                entity.HasKey(e => e.UserId);

                entity.ToTable("Master_User", "dbo");

                entity.HasIndex(e => e.EmailAddress, "EmailAddress_unique")
                    .IsUnique();

                entity.Property(e => e.Address).HasMaxLength(200);

                entity.Property(e => e.AnalyticalGl).HasColumnName("AnalyticalGL");

                entity.Property(e => e.ApigroupLeader).HasColumnName("APIGroupLeader");

                entity.Property(e => e.Apiuser).HasColumnName("APIUser");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.DeletedDate).HasColumnType("datetime");

                entity.Property(e => e.DesignationName).HasMaxLength(100);

                entity.Property(e => e.EmailAddress)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ForgotPasswordDateTime).HasColumnType("datetime");

                entity.Property(e => e.ForgotPasswordToken)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.FormulationGl).HasColumnName("FormulationGL");

                entity.Property(e => e.FullName)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.MobileNumber)
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.Property(e => e.ModifyDate).HasColumnType("datetime");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                //entity.HasOne(d => d.Role)
                //    .WithMany(p => p.MasterUsers)
                //    .HasForeignKey(d => d.RoleId)
                //    .OnDelete(DeleteBehavior.ClientSetNull)
                //    .HasConstraintName("FK_Master_User_Master_Role");
            });





           
            modelBuilder.Entity<TblSessionManager>(entity =>
            {
                entity.HasKey(e => e.TokenId);

                entity.ToTable("Tbl_SessionManager", "dbo");

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.IsActive)
                    .HasColumnName("isActive")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.TokenIssuedAt).HasColumnType("datetime");

                entity.Property(e => e.VallidTo).HasColumnType("datetime");
            });
            modelBuilder.Entity<UserSessionLogMaster>(entity =>
            {
                entity.HasKey(e => e.UserLoginHistoryId);

                entity.ToTable("UserSessionLogMaster", "dbo");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserSessionLogMasters)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserSessionLogMaster_Master_User");
            });
            modelBuilder.Entity<Upload>(entity =>
            {
                entity.HasKey(e => e.Id);

                entity.ToTable("Upload", "dbo");

                entity.Property(e => e.FileName).HasMaxLength(500);

                entity.Property(e => e.ContentType).HasMaxLength(500);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.FileType).HasMaxLength(500);

            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
