 
 
/*Modification History:   ----------------------------
    WHEN ?           WHO?              WHAT? 
09/15/2023		YallaReddy CH		Fixes Used to get All values with comma separate
------------------------------------------------------- */
CREATE FUNCTION [dbo].[ufn_Split]
(
    @ListString NVARCHAR(max),
    @Delimiter VARCHAR(5) = ','
)
RETURNS @TableOfValues TABLE
	(
		Id SMALLINT IDENTITY(1,1),
		[Value] NVARCHAR(MAX)
	) 
AS 
BEGIN
    DECLARE @DelimiterLength INT = LEN(@Delimiter)
    DECLARE @ValueLength INT
  
    WHILE LEN(@ListString) > 0 
    BEGIN 
      SELECT @ValueLength = (CASE CHARINDEX(@Delimiter, @ListString) WHEN 0 THEN LEN(@ListString) ELSE (CHARINDEX(@Delimiter, @ListString) - 1) END) 
      
      INSERT INTO @TableOfValues 
        SELECT SUBSTRING(@ListString, 1, @ValueLength)
      
      SELECT @ListString = (CASE (LEN(@ListString) - @ValueLength) WHEN 0 THEN '' ELSE RIGHT(@ListString, LEN(@ListString) - @ValueLength - @DelimiterLength) END) 
    END
    
    RETURN
END  
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_Split_Multi]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
/*Modification History:   ----------------------------
    WHEN ?           WHO?              WHAT? 
09/15/2023		YallaReddy CH		Fixes  : Used to get All values with comma separate 
------------------------------------------------------- */
CREATE FUNCTION [dbo].[ufn_Split_Multi]
(
	@ListString NVARCHAR(max),
	@Delimiter VARCHAR(5),
	@SubDelimiter VARCHAR(5)
)
RETURNS @TableOfValues TABLE
(
	Id INT,
	[Value] NVARCHAR(MAX)
) 
AS 
BEGIN
	 ----- Declare tables --------
     DECLARE @temp TABLE (Id INT, [Value] VARCHAR(5000));
	 DECLARE @temp1 TABLE (Id INT, [Value] VARCHAR(5000));
	 DECLARE @id INT, @value NVARCHAR(MAX);

	 ----- Read Comma separate values  --------
	 INSERT INTO @temp 
	 SELECT Id, [Value] FROM [dbo].[ufn_Split](@ListString, @Delimiter)   

	
	 ----- Do loop for each row and pull data  --------
	 DECLARE cur CURSOR
	 FOR SELECT Id, [Value] FROM @temp  

	 OPEN cur; 
	 FETCH NEXT FROM cur INTO @id, @value;

	 WHILE @@FETCH_STATUS = 0
		BEGIN 
			----- Declare variable --------
			DECLARE @id1 INT=null, @val VARCHAR(100)=null;
			
			INSERT INTO @temp1 
			SELECT Id, [Value] FROM [dbo].[ufn_Split](@value, @SubDelimiter)  

			----- Read data from temp table & add to main table --------
			SELECT @id1 = LTRIM(RTRIM([Value])) FROM @temp1 t WHERE t.Id = 1 
			SELECT @val = LTRIM(RTRIM(ISNULL([Value],''))) FROM @temp1 t WHERE t.Id = 2 

			INSERT INTO @TableOfValues 
			SELECT @id1, @val 

			DELETE FROM @temp1
			FETCH NEXT FROM cur INTO @id,  @value;
		END; 
	 CLOSE cur; 
	 DEALLOCATE cur;
    
    RETURN
  END  
GO
/****** Object:  View [dbo].[vw_Property_Location]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vw_Property_Location]
AS
SELECT p.PropertyName, l.Address1+', '+ISNULL(l.Address2, '')+', '+l.[Zone]+', '+mci.CityName+', '+ms.StateName+', '+mc.CountryName [TotalAddress], l.*
FROM dbo.Master_Property p 
LEFT JOIN dbo.Master_Property_Location l WITH(NOLOCK) ON l.PropertyId = p.Id
LEFT JOIN dbo.Master_City mci WITH(NOLOCK) ON l.CityId = mci.Id
LEFT JOIN dbo.Master_State ms WITH(NOLOCK) ON l.StateId = ms.Id
LEFT JOIN dbo.Master_Country mc WITH(NOLOCK) ON l.CountryId = mc.Id
GO
/****** Object:  View [dbo].[vw_User]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE VIEW [dbo].[vw_User]
AS 
	SELECT u.*, r.RoleName,  IIF(r.RoleName ='Approver', 1, NULL) IsApprover, IIF(r.RoleName ='Valuer', 1, NULL) IsValuer
	FROM dbo.Master_User u
	JOIN dbo.Master_Role r ON r.Id = u.RoleId   
GO
/****** Object:  View [dbo].[vw_ValuationRequest]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ValuationRequest]
AS
SELECT vr.*, s.[Status] StatusName, s.StatusCode, s.[Type], s.[Group], s.ColorCode, s.BackGroundColor
FROM dbo.ValuationRequest vr WITH(NOLOCK)
LEFT JOIN dbo.Master_ValuationStatus s WITH(NOLOCK) ON s.Id = vr.StatusId
GO
/****** Object:  Table [dbo].[Comparable_Evidence]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comparable_Evidence](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[Size] [int] NULL,
	[Remarks] [nvarchar](250) NULL,
	[RateSqFt] [decimal](18, 0) NULL,
	[Price] [decimal](18, 0) NULL,
	[AddtionalComments] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_[dbo]].Comparable_Evidence] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailLogHistory]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailLogHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromAddress] [varchar](365) NOT NULL,
	[Subject] [varchar](365) NOT NULL,
	[ToAddress] [varchar](365) NOT NULL,
	[CCAddress] [varchar](365) NULL,
	[BccAddress] [varchar](365) NULL,
	[Body] [varchar](max) NOT NULL,
	[IsSent] [bit] NULL,
	[EmailResponse] [varchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_EmailHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_EmailHistory] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Address]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TableKeyId] [int] NULL,
	[TableName] [varchar](250) NULL,
	[Address1] [varchar](250) NOT NULL,
	[Address2] [varchar](250) NULL,
	[Address3] [varchar](250) NULL,
	[PinNo] [varchar](20) NULL,
	[Landmark] [varchar](250) NULL,
	[CountryId] [int] NULL,
	[StateId] [int] NULL,
	[CityId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[AlternatePhone] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[AlternateEmail] [varchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Landlinephone] [varchar](20) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[AlternatePhoneExt] [varchar](10) NULL,
	[PhoneExt] [varchar](10) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Amenity]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Amenity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AmenityName] [varchar](1000) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Icon] [varchar](500) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_Amenity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_AuditLog]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_AuditLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TableKeyId] [int] NULL,
	[TableName] [nvarchar](100) NULL,
	[ParentTableKeyId] [int] NULL,
	[ParentTableName] [varchar](1000) NULL,
	[ActionType] [nvarchar](20) NULL,
	[Log] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Master_AuditLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_City]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
	[CityName] [varchar](250) NULL,
	[STDCode] [varchar](50) NULL,
	[IsActive] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Master_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Client]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](250) NULL,
	[MiddleName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[ClientName]  AS (((([FirstName]+' ')+[MiddleName])+' ')+[LastName]),
	[ClientTypeId] [int] NULL,
	[Company] [varchar](250) NULL,
	[TRNNumber] [varchar](255) NULL,
	[TRNExpiryDate] [datetime] NULL,
	[LicenseNumber] [varchar](255) NULL,
	[IsActive] [bit] NULL,
	[Logo] [varchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ProfileAttachmentId] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_ClientContact]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_ClientContact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[ContactPerson] [varchar](250) NULL,
	[Department] [varchar](250) NULL,
	[Designation] [varchar](250) NULL,
	[Email] [varchar](100) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[IsActive] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_ClientContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_ClientType]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_ClientType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientType] [varchar](250) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_ClientType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Config]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PageNumer] [int] NULL,
	[PageSize] [int] NULL,
	[OrderBy] [int] NULL,
	[ReverseOrder] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Master_Config] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Contact]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TableKeyId] [int] NULL,
	[TableName] [varchar](250) NULL,
	[ContactPersonName] [varchar](250) NULL,
	[DepartmentId] [int] NULL,
	[DesignationId] [int] NULL,
	[Email] [varchar](250) NULL,
	[Mobile] [varchar](50) NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[MobileExt] [varchar](10) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Country]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](250) NOT NULL,
	[CountryCode] [varchar](20) NULL,
	[ISDCountryCode] [varchar](10) NULL,
	[IsActive] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Master_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Currency]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Currency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [varchar](250) NOT NULL,
	[CurrencyValue] [decimal](18, 6) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[ExchangeRate] [decimal](18, 6) NULL,
	[StateId] [int] NULL,
	[IsActive] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Master_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Department]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Department] [varchar](250) NOT NULL,
	[IsActive] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Master_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Designation]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [varchar](250) NOT NULL,
	[IsActive] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Master_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Dictionary]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Dictionary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NULL,
	[Sort] [int] NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[DictionaryCode] [varchar](100) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_Dictionary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_DictionaryDetail]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_DictionaryDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DictionaryId] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Sort] [int] NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Master_DictionaryDetial] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Document]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Document](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TableKeyId] [int] NOT NULL,
	[TableName] [varchar](100) NULL,
	[DocumentName] [varchar](250) NULL,
	[FileName] [varchar](250) NULL,
	[FileType] [varchar](100) NULL,
	[FilePath] [varchar](250) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_Document] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Exception]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Exception](
	[ExceptionId] [bigint] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](500) NULL,
	[Source] [nvarchar](500) NULL,
	[InnerException] [nvarchar](max) NULL,
	[StrackTrace] [nvarchar](4000) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
 CONSTRAINT [PK_Master_Exception] PRIMARY KEY CLUSTERED 
(
	[ExceptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Location]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](250) NULL,
	[CountryId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[Sector] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[Latitude] [nvarchar](255) NULL,
	[Longitude] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[HomeCurrencyId] [int] NULL,
	[ForeignCurrencyId] [int] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_Location_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Module]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Module](
	[ModuleId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleName] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifyBy] [int] NULL,
	[ModifyDate] [datetime] NULL,
	[ControlName] [nvarchar](200) NULL,
	[SortOrder] [int] NULL,
	[Icon] [varchar](500) NULL,
	[ViewName] [varchar](500) NULL,
	[HoverIcon] [varchar](100) NULL,
 CONSTRAINT [PK_Master_Module] PRIMARY KEY CLUSTERED 
(
	[ModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Notification]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ValuationRequestId] [int] NULL,
	[StatusId] [int] NULL,
	[Subject] [varchar](900) NULL,
	[ToEmails] [varchar](max) NULL,
	[Body] [varchar](max) NULL,
	[SentDatetime] [datetime] NULL,
	[IsEmailSent] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ReadBy] [int] NULL,
	[ReadDate] [datetime] NULL,
 CONSTRAINT [PK_Master_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_OwnershipType]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_OwnershipType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OwnershipType] [varchar](250) NOT NULL,
	[IsActive] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Master_OwnershipType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Property]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Property](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyName] [varchar](250) NULL,
	[PropertyTypeId] [int] NULL,
	[PropertySubTypeId] [int] NULL,
	[OwnershipTypeId] [int] NULL,
	[UnitType] [varchar](50) NULL,
	[AdditionalUnits] [varchar](250) NULL,
	[Furnished] [int] NULL,
	[ValuationPurpose] [varchar](250) NULL,
	[BuildUpAreaSqFt] [decimal](18, 6) NULL,
	[BuildUpAreaSqMtr] [decimal](18, 6) NULL,
	[AgeOfConstruction] [int] NULL,
	[IsActive] [bit] NULL,
	[Parking] [varchar](50) NULL,
	[ParkingBayNo] [varchar](250) NULL,
	[Description] [varchar](250) NULL,
	[Amenities] [varchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_Property] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Property_Amenity]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Property_Amenity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AmenityId] [int] NOT NULL,
	[PropertyId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[PropertyTypeId] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_Property_Amenity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Property_Location]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Property_Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyId] [int] NOT NULL,
	[CountryId] [int] NULL,
	[StateId] [int] NULL,
	[CityId] [int] NULL,
	[Zone] [varchar](250) NULL,
	[BuildingProject] [varchar](250) NULL,
	[Latitude] [varchar](20) NULL,
	[Longitude] [varchar](20) NULL,
	[Address1] [varchar](250) NULL,
	[Address2] [varchar](250) NULL,
	[Pincode] [varchar](50) NULL,
	[Landmark] [varchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_PropertyDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_PropertySubType]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_PropertySubType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertySubType] [varchar](250) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[PropertyTypeId] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_PropertySubType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_PropertyType]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_PropertyType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyType] [varchar](250) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_PropertType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Qualification]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Qualification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TableKeyId] [int] NOT NULL,
	[TableName] [varchar](100) NOT NULL,
	[Qualification] [varchar](250) NOT NULL,
	[Subject] [varchar](250) NULL,
	[Institute] [varchar](250) NULL,
	[Grade] [varchar](50) NULL,
	[YearOfInstitute] [varchar](50) NULL,
	[IsActive] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Maste_Qualification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_ResourceType]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_ResourceType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceType] [varchar](250) NOT NULL,
	[IsActive] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_ResourceType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Role]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK_Master_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_RoleModulePermission]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_RoleModulePermission](
	[RoleModuleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[ModuleId] [int] NULL,
	[SubModuleId] [int] NULL,
	[View] [bit] NULL,
	[Add] [bit] NULL,
	[Edit] [bit] NULL,
	[Delete] [bit] NULL,
	[Approve] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifyBy] [int] NULL,
	[ModifyDate] [datetime] NULL,
 CONSTRAINT [PK_RoleModulePermission] PRIMARY KEY CLUSTERED 
(
	[RoleModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_State]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[StateName] [varchar](250) NULL,
	[StateCode] [varchar](50) NULL,
	[IsActive] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Master_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_SubModule]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_SubModule](
	[SubModuleId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleId] [int] NULL,
	[SubModuleName] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifyBy] [int] NULL,
	[ModifyDate] [datetime] NULL,
	[ControlName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Master_SubModule] PRIMARY KEY CLUSTERED 
(
	[SubModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_User]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](250) NOT NULL,
	[MiddleName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[Gender] [char](1) NULL,
	[DateOfBirth] [datetime] NULL,
	[DepartmentId] [int] NULL,
	[DesignationId] [int] NULL,
	[LicenseNo] [varchar](100) NULL,
	[CompanyId] [int] NULL,
	[ResourceId] [int] NULL,
	[Password] [varchar](100) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[CompanyName] [varchar](250) NULL,
	[Email] [varchar](100) NULL,
	[RoleId] [int] NULL,
	[ForgotPasswordDateTime] [datetime] NULL,
	[ForgotPasswordToken] [varchar](100) NULL,
	[ReportsTo] [int] NULL,
	[UserTypeId] [int] NULL,
	[UserName]  AS (([FirstName]+' ')+[LastName]),
	[ProfileAttachmentId] [int] NULL,
	[IsDeleted] [bit] NULL,
	[ApproverLevelId] [int] NULL,
 CONSTRAINT [PK_MasterUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_UserAddress]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_UserAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Address1] [varchar](250) NOT NULL,
	[Address2] [varchar](250) NULL,
	[Address3] [varchar](250) NULL,
	[PinNo] [varchar](20) NULL,
	[CountryId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_MasterUserAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_UserContact]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_UserContact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Email] [varchar](250) NULL,
	[Mobile] [varchar](50) NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_UserContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_ValuationFees]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_ValuationFees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PropertyTypeId] [int] NULL,
	[PropertySubTypeId] [int] NULL,
	[OwnershipTypeId] [int] NULL,
	[CarpetAreaInSqFt] [varchar](250) NULL,
	[CarpetAreaInSqMtr] [varchar](250) NULL,
	[ClientTypeId] [int] NULL,
	[ValuationType] [int] NULL,
	[ValuationFeeTypeId] [int] NULL,
	[ValuationFees] [decimal](18, 6) NULL,
	[VAT] [decimal](18, 6) NULL,
	[OtherCharges] [decimal](18, 6) NULL,
	[TotalValuationFees] [decimal](18, 6) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[FixedvaluationFees] [decimal](18, 6) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_MasterValuationFees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_ValuationFeeType]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_ValuationFeeType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ValuationFeeType] [varchar](250) NULL,
	[IsActive] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_ValuationFeeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_ValuationRequestApproverLevel]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_ValuationRequestApproverLevel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[FromAmount] [decimal](18, 2) NOT NULL,
	[ToAmount] [decimal](18, 2) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Master_ValuationQuotationRange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_ValuationStatus]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_ValuationStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](500) NOT NULL,
	[StatusCode] [varchar](500) NOT NULL,
	[IsActive] [bit] NULL,
	[Sort] [int] NULL,
	[Group] [int] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifyBy] [int] NULL,
	[ModifyDate] [datetime] NULL,
	[ColorCode] [varchar](100) NULL,
	[BackGroundColor] [nvarchar](50) NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Master_ValuationStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Vendor]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Vendor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](250) NOT NULL,
	[CompanyName] [varchar](250) NULL,
	[EstimattionDate] [datetime] NULL,
	[BusinessType] [varchar](250) NULL,
	[CompanyDescription] [varchar](500) NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ProfileAttachmentId] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Master_Vendor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiteDescription]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteDescription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ValuationRequestId] [int] NOT NULL,
	[Location] [varchar](250) NULL,
	[InternalArea] [decimal](16, 8) NULL,
	[ExternalArea] [decimal](16, 8) NULL,
	[Floor] [int] NULL,
	[Room] [int] NULL,
	[Bedrooms] [int] NULL,
	[Storage] [varchar](250) NULL,
	[Quantity] [int] NULL,
	[AdditionComment] [varchar](750) NULL,
	[PropertyCondition] [varchar](750) NULL,
	[AdditionalNotes] [varchar](750) NULL,
	[Others] [varchar](750) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_dbo.SiteDescription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValuationAssesment]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValuationAssesment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NULL,
	[MarketValue] [decimal](18, 0) NULL,
	[MarketRate] [decimal](18, 0) NULL,
	[LifeOfBuilding] [int] NULL,
	[AnnualMaintainceCost] [decimal](18, 0) NULL,
	[Insuarance] [bit] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[InsuranceDetails] [nvarchar](250) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_dbo.ValuationAssesment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValuationInvoice]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValuationInvoice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceNO] [varchar](500) NOT NULL,
	[ValuationRequestId] [int] NOT NULL,
	[TransactionModeId] [int] NOT NULL,
	[TransactionStatusId] [int] NOT NULL,
	[Amount] [decimal](18, 6) NOT NULL,
	[CheckNumer] [varchar](500) NULL,
	[CheckBankName] [varchar](500) NULL,
	[CheckDate] [date] NULL,
	[CardNumber] [varchar](100) NULL,
	[CardBankName] [varchar](500) NULL,
	[CardHolderName] [varchar](500) NULL,
	[ExpireDate] [date] NULL,
	[AccountBankName] [varchar](500) NULL,
	[AccountHolderName] [varchar](500) NULL,
	[Note] [varchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[Balance] [decimal](18, 6) NULL,
	[TransactionDate] [datetime] NULL,
	[TransactionId] [varchar](100) NULL,
	[ChequeRecievedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ValuationInvoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValuationQuotation]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValuationQuotation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceNO] [varchar](500) NOT NULL,
	[ValuationRequestId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[ValuationFee] [decimal](18, 6) NOT NULL,
	[VAT] [decimal](18, 6) NOT NULL,
	[OtherCharges] [decimal](18, 6) NULL,
	[InstructorCharges] [decimal](18, 6) NULL,
	[Discount] [decimal](18, 6) NULL,
	[TotalFee] [decimal](18, 6) NULL,
	[Note] [varchar](max) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Quotation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValuationRequest]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValuationRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceNO] [varchar](500) NOT NULL,
	[OtherReferenceNO] [varchar](500) NULL,
	[ValuationModeId] [int] NOT NULL,
	[ValuationDate] [date] NULL,
	[ValuationTimeFrame] [int] NULL,
	[ClientId] [int] NOT NULL,
	[PropertyId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[ApproverId] [int] NULL,
	[ApproverComment] [varchar](500) NULL,
	[ApproverUpdateDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ValuerId] [int] NULL,
	[ValuerComment] [varchar](500) NULL,
	[ValuerUpdateDate] [datetime] NULL,
	[AssignRemark] [varchar](250) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ValuationRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValuationRequestApproverLevel]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValuationRequestApproverLevel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ValuationRequestId] [int] NOT NULL,
	[ValuationQuotationId] [int] NOT NULL,
	[ApproverLevelId] [int] NOT NULL,
	[ApproverId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[StatusId] [int] NULL,
	[ApproverComment] [varchar](500) NULL,
 CONSTRAINT [PK_ValuationRequestApproverLevel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValuationRequestStatusHistory]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValuationRequestStatusHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StatusId] [int] NOT NULL,
	[ValuationRequestId] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[StatusRemark] [nvarchar](300) NULL,
 CONSTRAINT [PK_ValuationRequestStatusHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comparable_Evidence] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_Address] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_Amenity] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_Client] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_ClientContact] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_ClientType] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_Contact] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_Dictionary] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_Document] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_Location] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_Notification] ADD  DEFAULT ((0)) FOR [IsEmailSent]
GO
ALTER TABLE [dbo].[Master_Property] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_Property_Amenity] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_Property_Location] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_PropertySubType] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_PropertyType] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_Qualification] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_ResourceType] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_User] ADD  CONSTRAINT [DF__Master_Us__Repor__078C1F06]  DEFAULT (NULL) FOR [ReportsTo]
GO
ALTER TABLE [dbo].[Master_User] ADD  CONSTRAINT [DF__Master_Us__UserT__09746778]  DEFAULT (NULL) FOR [UserTypeId]
GO
ALTER TABLE [dbo].[Master_User] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_UserAddress] ADD  CONSTRAINT [DF_MasterUserAddress_CountryId]  DEFAULT ((0)) FOR [CountryId]
GO
ALTER TABLE [dbo].[Master_UserAddress] ADD  CONSTRAINT [DF_MasterUserAddress_StateId]  DEFAULT ((0)) FOR [StateId]
GO
ALTER TABLE [dbo].[Master_UserAddress] ADD  CONSTRAINT [DF_MasterUserAddress_CityId]  DEFAULT ((0)) FOR [CityId]
GO
ALTER TABLE [dbo].[Master_UserAddress] ADD  CONSTRAINT [DF_MasterUserAddress_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Master_UserAddress] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_UserContact] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_ValuationFees] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_ValuationFeeType] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Master_ValuationRequestApproverLevel] ADD  DEFAULT (NULL) FOR [IsActive]
GO
ALTER TABLE [dbo].[Master_Vendor] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SiteDescription] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ValuationAssesment] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ValuationInvoice] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ValuationQuotation] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ValuationRequest] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ValuationRequestApproverLevel] ADD  DEFAULT (NULL) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Comparable_Evidence]  WITH CHECK ADD  CONSTRAINT [FK_Comparable_Evidence_ValuationRequest] FOREIGN KEY([RequestId])
REFERENCES [dbo].[ValuationRequest] ([Id])
GO
ALTER TABLE [dbo].[Comparable_Evidence] CHECK CONSTRAINT [FK_Comparable_Evidence_ValuationRequest]
GO
ALTER TABLE [dbo].[Master_Address]  WITH CHECK ADD  CONSTRAINT [FK_Master_Address_Master_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[Master_City] ([Id])
GO
ALTER TABLE [dbo].[Master_Address] CHECK CONSTRAINT [FK_Master_Address_Master_City]
GO
ALTER TABLE [dbo].[Master_Client]  WITH CHECK ADD  CONSTRAINT [FK_Master_Client_Master_ClientType] FOREIGN KEY([ClientTypeId])
REFERENCES [dbo].[Master_ClientType] ([Id])
GO
ALTER TABLE [dbo].[Master_Client] CHECK CONSTRAINT [FK_Master_Client_Master_ClientType]
GO
ALTER TABLE [dbo].[Master_ClientContact]  WITH CHECK ADD  CONSTRAINT [FK_Master_ClientContact_Master_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Master_Client] ([Id])
GO
ALTER TABLE [dbo].[Master_ClientContact] CHECK CONSTRAINT [FK_Master_ClientContact_Master_Client]
GO
ALTER TABLE [dbo].[Master_DictionaryDetail]  WITH CHECK ADD FOREIGN KEY([DictionaryId])
REFERENCES [dbo].[Master_Dictionary] ([Id])
GO
ALTER TABLE [dbo].[Master_Location]  WITH CHECK ADD  CONSTRAINT [FK_Master_Location_Master_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[Master_City] ([Id])
GO
ALTER TABLE [dbo].[Master_Location] CHECK CONSTRAINT [FK_Master_Location_Master_City]
GO
ALTER TABLE [dbo].[Master_Location]  WITH CHECK ADD  CONSTRAINT [FK_Master_Location_Master_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Master_Country] ([Id])
GO
ALTER TABLE [dbo].[Master_Location] CHECK CONSTRAINT [FK_Master_Location_Master_Country]
GO
ALTER TABLE [dbo].[Master_Location]  WITH CHECK ADD  CONSTRAINT [FK_Master_Location_Master_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[Master_State] ([Id])
GO
ALTER TABLE [dbo].[Master_Location] CHECK CONSTRAINT [FK_Master_Location_Master_State]
GO
ALTER TABLE [dbo].[Master_Notification]  WITH CHECK ADD FOREIGN KEY([ValuationRequestId])
REFERENCES [dbo].[ValuationRequest] ([Id])
GO
ALTER TABLE [dbo].[Master_Property_Amenity]  WITH CHECK ADD FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Master_Amenity] ([Id])
GO
ALTER TABLE [dbo].[Master_Property_Amenity]  WITH CHECK ADD  CONSTRAINT [FK__Master_Pr__Prope__3EDC53F0] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Master_Property] ([Id])
GO
ALTER TABLE [dbo].[Master_Property_Amenity] CHECK CONSTRAINT [FK__Master_Pr__Prope__3EDC53F0]
GO
ALTER TABLE [dbo].[Master_Property_Location]  WITH CHECK ADD  CONSTRAINT [FK_Master_PropertyDetail_Master_Property] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Master_Property] ([Id])
GO
ALTER TABLE [dbo].[Master_Property_Location] CHECK CONSTRAINT [FK_Master_PropertyDetail_Master_Property]
GO
ALTER TABLE [dbo].[Master_PropertySubType]  WITH CHECK ADD FOREIGN KEY([PropertyTypeId])
REFERENCES [dbo].[Master_PropertyType] ([Id])
GO
ALTER TABLE [dbo].[Master_State]  WITH CHECK ADD  CONSTRAINT [FK_Master_State_Master_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Master_Country] ([Id])
GO
ALTER TABLE [dbo].[Master_State] CHECK CONSTRAINT [FK_Master_State_Master_Country]
GO
ALTER TABLE [dbo].[Master_User]  WITH CHECK ADD  CONSTRAINT [FK_Master_User_Master_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Master_Department] ([Id])
GO
ALTER TABLE [dbo].[Master_User] CHECK CONSTRAINT [FK_Master_User_Master_Department]
GO
ALTER TABLE [dbo].[Master_User]  WITH CHECK ADD  CONSTRAINT [FK_Master_User_Master_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Master_Designation] ([Id])
GO
ALTER TABLE [dbo].[Master_User] CHECK CONSTRAINT [FK_Master_User_Master_Designation]
GO
ALTER TABLE [dbo].[Master_UserAddress]  WITH CHECK ADD  CONSTRAINT [FK_Master_UserAddress_Master_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[Master_City] ([Id])
GO
ALTER TABLE [dbo].[Master_UserAddress] CHECK CONSTRAINT [FK_Master_UserAddress_Master_City]
GO
ALTER TABLE [dbo].[Master_UserAddress]  WITH CHECK ADD  CONSTRAINT [FK_Master_UserAddress_Master_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Master_Country] ([Id])
GO
ALTER TABLE [dbo].[Master_UserAddress] CHECK CONSTRAINT [FK_Master_UserAddress_Master_Country]
GO
ALTER TABLE [dbo].[Master_UserAddress]  WITH CHECK ADD  CONSTRAINT [FK_Master_UserAddress_Master_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[Master_State] ([Id])
GO
ALTER TABLE [dbo].[Master_UserAddress] CHECK CONSTRAINT [FK_Master_UserAddress_Master_State]
GO
ALTER TABLE [dbo].[Master_UserAddress]  WITH CHECK ADD  CONSTRAINT [FK_Master_UserAddress_Master_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Master_User] ([Id])
GO
ALTER TABLE [dbo].[Master_UserAddress] CHECK CONSTRAINT [FK_Master_UserAddress_Master_User]
GO
ALTER TABLE [dbo].[Master_UserContact]  WITH CHECK ADD  CONSTRAINT [FK_Master_UserContact_Master_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Master_User] ([Id])
GO
ALTER TABLE [dbo].[Master_UserContact] CHECK CONSTRAINT [FK_Master_UserContact_Master_User]
GO
ALTER TABLE [dbo].[SiteDescription]  WITH CHECK ADD  CONSTRAINT [FK_SiteDescription_ValuationRequest] FOREIGN KEY([ValuationRequestId])
REFERENCES [dbo].[ValuationRequest] ([Id])
GO
ALTER TABLE [dbo].[SiteDescription] CHECK CONSTRAINT [FK_SiteDescription_ValuationRequest]
GO
ALTER TABLE [dbo].[ValuationAssesment]  WITH CHECK ADD  CONSTRAINT [FK_ValuationAssesment_ValuationRequest] FOREIGN KEY([RequestId])
REFERENCES [dbo].[ValuationRequest] ([Id])
GO
ALTER TABLE [dbo].[ValuationAssesment] CHECK CONSTRAINT [FK_ValuationAssesment_ValuationRequest]
GO
ALTER TABLE [dbo].[ValuationInvoice]  WITH CHECK ADD FOREIGN KEY([ValuationRequestId])
REFERENCES [dbo].[ValuationRequest] ([Id])
GO
ALTER TABLE [dbo].[ValuationQuotation]  WITH CHECK ADD FOREIGN KEY([ValuationRequestId])
REFERENCES [dbo].[ValuationRequest] ([Id])
GO
ALTER TABLE [dbo].[ValuationQuotation]  WITH CHECK ADD FOREIGN KEY([ValuationRequestId])
REFERENCES [dbo].[ValuationRequest] ([Id])
GO
ALTER TABLE [dbo].[ValuationRequest]  WITH CHECK ADD FOREIGN KEY([ApproverId])
REFERENCES [dbo].[Master_User] ([Id])
GO
ALTER TABLE [dbo].[ValuationRequest]  WITH CHECK ADD FOREIGN KEY([ClientId])
REFERENCES [dbo].[Master_Client] ([Id])
GO
ALTER TABLE [dbo].[ValuationRequest]  WITH CHECK ADD FOREIGN KEY([PropertyId])
REFERENCES [dbo].[Master_Property] ([Id])
GO
ALTER TABLE [dbo].[ValuationRequest]  WITH CHECK ADD FOREIGN KEY([StatusId])
REFERENCES [dbo].[Master_ValuationStatus] ([Id])
GO
ALTER TABLE [dbo].[ValuationRequestApproverLevel]  WITH CHECK ADD FOREIGN KEY([ValuationRequestId])
REFERENCES [dbo].[ValuationRequest] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[stp_npd_GetCityList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [stp_npd_GetCityList] @SearchText = '', @PageSize = 1000, @CurrentPageNumber = 0
CREATE PROCEDURE [dbo].[stp_npd_GetCityList]          
(
@CityId INT = 0,
@CurrentPageNumber INT = 0,            
@PageSize INT = 25,            
@SortColumn VARCHAR(100) = 'CityName',            
@SortDirection VARCHAR(5) = 'ASC',            
@SearchText VARCHAR(MAX) =null
)        
AS          
BEGIN    

SET NOCOUNT ON;
Set @SearchText = IsNull(@SearchText, '')
Select * from (
SELECT Count(Id) OVER() TotalCount, * , ROW_NUMBER() OVER 
(
ORDER BY 
CASE          
WHEN @SortDirection <> 'DESC' THEN 0          
WHEN @SortColumn = 'Id' THEN  Id           
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN 0          
WHEN @SortColumn = 'Id' THEN Id
END ASC 
, CASE          
WHEN @SortDirection <> 'DESC' THEN 'DESC'          
WHEN @SortColumn = 'CityName' THEN CityName     
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN 'ASC'          
WHEN @SortColumn = 'CityName' THEN CityName
END ASC 
, CASE          
WHEN @SortDirection <> 'DESC' THEN null          
WHEN @SortColumn = 'CreatedDate' THEN CreatedDate      
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN null          
WHEN @SortColumn = 'CreatedDate' THEN CreatedDate          
END ASC
) 
RowNumber from (
SELECT COUNT(C.[Id]) OVER() TotalRecord,C.Id, C.CityName,C.StateId,S.StateName,C.CountryId,CN.CountryName,C.STDCode, C.IsActive,C.CreatedDate, C.CreatedBy, C.ModifiedDate, C.ModifiedBy
FROM Master_City C inner join Master_State S ON C.StateId=S.Id
Inner join Master_Country CN ON C.CountryId=CN.Id
) AS B WHERE   
CityName LIKE '%' + @SearchText + '%'
) As C Where 
RowNumber BETWEEN (@CurrentPageNumber) + 1 AND (@CurrentPageNumber) + @PageSize     
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[stp_npd_GetDepartmentList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec stp_npd_GetDepartmentList @SearchText = '', @PageSize = 1000, @CurrentPageNumber = 0
CREATE PROCEDURE [dbo].[stp_npd_GetDepartmentList]          
(
@DepartmentId INT = 0,
@CurrentPageNumber INT = 0,            
@PageSize INT = 25,            
@SortColumn VARCHAR(100) = 'Department',            
@SortDirection VARCHAR(5) = 'ASC',            
@SearchText VARCHAR(MAX) =''
)        
AS          
BEGIN    

SET NOCOUNT ON;
Set @SearchText = IsNull(@SearchText, '')
Select * from (
SELECT Count(Id) OVER() TotalCount, * , ROW_NUMBER() OVER 
(
ORDER BY 
CASE          
WHEN @SortDirection <> 'DESC' THEN 0          
WHEN @SortColumn = 'Id' THEN  Id           
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN 0          
WHEN @SortColumn = 'Id' THEN Id
END ASC 
, CASE          
WHEN @SortDirection <> 'DESC' THEN 'DESC'          
WHEN @SortColumn = 'Department' THEN Department     
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN 'ASC'          
WHEN @SortColumn = 'Department' THEN Department
END ASC 
, CASE          
WHEN @SortDirection <> 'DESC' THEN null          
WHEN @SortColumn = 'CreatedDate' THEN CreatedDate      
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN null          
WHEN @SortColumn = 'CreatedDate' THEN CreatedDate          
END ASC
) 
RowNumber from (
SELECT COUNT([Id]) OVER() TotalRecord,Id, Department, IsActive,CreatedDate, CreatedBy, ModifiedDate, ModifiedBy
FROM Master_Department
	
) AS B WHERE   
Department LIKE '%' + @SearchText + '%'
) As C Where 
RowNumber BETWEEN (@CurrentPageNumber) + 1 AND (@CurrentPageNumber) + @PageSize     
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[stp_npd_GetDesignationList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec stp_npd_GetDesignationList @SearchText = '', @PageSize = 1000, @CurrentPageNumber = 0
CREATE PROCEDURE [dbo].[stp_npd_GetDesignationList]          
(
@DesignationId INT = 0,
@CurrentPageNumber INT = 0,            
@PageSize INT = 25,            
@SortColumn VARCHAR(100) = 'Designation',            
@SortDirection VARCHAR(5) = 'ASC',            
@SearchText VARCHAR(MAX) =''
)        
AS          
BEGIN    

SET NOCOUNT ON;
Set @SearchText = IsNull(@SearchText, '')
Select * from (
SELECT Count(Id) OVER() TotalCount, * , ROW_NUMBER() OVER 
(
ORDER BY 
CASE          
WHEN @SortDirection <> 'DESC' THEN 0          
WHEN @SortColumn = 'Id' THEN  Id           
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN 0          
WHEN @SortColumn = 'Id' THEN Id
END ASC 
, CASE          
WHEN @SortDirection <> 'DESC' THEN 'DESC'          
WHEN @SortColumn = 'Designation' THEN Designation     
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN 'ASC'          
WHEN @SortColumn = 'Designation' THEN Designation
END ASC 
, CASE          
WHEN @SortDirection <> 'DESC' THEN null          
WHEN @SortColumn = 'CreatedDate' THEN CreatedDate      
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN null          
WHEN @SortColumn = 'CreatedDate' THEN CreatedDate          
END ASC
) 
RowNumber from (
SELECT COUNT([Id]) OVER() TotalRecord,Id, Designation, IsActive,CreatedDate, CreatedBy, ModifiedDate, ModifiedBy
FROM Master_Designation
	
) AS B WHERE   
Designation LIKE '%' + @SearchText + '%'
) As C Where 
RowNumber BETWEEN (@CurrentPageNumber) + 1 AND (@CurrentPageNumber) + @PageSize     
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[stp_npd_GetLocationList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [stp_npd_GetLocationList] @SearchText = '', @PageSize = 1000, @CurrentPageNumber = 0
CREATE PROCEDURE [dbo].[stp_npd_GetLocationList]          
(
@LocationId INT = 0,
@CurrentPageNumber INT = 0,            
@PageSize INT = 25,            
@SortColumn VARCHAR(100) = 'LocationName',            
@SortDirection VARCHAR(5) = 'ASC',            
@SearchText VARCHAR(MAX) =''
)        
AS          
BEGIN    

SET NOCOUNT ON;
Set @SearchText = IsNull(@SearchText, '')
Select * from (
SELECT Count(Id) OVER() TotalCount, * , ROW_NUMBER() OVER 
(
ORDER BY 
CASE          
WHEN @SortDirection <> 'DESC' THEN 0          
WHEN @SortColumn = 'Id' THEN  Id           
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN 0          
WHEN @SortColumn = 'Id' THEN Id
END ASC 
, CASE          
WHEN @SortDirection <> 'DESC' THEN 'DESC'          
WHEN @SortColumn = 'LocationName' THEN LocationName     
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN 'ASC'          
WHEN @SortColumn = 'LocationName' THEN LocationName
END ASC 
, CASE          
WHEN @SortDirection <> 'DESC' THEN null          
WHEN @SortColumn = 'CreatedDate' THEN CreatedDate      
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN null          
WHEN @SortColumn = 'CreatedDate' THEN CreatedDate          
END ASC
) 
RowNumber from (
SELECT COUNT(C.[Id]) OVER() TotalRecord,C.Id, L.LocationName,L.CountryId,C.CountryName,L.StateId,S.StateName,L.CityId,CT.CityName, 
L.Sector,L.[Status],L.Latitude,L.Longitude, C.IsActive,C.CreatedDate, C.CreatedBy, C.ModifiedDate, C.ModifiedBy
FROM Master_Location L inner join Master_Country C ON L.CountryId=C.Id
inner join Master_State S ON L.StateId=S.Id	
inner join Master_City CT ON L.CityId=CT.Id
) AS B WHERE   
LocationName LIKE '%' + @SearchText + '%'
) As C Where 
RowNumber BETWEEN (@CurrentPageNumber) + 1 AND (@CurrentPageNumber) + @PageSize     
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[stp_npd_GetOwnershipTypeList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec stp_npd_GetDepartmentList @SearchText = '', @PageSize = 1000, @CurrentPageNumber = 0
CREATE PROCEDURE [dbo].[stp_npd_GetOwnershipTypeList]          
(
@OwnershipTypeId INT = 0,
@CurrentPageNumber INT = 0,            
@PageSize INT = 25,            
@SortColumn VARCHAR(100) = 'OwnershipType',            
@SortDirection VARCHAR(5) = 'ASC',            
@SearchText VARCHAR(MAX) =''
)        
AS          
BEGIN    

SET NOCOUNT ON;
Set @SearchText = IsNull(@SearchText, '')
Select * from (
SELECT Count(Id) OVER() TotalCount, * , ROW_NUMBER() OVER 
(
ORDER BY 
CASE          
WHEN @SortDirection <> 'DESC' THEN 0          
WHEN @SortColumn = 'Id' THEN  Id           
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN 0          
WHEN @SortColumn = 'Id' THEN Id
END ASC 
, CASE          
WHEN @SortDirection <> 'DESC' THEN 'DESC'          
WHEN @SortColumn = 'OwnershipType' THEN OwnershipType     
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN 'ASC'          
WHEN @SortColumn = 'OwnershipType' THEN OwnershipType
END ASC 
, CASE          
WHEN @SortDirection <> 'DESC' THEN null          
WHEN @SortColumn = 'CreatedDate' THEN CreatedDate      
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN null          
WHEN @SortColumn = 'CreatedDate' THEN CreatedDate          
END ASC
) 
RowNumber from (
SELECT COUNT([Id]) OVER() TotalRecord,Id, OwnershipType, IsActive,CreatedDate, CreatedBy, ModifiedDate, ModifiedBy
FROM Master_OwnershipType
	
) AS B WHERE   
OwnershipType LIKE '%' + @SearchText + '%'
) As C Where 
RowNumber BETWEEN (@CurrentPageNumber) + 1 AND (@CurrentPageNumber) + @PageSize     
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[stp_npd_GetStateList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [stp_npd_GetStateList] @SearchText = '', @PageSize = 1000, @CurrentPageNumber = 0
CREATE PROCEDURE [dbo].[stp_npd_GetStateList]          
(
@StateId INT = 0,
@CurrentPageNumber INT = 0,            
@PageSize INT = 25,            
@SortColumn VARCHAR(100) = 'StateName',            
@SortDirection VARCHAR(5) = 'ASC',            
@SearchText VARCHAR(MAX) =''
)        
AS          
BEGIN    

SET NOCOUNT ON;
Set @SearchText = IsNull(@SearchText, '')
Select * from (
SELECT Count(Id) OVER() TotalCount, * , ROW_NUMBER() OVER 
(
ORDER BY 
CASE          
WHEN @SortDirection <> 'DESC' THEN 0          
WHEN @SortColumn = 'Id' THEN  Id           
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN 0          
WHEN @SortColumn = 'Id' THEN Id
END ASC 
, CASE          
WHEN @SortDirection <> 'DESC' THEN 'DESC'          
WHEN @SortColumn = 'StateName' THEN StateName     
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN 'ASC'          
WHEN @SortColumn = 'StateName' THEN StateName
END ASC 
, CASE          
WHEN @SortDirection <> 'DESC' THEN null          
WHEN @SortColumn = 'CreatedDate' THEN CreatedDate      
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN null          
WHEN @SortColumn = 'CreatedDate' THEN CreatedDate          
END ASC
) 
RowNumber from (
SELECT COUNT(S.[Id]) OVER() TotalRecord,S.Id, S.StateName,S.CountryId,C.CountryName,S.StateCode, S.IsActive,S.CreatedDate, S.CreatedBy, S.ModifiedDate, S.ModifiedBy
FROM Master_State S Inner join Master_Country C ON S.CountryId=C.Id
) AS B WHERE   
StateName LIKE '%' + @SearchText + '%'
) As C Where 
RowNumber BETWEEN (@CurrentPageNumber) + 1 AND (@CurrentPageNumber) + @PageSize     
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[stp_npd_GetValuationDataforPDF]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--?TransactionStatusId,     
      
    
-- exec [stp_npd_GetValuationDataforPDF] @ID = 53     
CREATE OR ALTER PROCEDURE [dbo].[usp_ValuationRequest_ReportData]                
(      
@Id INT = 0      
)              
AS                
BEGIN      
DECLARE @ClientId AS INT    
DECLARE @PropertyId AS INT    
    
	--------------------------------------------------------    
	 select @ClientId =ClientId,    
	   @PropertyId = PropertyId    
	from ValuationRequest       
	where Id = @Id     
	--select @PropertyId,@ClientId    
	-----------------Valuation Request Table 0------------------------------------------------------    
	 
	 select     
	  ReferenceNO,OtherReferenceNO,      
	(select UserName from Master_User where id = ApproverId ) as ApproverName,      
	(select UserName from Master_User where id = ValuerId ) as ValuerName,      
	 (select [Status] from Master_ValuationStatus where id = StatusId ) as ValuationRequestStatus,  -->02012024 
	 -- 'status' as ValuationRequestStatus,  
	ApproverComment as ReviewComment,      
	ValuationDate,      
	'Method of Valuation' as MethodofValuation,      
	[ValuationTimeFrame]     
	from ValuationRequest       
	where Id = @Id      
    
    
	-----------------Client Table 1---------------------------------------------------    
	select     
	(select ClientType from Master_ClientType where Id = ClientTypeId) as ClientType,    
	ClientName as Clients,    
	Company, ma.PinNo,    
	(Select CountryName from Master_Country where id= ma.CountryId) [Country],    
	(Select StateName from Master_State where id= ma.StateId) [State],    
	(Select CityName from Master_City where id= ma.CityId) [City],    
	TRNNumber,    
	TRNExpiryDate,    
	LicenseNumber,    
	ma.Address1, ma.Address2    
    
	from Master_Client mc    
	left join Master_Address ma on ma.TableKeyId = mc.Id and ma.TableName = 'Master_Client'    
	where mc.Id =@ClientId --> 3    
    
	----------------- Master_Contact Table 2---------------------------------------------------    
	select mc.Id,    
	mcon.ContactPersonName,mcon.DepartmentId, mcon.DesignationId,mcon.Email,mcon.Mobile,    
	(Select Department from Master_Department where id= mcon.DepartmentId) [Department],    
	(Select Designation from Master_Designation where id= mcon.DesignationId) [Designation]    
	from Master_Client mc    
	left join Master_Contact mcon on mcon.TableKeyId = mc.Id and mcon.TableName = 'Master_Client'    
	where mc.Id = @ClientId -->2    
	-----------------Master_Property Table 3---------------------------------------------------    
	select    
	(Select PropertyType from Master_PropertyType where id= PropertyTypeId) [PropertyType],    
	(Select PropertySubType from Master_PropertySubType where id= PropertySubTypeId) [PropertySubType],    
	(Select OwnershipType from Master_OwnershipType where id= OwnershipTypeId) [OwnershipType],    
	PropertyName,    
	UnitType,AdditionalUnits,Furnished,ValuationPurpose,BuildUpAreaSqFt,BuildUpAreaSqMtr,AgeOfConstruction,Parking    
	, ParkingBayNo,Description    
    
	from Master_Property where Id = @PropertyId --> 4    
    
    
	-----------------Master_Amenity Table 4---------------------------------------------------    
	select am.AmenityName,propam.IsActive ,   
	CASE  
		WHEN (propam.IsActive=1) THEN 'checked'  
		ELSE ''  
	END as IsAvailable  
  
	from Master_Amenity am inner join Master_Property_Amenity propam on propam.AmenityId = am.Id    
	where propam.PropertyId = @PropertyId    
    
	-----------------Master_Property_Location Table 5---------------------------------------------------    
	select    
	(Select CountryName from Master_Country where id= CountryId) [Country],    
	(Select StateName from Master_State where id= StateId) [State],    
	(Select CityName from Master_City where id= CityId) [City],    
    
	Zone,BuildingProject,Latitude,Longitude,Address1,Address2,Pincode,Landmark    
	from Master_Property_Location where PropertyId = @PropertyId    
    
	----------------Valuation Quotation Table 6---------------------------------------------------    
	select ReferenceNO as Quotation,ValuationFee,VAT, OtherCharges,Discount,TotalFee,CreatedDate,    
	--(Select StatusName from ValuationQuotationStatus where id= StatusId) [Status]    ---->02012024
	'status1' [Status]  
	from ValuationQuotation where ValuationRequestId =@Id -->ValuationRequestId    
    
	----------------Valuation Invoice Table 7---------------------------------------------------    
	select ReferenceNO as InvoiceNo,ValuationRequestId,TransactionId,TransactionStatusId,Amount,TransactionDate,CreatedDate    
	from ValuationInvoice where ValuationRequestId = @Id -->ValuationRequestId    
    
	----------------Site Description / Structural Info Table 8---------------------------------------------------    
	select Location,InternalArea,ExternalArea,Floor,Room,Bedrooms,Storage,Quantity,AdditionComment    
	,PropertyCondition,AdditionalNotes,Others    
	from SiteDescription where ValuationRequestId = @Id -->ValuationRequestId    
    
	--------------Comparable_Evidence--9--------------------------------------------------    
	Select Type,Size,Remarks,RateSqFt,Price,AddtionalComments    
	from Comparable_Evidence where RequestId = @Id -->ValuationRequestId 5 28    
    
	--------------Valuation_Evidence--10--------------------------------------------------    
	select MarketValue, MarketRate,LifeOfBuilding, AnnualMaintainceCost,InsuranceDetails    
	from ValuationAssesment where RequestId = @Id -->ValuationRequestId 5 28    
    
END 
GO
/****** Object:  StoredProcedure [dbo].[stp_npd_GetValuationFeesList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec stp_npd_GetValuationFeesList @SearchText = '', @PageSize = 1000, @CurrentPageNumber = 0
Create PROCEDURE [dbo].[stp_npd_GetValuationFeesList]          
(
@ValuationFeeId INT = 0,
@CurrentPageNumber INT = 0,            
@PageSize INT = 25,            
@SortColumn VARCHAR(100) = 'Id',            
@SortDirection VARCHAR(5) = 'ASC',            
@SearchText VARCHAR(MAX) =''
)        
AS          
BEGIN    

SET NOCOUNT ON;
Set @SearchText = IsNull(@SearchText, '')
Select * from (
SELECT Count(Id) OVER() TotalCount, * , ROW_NUMBER() OVER 
(
ORDER BY 
CASE          
WHEN @SortDirection <> 'DESC' THEN 0          
WHEN @SortColumn = 'Id' THEN  Id           
END DESC           
) 
RowNumber from (
SELECT COUNT([Id]) OVER() TotalRecord, Id, PropertyTypeId, PropertySubTypeId, OwnershipTypeId, CarpetAreaInSqFt, CarpetAreaInSqMtr,
 ClientTypeId, ValuationType, ValuationFeeTypeId, ValuationFees, VAT, OtherCharges, TotalValuationFees, CreatedDate, CreatedBy
FROM Master_ValuationFees
	
) AS B -- WHERE   
-- ValuationFeeType LIKE '%' + @SearchText + '%'
) As C Where 
RowNumber BETWEEN (@CurrentPageNumber) + 1 AND (@CurrentPageNumber) + @PageSize     
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[stp_npd_GetValuationFeeTypeList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec stp_npd_GetValuationFeeTypeList @SearchText = '', @PageSize = 1000, @CurrentPageNumber = 0
CREATE PROCEDURE [dbo].[stp_npd_GetValuationFeeTypeList]          
(
@ValuationFeeTypeId INT = 0,
@CurrentPageNumber INT = 0,            
@PageSize INT = 25,            
@SortColumn VARCHAR(100) = 'ValuationFeeType',            
@SortDirection VARCHAR(5) = 'ASC',            
@SearchText VARCHAR(MAX) =''
)        
AS          
BEGIN    

SET NOCOUNT ON;
Set @SearchText = IsNull(@SearchText, '')
Select * from (
SELECT Count(Id) OVER() TotalCount, * , ROW_NUMBER() OVER 
(
ORDER BY 
CASE          
WHEN @SortDirection <> 'DESC' THEN 0          
WHEN @SortColumn = 'Id' THEN  Id           
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN 0          
WHEN @SortColumn = 'Id' THEN Id
END ASC 
, CASE          
WHEN @SortDirection <> 'DESC' THEN 'DESC'          
WHEN @SortColumn = 'ValuationFeeType' THEN ValuationFeeType     
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN 'ASC'          
WHEN @SortColumn = 'ValuationFeeType' THEN ValuationFeeType
END ASC 
, CASE          
WHEN @SortDirection <> 'DESC' THEN null          
WHEN @SortColumn = 'CreatedDate' THEN CreatedDate      
END DESC           
,CASE          
WHEN @SortDirection <> 'ASC' THEN null          
WHEN @SortColumn = 'CreatedDate' THEN CreatedDate          
END ASC
) 
RowNumber from (
SELECT COUNT([Id]) OVER() TotalRecord,Id, ValuationFeeType, IsActive,CreatedDate, CreatedBy, ModifiedDate, ModifiedBy
FROM Master_ValuationFeeType
	
) AS B WHERE   
ValuationFeeType LIKE '%' + @SearchText + '%'
) As C Where 
RowNumber BETWEEN (@CurrentPageNumber) + 1 AND (@CurrentPageNumber) + @PageSize     
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[stp_PropertyType_GetAll]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[stp_PropertyType_GetAll]
AS
BEGIN
	SELECT p.Id, p.PropertyType, p.IsActive, s.SubTypes
	FROM dbo.Master_PropertyType p
	OUTER APPLY (SELECT STUFF((SELECT ',' + PropertySubType  
				   FROM Master_PropertySubType b       
				   WHERE b.PropertyTypeId = p.Id  AND b.IsActive = 1    
				   FOR XML PATH('')), 1, 1, ''
				  ) as SubTypes
				 ) s
	WHERE p.IsActive = 1

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Address_GetAddressByTableKeyId]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [usp_Address_GetAddressByTableKeyId] @TableKeyId = 3, @TableName = 'Master_Client'
CREATE PROCEDURE [dbo].[usp_Address_GetAddressByTableKeyId]          
(
@TableKeyId INT = 0,           
@TableName VARCHAR(100)
)        
AS          
BEGIN    

SET NOCOUNT ON;

SELECT A.Id, A.Address1,ISNULL(A.Address2,'') AS Address2,A.Address3,ISNULL(A.PinNo,'') AS PinNo,A.Landmark,A.CountryId,A.StateId,A.CityId,A.Email,A.AlternateEmail,
A.Phone,A.AlternatePhone,A.Landlinephone,A.IsActive, A.CreatedBy,C.CountryName,S.StateName,CT.CityName,A.PhoneExt,A.AlternatePhoneExt
FROM Master_Address A INNER JOIN Master_Country C ON A.CountryId=C.Id
INNER JOIN Master_State S ON A.StateId=S.Id
INNER JOIN Master_City CT ON A.CityId=CT.Id
where TableKeyId=@TableKeyId AND TableName=@TableName AND ISNULL(A.IsDeleted, 0) = 0;

SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Amenity_GetAmenityByPropertyId]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- exec [usp_Amenity_GetAmenityByPropertyId] @PropertyId = 6
CREATE PROCEDURE [dbo].[usp_Amenity_GetAmenityByPropertyId]          
(
	@PropertyId INT = 0,
	@ShowAll BIT = 1
)        
AS          
BEGIN     
	SET NOCOUNT ON; 
	
	DECLARE @t TABLE (Id INT, AmenityId INT,  AmenityName varchar(500), 
					  Icon varchar(500), PropertyId INT,  IsActive BIT);

	INSERT INTO @t
	SELECT PA.Id, PA.AmenityId, A.AmenityName, A.Icon, PA.PropertyId, PA.IsActive
	FROM dbo.Master_Amenity A 
	JOIN  dbo.Master_Property_Amenity PA ON A.Id=PA.AmenityId 
	WHERE A.IsActive=1 AND PA.PropertyId = @PropertyId AND ISNULL(A.IsDeleted, 0) = 0
	
	IF (@ShowAll = 1)
	BEGIN 
		INSERT INTO @t
		SELECT 0 AS Id, A.Id AS AmenityId, AmenityName, A.Icon, 0 AS PropertyId, CAST(0 AS BIT) IsActive 
		FROM  dbo.Master_Amenity A 
		WHERE A.IsActive = 1 
		AND NOT EXISTS (SELECT TOP 1 1 FROM @t t WHERE t.AmenityId = A.Id) 
	END

	SELECT * FROM @t
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Approver_AllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
-- exec [usp_Approver_AllList] 17, 'Valuer'
CREATE PROCEDURE [dbo].[usp_Approver_AllList] 
(
	@UserId INT,
	@RoleName VARCHAR(50)
)        
AS          
BEGIN    
	SELECT U.Id, U.UserName, R.RoleName
	FROM Master_User U 
	INNER JOIN Master_Role R ON U.RoleId=R.Id  
	 WHERE R.RoleName=@RoleName -- AND U.Id <> @UserId;
END 

GO
/****** Object:  StoredProcedure [dbo].[usp_ApproverLevel_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
-- exec [usp_ApproverLevel_SearchAllList] @CurrentPageNumber = 0,@SortDirection='DESC'  
CREATE   PROCEDURE [dbo].[usp_ApproverLevel_SearchAllList]  
(  
 @CurrentPageNumber INT = 0,              
 @PageSize INT = 25,              
 @SortColumn VARCHAR(100) = 'Id',              
 @SortDirection VARCHAR(5) = 'ASC',              
 @SearchText VARCHAR(MAX) = NULL  
)          
AS            
BEGIN       
	 DECLARE @Letter VARCHAR(MAX) = @SearchText; --ISNULL(@SearchText, '')  
  
	 SELECT * FROM   
	 (  
		  SELECT COUNT(U.[Id]) OVER() TotalRecord, ROW_NUMBER() OVER (ORDER BY U.Id DESC) TotalFilterCount,  
					U.Id, U.Description,U.FromAmount,U.ToAmount,U.CreatedDate,U.IsActive  
		  FROM [dbo].[Master_ValuationRequestApproverLevel] U    
		  WHERE ISNULL(U.IsDeleted, 0) = 0  
				AND (@Letter IS NULL  OR (ISNULL(U.[Description], '') LIKE '%' + @Letter + '%'))   
	 ) Res  
  
	 WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize    
   
	 ORDER BY   
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN  Id  END DESC,  
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Id' THEN  Id  END ASC,  
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Description' THEN  Description  END DESC,  
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Description' THEN  Description  END ASC,  
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'FromAmount' THEN  FromAmount  END DESC,  
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'FromAmount' THEN  FromAmount  END ASC ,   
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ToAmount' THEN  ToAmount  END DESC,  
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'ToAmount' THEN  ToAmount  END ASC  ,   
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'IsActive' THEN  IsActive  END DESC,  
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'IsActive' THEN  IsActive  END ASC     
END   
  
GO
/****** Object:  StoredProcedure [dbo].[usp_AuditLog_Add]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC [dbo].[usp_AuditLog_Add]
@TableKeyId INT,
@TableName  VARCHAR(1000),
@ParentTableKeyId INT = NULL,
@ParentTableName VARCHAR(1000)  = NULL,
@ActionType VARCHAR(100),
@Log VARCHAR(MAX),
@CreatedBy INT = 1
AS 
BEGIN
	INSERT INTO Master_AuditLog (TableKeyId, TableName, ParentTableKeyId, ParentTableName, ActionType, [Log], CreatedBy, CreatedDate)
	SELECT  @TableKeyId, @TableName, @ParentTableKeyId, @ParentTableName, @ActionType, @Log, @CreatedBy, GETDATE()
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AuditLog_GetTable]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
-- exec [usp_AuditLog_GetTable]   
CREATE PROCEDURE [dbo].[usp_AuditLog_GetTable]   
AS            
BEGIN      
  
SET NOCOUNT ON;  
  
SELECT DISTINCT  TableName  
FROM Master_AuditLog where TableName is not null;  
  
SET NOCOUNT OFF;  
           
END   
  
--select DISTINCT ParentTableName from Master_AuditLog  
  
  
--select * from Master_AuditLog  
GO
/****** Object:  StoredProcedure [dbo].[usp_AuditLog_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 --exec usp_AuditLog_SearchAllList @UserId = 10,@TableName=null,@DateFrom=null,@DateTo=null
CREATE    PROCEDURE [dbo].[usp_AuditLog_SearchAllList]         
(  
	@CurrentPageNumber INT = 0,            
	@PageSize INT = 10,            
	@SortColumn VARCHAR(100) = 'Id',            
	@SortDirection VARCHAR(5) = 'DESC',            
	@SearchText VARCHAR(MAX) = NULL, 
	@UserId INT  =0,
	@TableName VARCHAR(100) = NULL,
	@DateFrom DATETIME = NULL,
	@DateTo DATETIME = NULL

)          
AS             
BEGIN       
	DECLARE @Letter VARCHAR(MAX) = @SearchText;  
	set @UserId=nullif(@UserId,0)
	SET @TableName = IIF(@TableName IN ('', 'null'), NULL, NULLIF(LTRIM(RTRIM(@TableName)), ''))
	
	
	SELECT * FROM 
	(
		SELECT COUNT(U.[Id]) OVER() TotalRecord, ROW_NUMBER() OVER (ORDER BY U.Id DESC) TotalFilterCount,
				U.Id, U.TableKeyId, U.TableName, U.ActionType, NULL [Log], U.CreatedBy, U.CreatedDate, us.UserName [CreatedByName],
				ISNULL(U.ParentTableKeyId, U.TableKeyId) ParentTableKeyId, ISNULL(U.ParentTableName, U.TableName) ParentTableName,
				us.UserName
		FROM dbo.Master_AuditLog As U    
		JOIN dbo.Master_User	 AS us on us.Id = u.CreatedBy   
		WHERE (@Letter IS NULL  OR (ISNULL(U.TableName, '') LIKE '%'+@Letter+'%' OR us.UserName LIKE '%'+@Letter+'%' OR 
									 U.ActionType LIKE '%'+@Letter+'%' 
									))
             AND (@UserId IS NULL  OR us.Id = @UserId)
			 AND (@TableName IS NULL  OR U.TableName = @TableName)
			 AND (@DateFrom  IS NULL  OR U.CreatedDate >= @DateFrom)
			 AND (@DateTo  IS NULL    OR U.CreatedDate <= @DateTo)
			
	) Res

	WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize  
	
	ORDER BY 
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN  Id  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Id' THEN  Id  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'TableName' THEN  TableName  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'TableName' THEN  TableName  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ActionType' THEN  ActionType  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'ActionType' THEN  ActionType  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'CreatedDate' THEN  CreatedDate  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'CreatedDate' THEN  CreatedDate  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'CreatedByName' THEN  CreatedByName  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'CreatedByName' THEN  CreatedByName  END ASC,
				CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'parentTableName' THEN  TableName  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'parentTableName' THEN  TableName  END ASC  
			
END   
GO
/****** Object:  StoredProcedure [dbo].[usp_AuditLog_SearchDetailsByFilter]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --exec usp_AuditLog_SearchDetailsByFilter 0,25,'oldvalue','desc',null,'mastervaluationfee',null,null,null,null
--@CurrentPageNumber=0, @PageSize=28, @TableName='MasterClient'
--exec usp_AuditLog_SearchDetailsByFilter @TableName='ValuationRequest', @DateFrom='12/8/2023'
CREATE   PROCEDURE [dbo].[usp_AuditLog_SearchDetailsByFilter]  
    @CurrentPageNumber INT = 0,            
    @PageSize INT = 50,            
    @SortColumn VARCHAR(100) = 'Id',				
    @SortDirection VARCHAR(5) = 'DESC',   

	@UserId INT  =0,
	@TableName NVARCHAR(MAX) = NULL, 
	@TableKey INT = NULL, 
	@Id INT = NULL,
	@SearchText VARCHAR(MAX) = NULL, 
    @DateFrom DATETIME = NULL,
    @DateTo DATETIME = NULL 
AS
BEGIN
DECLARE @Letter VARCHAR(MAX) = @SearchText;  
	SET @UserId = NULLIF(@UserId,0)
    SET NOCOUNT ON; 

    SELECT  al.TableName, aud.PropertyName, aud.OldValue, aud.NewValue,
			al.CreatedDate, CONVERT(NVARCHAR(MAX), al.CreatedDate, 120) CreatedDateFormatted, -- Format date and time
			ISNULL(u.FirstName + ' ' + u.LastName, '') CreatedByName -- Use ISNULL to handle null user 
	INTO #ttt
	FROM Master_AuditLog al
	Left JOIN Master_User u ON al.CreatedBy = u.Id
	OUTER APPLY OPENJSON(al.[Log]) WITH (PropertyName NVARCHAR(MAX) '$.PropertyName',
										OldValue NVARCHAR(MAX) '$.OldValue',
										NewValue NVARCHAR(MAX) '$.NewValue'
					) AS aud 
	WHERE   (@TableName IS NULL  OR al.TableName  = @TableName) 
		AND (@TableKey IS NULL   OR al.TableKeyId = @TableKey)
		AND (@Id IS NULL		 OR al.Id		  = @Id)
		AND (@UserId IS NULL	 OR u.Id		  = @UserId)
		AND (@DateFrom IS NULL   OR al.CreatedDate >= @DateFrom)
		AND (@DateTo IS NULL     OR al.CreatedDate <= @DateTo) 
		AND (@Letter IS NULL	 OR (ISNULL(al.TableName, '') LIKE '%' + @Letter + '%' OR u.UserName LIKE '%' + @Letter + '%' OR 
										    al.ActionType LIKE '%' + @Letter + '%' ))

  
	  SELECT * FROM 
	  (
		 SELECT  COUNT(t.PropertyName) OVER() TotalRecord, ROW_NUMBER() OVER (ORDER BY t.PropertyName ASC) TotalFilterCount, t.*
		 FROM #ttt t
	  ) Res 
		WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize  
		ORDER BY 
			
		CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'TableName' THEN  TableName  END DESC,
		CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'TableName' THEN  TableName  END ASC,
       CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'CreatedDate' THEN  CreatedDate  END DESC,
		CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'CreatedDate' THEN  CreatedDate  END ASC,
		CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'CreatedByName' THEN  CreatedByName  END DESC,
		CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'CreatedByName' THEN  CreatedByName  END ASC,
		CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'PropertyName' THEN  PropertyName  END DESC,
		CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'PropertyName' THEN  PropertyName  END ASC, 
		CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'OldValue' THEN  OldValue  END DESC,
		CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'OldValue' THEN  OldValue  END ASC,
		CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'NewValue' THEN  NewValue  END DESC,
		CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'NewValue' THEN  NewValue  END ASC 


	DROP TABLE #ttt;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_City_AllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [usp_City_AllList] 
CREATE PROCEDURE [dbo].[usp_City_AllList] 
AS          
BEGIN    

SET NOCOUNT ON;

SELECT Id, CityName,Stdcode,CountryId,StateId, IsActive
FROM Master_City where ISNULL(IsActive,0)=1;

SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_City_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [dbo].[usp_City_SearchAllList] @CityId = 0,@PageNumber=1,@PageSize =20,@OrderClause='Id',@ReverseSort=0,@Letter=''
CREATE PROCEDURE [dbo].[usp_City_SearchAllList]          
(
@CityId INT = 0,
@PageNumber INT = 1,            
@PageSize INT = 25,            
@OrderClause VARCHAR(100) = 'CityName',            
@ReverseSort INT = 0,            
@Letter VARCHAR(MAX) =null
)        
AS          
BEGIN    

SET NOCOUNT ON;

Set @Letter = IsNull(@Letter, '')

DECLARE @t TABLE(Id INT, CityName VARCHAR(250), Stdcode Varchar(50), CountryId INT,CountryName VARCHAR(250), StateId INT,StateName VARCHAR(250), IsActive INT, CreatedBy INT)
DECLARE @t1 TABLE(Id INT, CityName VARCHAR(250), Stdcode Varchar(50), CountryId INT,CountryName VARCHAR(250), StateId INT,StateName VARCHAR(250), IsActive INT, CreatedBy INT)

insert into @t1
SELECT C.Id, C.CityName,C.STDCode,C.CountryId,CN.CountryName,C.StateId,S.StateName, C.IsActive,C.CreatedBy
FROM [dbo].[Master_City] C inner join Master_State S ON C.StateId=S.Id
Inner join Master_Country CN ON C.CountryId=CN.Id
where C.CityName  LIKE  '%' + @Letter + '%'

insert into @t
select * from @t1
order By
CityName ASC
OFFSET @PageSize * (@PageNumber - 1) ROWS
FETCH NEXT @PageSize ROWS ONLY

SELECT COUNT(1) TotalRecords FROM @t1
SELECT * FROM @t;   
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Client_Delete]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----  exec [dbo].[usp_Client_Delete] @ClientId=2, @By=1
CREATE   PROC [dbo].[usp_Client_Delete]
@ClientId INT,
@By INT = 1
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @vrId VARCHAR(100) = NULL, @error VARCHAR(500)
    -- Insert statements for procedure here
	BEGIN TRY
		DECLARE @LOCAL BIT = 0
		IF(@@TRANCOUNT = 0)
		BEGIN
			BEGIN TRAN TRN
			SET @LOCAL = 1
		END  
		
		SELECT @vrId = vr.ReferenceNO FROM dbo.ValuationRequest vr WITH(NOLOCK) 
		WHERE vr.PropertyId = @ClientId AND ISNULL(vr.IsDeleted, 0) = 0

		IF @vrId IS NOT NULL BEGIN
			SET  @error = FORMATMESSAGE('Valuation Request(s): %s exists against this Property, please delete them first.', + @vrId)

			RAISERROR(@error, 11, 1)
		END
		ELSE BEGIN
			--- Delete Address ------
			UPDATE Master_Address SET IsDeleted=1,ModifiedBy=@By WHERE TableKeyId=@ClientId AND TableName='Master_Client';
			
			--- Delete Contact ------
			UPDATE Master_Contact SET IsDeleted=1,ModifiedBy=@By WHERE TableKeyId=@ClientId AND TableName='Master_Client';

			--- Delete Client ------			
			UPDATE Master_Client SET IsDeleted=1,ModifiedBy=@By WHERE Id=@ClientId;

		END


		IF(@@TRANCOUNT > 0 AND @LOCAL = 1)
		BEGIN
			COMMIT TRAN TRN
		END 
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0 AND @LOCAL = 1)
		BEGIN
			ROLLBACK TRAN TRN
		END

		/*
		IF (CURSOR_STATUS('global', 'PRODLIST_CURSOR') > -2)
			BEGIN
				DEALLOCATE PRODLIST_CURSOR
			END  
		IF(OBJECT_ID('tempdb..#JewerlyItems') IS NOT NULL)
			BEGIN
				DROP TABLE #JewerlyItems
			END 
		*/

		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();

		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Client_Search_GetClientList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
-- exec usp_Client_Search_GetClientList @SearchText = '', @PageSize = 10, @CurrentPageNumber = 0
CREATE PROCEDURE [dbo].[usp_Client_Search_GetClientList]          
(
	@CurrentPageNumber INT = 0,            
	@PageSize INT = 25,            
	@SortColumn VARCHAR(100) = 'ClientName',            
	@SortDirection VARCHAR(5) = 'DESC',            
	@SearchText VARCHAR(MAX) = NULL
)        
AS          
BEGIN    
 
	DECLARE @Letter VARCHAR(MAX) = @SearchText; --ISNULL(@SearchText, '')

	SELECT * FROM 
	( 
		SELECT COUNT(C.[Id]) OVER() TotalRecord,ROW_NUMBER() OVER (ORDER BY C.Id DESC) TotalFilterCount,
		C.Id , C.ClientName, CT.ClientType, C.TRNNumber, 
		C.TRNExpiryDate, C.LicenseNumber, ISNULL(C.IsActive,0) AS IsActive
		FROM [dbo].[Master_Client] C 
		LEFT JOIN Master_ClientType CT ON C.ClientTypeId=CT.Id
		WHERE   
		(@Letter IS NULL  OR (ISNULL(C.ClientName, '') LIKE '%' + @Letter + '%' OR ISNULL(CT.ClientType, '') LIKE '%' + @Letter + '%'  OR
						      ISNULL(C.TRNNumber, '') LIKE '%' + @Letter + '%'  OR ISNULL(C.LicenseNumber, '') LIKE '%' + @Letter + '%' OR
							  ISNULL(C.IsActive, 0) LIKE '%' + @Letter + '%'
							 )
		)
		AND ISNULL(C.IsDeleted, 0) = 0
	) Res  

	WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize  

	ORDER BY 
				CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN  Id  END DESC,
				CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Id' THEN  Id  END ASC,
				CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ClientName' THEN  ClientName  END DESC,
				CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'ClientName' THEN  ClientName  END ASC,
				CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ClientType' THEN  ClientType  END DESC,
				CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'ClientType' THEN  ClientType  END ASC,
				CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'TRNNumber' THEN  TRNNumber  END DESC,
				CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'TRNNumber' THEN  TRNNumber  END ASC,
				CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'TRNExpiryDate' THEN  CAST(TRNExpiryDate AS varchar)  END DESC,
				CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'TRNExpiryDate' THEN  CAST(TRNExpiryDate AS varchar)  END ASC,
				CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'LicenseNumber' THEN  LicenseNumber  END DESC,
				CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'LicenseNumber' THEN  LicenseNumber  END ASC,
				CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'IsActive' THEN  IsActive  END DESC,
				CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'IsActive' THEN  IsActive  END ASC 
 
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Client_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [dbo].[usp_Client_SearchAllList] @ClientId = 0,@PageNumber=1,@PageSize =20,@OrderClause='Id',@ReverseSort=0,@Letter=''
CREATE PROCEDURE [dbo].[usp_Client_SearchAllList]          
(
@ClientId INT = 0,
@PageNumber INT = 1,            
@PageSize INT = 25,            
@OrderClause VARCHAR(100) = 'ClientType',            
@ReverseSort INT = 0,            
@Letter VARCHAR(MAX) =null
)        
AS          
BEGIN    

SET NOCOUNT ON;

Set @Letter = IsNull(@Letter, '')

DECLARE @t TABLE(Id INT, FirstName VARCHAR(250),MiddleName VARCHAR(250),LastName VARCHAR(250), CilentTypeId INT, ClientType VARCHAR(250),
CompanyName VARCHAR(250),Address1 VARCHAR(250),Address2 VARCHAR(250),PinNo VARCHAR(250),CountryId INT, CountryName VARCHAR(250),StateId INT,
StateName VARCHAR(250),CityId INT, CityName VARCHAR(250), TRNNumber VARCHAR(250),TRNExpiryDate VARCHAR(250),LicenseNumber VARCHAR(250),
ContactPersonName VARCHAR(250),Department VARCHAR(100),Designation VARCHAR(250),Email VARCHAR(100), Mobile VARCHAR(250),IsActive INT, CreatedBy INT);

DECLARE @t1 TABLE(Id INT, FirstName VARCHAR(250),MiddleName VARCHAR(250),LastName VARCHAR(250), CilentTypeId INT, ClientType VARCHAR(250),
CompanyName VARCHAR(250),Address1 VARCHAR(250),Address2 VARCHAR(250),PinNo VARCHAR(250),CountryId INT, CountryName VARCHAR(250),StateId INT,
StateName VARCHAR(250),CityId INT, CityName VARCHAR(250), TRNNumber VARCHAR(250),TRNExpiryDate VARCHAR(250),LicenseNumber VARCHAR(250),
ContactPersonName VARCHAR(250),Department VARCHAR(100),Designation VARCHAR(250),Email VARCHAR(100), Mobile VARCHAR(250),IsActive INT, CreatedBy INT);

insert into @t1
SELECT CL.Id, CL.FirstName,CL.MiddleName,CL.LastName,CL.ClientTypeId,CT.ClientType,CL.Company,CL.Address1,CL.Address2,CL.PinNo,CL.CountryId,
C.CountryName,CL.StateId,S.StateName,CL.CityId,CY.CityName,CL.TRNNumber,CL.TRNExpiryDate,CL.LicenseNumber,
CC.ContactPersonName, CC.Department,CC.Designation,CC.Email,CC.Mobile,CL.IsActive,CL.Logo
FROM [dbo].[Master_Client] CL inner join Master_ClientType CT ON CL.ClientTypeId=CT.Id 
INNER JOIN Master_Contact CC ON CL.Id=CC.TableKeyId AND CC.TableName='Master_Client'
INNER JOIN Master_Country C ON CL.CountryId=C.Id
INNER JOIN Master_State S ON CL.StateId=S.Id
INNER JOIN Master_City CY ON CL.CityId=CY.Id
where CL.FirstName  LIKE  '%' + @Letter + '%'

insert into @t
select * from @t1
order By
FirstName ASC
OFFSET @PageSize * (@PageNumber - 1) ROWS
FETCH NEXT @PageSize ROWS ONLY

SELECT COUNT(1) TotalRecords FROM @t1
SELECT * FROM @t;   
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_ClientType_AllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [usp_ClientType_AllList] @TableKeyId = 1, @TableName = 'Master_User'
CREATE PROCEDURE [dbo].[usp_ClientType_AllList] 
AS          
BEGIN    

SET NOCOUNT ON;

SELECT Id, ClientType,IsActive
FROM Master_ClientType where ISNULL(IsActive,0)=1 AND ISNULL(IsDeleted, 0) = 0;

SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_ClientType_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [dbo].[usp_ClientType_SearchAllList] @ClientTypeId = 0,@PageNumber=1,@PageSize =20,@OrderClause='Id',@ReverseSort=0,@Letter=''
CREATE PROCEDURE [dbo].[usp_ClientType_SearchAllList]          
(
@ClientTypeId INT = 0,
@PageNumber INT = 1,            
@PageSize INT = 25,            
@OrderClause VARCHAR(100) = 'ClientType',            
@ReverseSort INT = 0,            
@Letter VARCHAR(MAX) =null
)        
AS          
BEGIN    

SET NOCOUNT ON;

Set @Letter = IsNull(@Letter, '')

DECLARE @t TABLE(Id INT, ClientType VARCHAR(250), IsActive INT, CreatedBy INT)
DECLARE @t1 TABLE(Id INT, ClientType VARCHAR(250), IsActive INT, CreatedBy INT)

insert into @t1
SELECT Id, ClientType,IsActive,CreatedBy
FROM Master_ClientType 
where ClientType  LIKE  '%' + @Letter + '%'

insert into @t
select * from @t1
order By
ClientType ASC
OFFSET @PageSize * (@PageNumber - 1) ROWS
FETCH NEXT @PageSize ROWS ONLY

SELECT COUNT(1) TotalRecords FROM @t1
SELECT * FROM @t;   
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Contact_DeleteContactByTableKeyId]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Contact_DeleteContactByTableKeyId]          
(
@TableKeyId INT = 0,
@TableName VARCHAR(50)
)        
AS          
BEGIN    

DELETE FROM Master_Contact WHERE TableKeyId=@TableKeyId AND TableName='Master_Client';

END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Contact_GetContactByTableKeyId]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [usp_Contact_GetContactByTableKeyId] @TableKeyId = 25, @TableName = 'Master_Client'
CREATE PROCEDURE [dbo].[usp_Contact_GetContactByTableKeyId]          
(
@TableKeyId INT = 0,           
@TableName VARCHAR(100)
)        
AS          
BEGIN    

SET NOCOUNT ON;

SELECT C.Id, C.ContactPersonName,C.DepartmentId,C.DesignationId,C.Email,C.Mobile,C.[Status],C.CreatedBy,
ISNULL(DS.Designation,'NA') AS Designation,ISNULL(D.Department,'NA') AS Department,C.MobileExt 
FROM Master_Contact C Left JOIN Master_Department D ON C.DepartmentId=D.Id
Left JOIN Master_Designation DS ON C.DesignationId=DS.Id
where TableKeyId=@TableKeyId AND TableName=@TableName AND ISNULL(C.IsDeleted, 0) = 0;

SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Country_AllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec [usp_Country_AllList] 
CREATE PROCEDURE [dbo].[usp_Country_AllList] 
AS          
BEGIN    

SET NOCOUNT ON;

SELECT Id, CountryName,CountryCode, ISDCountryCode, IsActive
FROM Master_Country where ISNULL(IsActive,0)=1;

SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Department_AllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [usp_Department_AllList] @TableKeyId = 1, @TableName = 'Master_User'
CREATE PROCEDURE [dbo].[usp_Department_AllList] 
AS          
BEGIN    

SET NOCOUNT ON;

SELECT Id, Department, IsActive
FROM Master_Department where ISNULL(IsActive,0)=1;

SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Department_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [dbo].[usp_Department_SearchAllList] @DepartmentId = 0,@PageNumber=1,@PageSize =20,@OrderClause='Id',@ReverseSort=0,@Letter=''
CREATE PROCEDURE [dbo].[usp_Department_SearchAllList]          
(
@DepartmentId INT = 0,
@PageNumber INT = 1,            
@PageSize INT = 25,            
@OrderClause VARCHAR(100) = 'Department',            
@ReverseSort INT = 0,            
@Letter VARCHAR(MAX) =null
)        
AS          
BEGIN    

SET NOCOUNT ON;

Set @Letter = IsNull(@Letter, '')

DECLARE @t TABLE(Id INT, Department VARCHAR(250), IsActive INT, CreatedBy INT)
DECLARE @t1 TABLE(Id INT, Department VARCHAR(250), IsActive INT, CreatedBy INT)

insert into @t1
SELECT Id, Department,IsActive,CreatedBy
FROM Master_Department 
where Department  LIKE  '%' + @Letter + '%'

insert into @t
select * from @t1
order By
Department ASC
OFFSET @PageSize * (@PageNumber - 1) ROWS
FETCH NEXT @PageSize ROWS ONLY

SELECT COUNT(1) TotalRecords FROM @t1
SELECT * FROM @t;   
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Designation_AllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [usp_Designation_AllList] 
CREATE PROCEDURE [dbo].[usp_Designation_AllList] 
AS          
BEGIN    

SET NOCOUNT ON;

SELECT Id, Designation, IsActive
FROM Master_Designation where ISNULL(IsActive,0)=1;

SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Designation_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [dbo].[usp_Designation_SearchAllList] @DesignationId = 0,@PageNumber=1,@PageSize =20,@OrderClause='Id',@ReverseSort=0,@Letter=''
CREATE PROCEDURE [dbo].[usp_Designation_SearchAllList]          
(
@DesignationId INT = 0,
@PageNumber INT = 1,            
@PageSize INT = 25,            
@OrderClause VARCHAR(100) = 'Designation',            
@ReverseSort INT = 0,            
@Letter VARCHAR(MAX) =null
)        
AS          
BEGIN    

SET NOCOUNT ON;

Set @Letter = IsNull(@Letter, '')

DECLARE @t TABLE(Id INT, Designation VARCHAR(250), IsActive INT, CreatedBy INT)
DECLARE @t1 TABLE(Id INT, Designation VARCHAR(250), IsActive INT, CreatedBy INT)

insert into @t1
SELECT Id, Designation,IsActive,CreatedBy
FROM Master_Designation 
where Designation  LIKE  '%' + @Letter + '%'

insert into @t
select * from @t1
order By
Designation ASC
OFFSET @PageSize * (@PageNumber - 1) ROWS
FETCH NEXT @PageSize ROWS ONLY

SELECT COUNT(1) TotalRecords FROM @t1
SELECT * FROM @t;   
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Dictionary_GetById]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE   PROCEDURE [dbo].[usp_Dictionary_GetById]   
(  
 @Id INT = NULL,
 @Description VARCHAR(100) = NULL 
)          
AS             
BEGIN 
    SELECT  MD.Id,
			MD.[Description], 
			MD.IsActive		  AS IsActive,
			MDD.Id [ChildId],
			MDD.[Description] [ChildDescription]
    FROM Master_Dictionary MD
	LEFT JOIN dbo.Master_DictionaryDetail MDD ON MD.Id = MDD.DictionaryId
	WHERE (@Id IS NULL			OR MD.Id = @Id) AND 
		  (@Description IS NULL OR MD.[Description] = @Description)   
END

exec usp_Dictionary_GetById 3 ,'ValuationType'


select * from Master_Dictionary
select * from Master_DictionaryDetail
GO
/****** Object:  StoredProcedure [dbo].[usp_Dictionary_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[usp_Dictionary_SearchAllList]
(  
	@CurrentPageNumber INT = 0,            
	@PageSize INT = 25,            
	@SortColumn VARCHAR(100) = 'Id',            
	@SortDirection VARCHAR(5) = 'ASC',            
	@SearchText VARCHAR(MAX) = NULL
)          
AS             
BEGIN 
	DECLARE @Letter VARCHAR(MAX) = @SearchText; --ISNULL(@SearchText, '')

	SELECT * FROM 
	(
		SELECT COUNT(U.[Id]) OVER() TotalRecord, ROW_NUMBER() OVER (ORDER BY U.Id DESC) TotalFilterCount,
				U.Id, U.[Description], U.IsActive AS IsActive, s.[Values]
		FROM [dbo].[Master_Dictionary] U  
		OUTER APPLY (SELECT  STUFF((SELECT ',' + MDD.[Description]
					 FROM dbo.Master_DictionaryDetail MDD WHERE U.Id = MDD.DictionaryId AND ISNULL(MDD.IsActive,0)=1
					 FOR XML PATH('')
					  ), 1, 1, '') [Values]
					) s 
		WHERE 1 = 1
			  AND (@Letter IS NULL  OR (ISNULL(U.[Description], '') LIKE '%'+@Letter+'%' OR ISNULL(s.[Values], '') LIKE '%'+@Letter+'%'))
			  AND ISNULL(U.IsDeleted, 0) = 0
	) Res

	WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize  
	
	ORDER BY 
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN  Id  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Id' THEN  Id  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Description' THEN  [Description]  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Description' THEN  [Description]  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'IsActive' THEN  IsActive  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'IsActive' THEN  IsActive  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Values' THEN  [Values]  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Values' THEN  [Values]  END ASC  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Document_GetDocumentByTableKeyId]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [usp_Document_GetDocumentByTableKeyId] @TableKeyId = 46, @TableName = 'ValuationQuotation'
CREATE PROCEDURE [dbo].[usp_Document_GetDocumentByTableKeyId]          
(
@TableKeyId INT = 0,           
@TableName VARCHAR(100)
)        
AS          
BEGIN    

SET NOCOUNT ON;

SELECT D.Id,D.DocumentName, D.[FileName], D.FileType,D.FilePath,D.IsActive, D.CreatedBy,
U.UserName AS CreatedName,D.CreatedDate
FROM Master_Document D LEFT JOIN Master_User U ON D.CreatedBy=U.Id
where D.TableKeyId=@TableKeyId AND D.TableName=@TableName AND ISNULL(D.IsActive,0)=1;

SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_GetPageFooterDetails]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
     
    
/* Modification History :          
==========================================================          
When?           Who?             What?          
10/28/2023    YallaReddy CH     Fixes for Page Footter details    
==========================================================    
 EXEC [usp_GetPageFooterDetails] @TableName = 'Master_User', @TableKeyId=1   */     
CREATE     PROC [dbo].[usp_GetPageFooterDetails]    
@TableName VARCHAR(30) ,    
@TableKeyId INT     
AS     
BEGIN    
        
    DECLARE @Rpt TABLE(CreatedBy INT,   CreatedDate DATETIME,  ModifiedBy INT, ModifiedDate DATETIME);     
       
   ---=========== Pull history details ===============    
   INSERT INTO @Rpt    
   SELECT a.CreatedBy, a.CreatedDate, a.ModifiedBy, a.ModifiedDate    
   FROM dbo.Master_Client a        
   WHERE (@TableName = 'Master_Client' AND @TableKeyId = a.Id)    
    
   UNION     
   SELECT a.CreatedBy, a.CreatedDate, a.ModifiedBy, a.ModifiedDate    
   FROM dbo.Master_ClientType a        
   WHERE (@TableName = 'Master_ClientType' AND @TableKeyId = a.Id)    
    
   UNION    
   SELECT a.CreatedBy, a.CreatedDate, a.ModifiedBy, a.ModifiedDate    
   FROM dbo.Master_Dictionary a        
   WHERE (@TableName = 'Master_Dictionary' AND @TableKeyId = a.Id)    
    
   UNION    
   SELECT a.CreatedBy, a.CreatedDate, a.ModifiedBy, a.ModifiedDate    
   FROM dbo.Master_Location a        
   WHERE (@TableName = 'Master_Location' AND @TableKeyId = a.Id)    
    
   UNION    
   SELECT a.CreatedBy, a.CreatedDate, a.ModifiedBy, a.ModifiedDate    
   FROM dbo.Master_Property a        
   WHERE (@TableName = 'Master_Property' AND @TableKeyId = a.Id)    
    
   UNION    
   SELECT a.CreatedBy, a.CreatedDate, a.ModifiedBy, a.ModifiedDate    
   FROM dbo.Master_PropertyType a        
   WHERE (@TableName = 'Master_PropertyType' AND @TableKeyId = a.Id)    
    
   UNION    
   SELECT a.CreatedBy, a.CreatedDate, a.ModifiedBy, a.ModifiedDate    
   FROM dbo.Master_Role a        
   WHERE (@TableName = 'Master_Role' AND @TableKeyId = a.Id)    
    
   UNION    
   SELECT a.CreatedBy, a.CreatedDate, a.ModifiedBy, a.ModifiedDate    
   FROM dbo.Master_User a        
   WHERE (@TableName = 'Master_User' AND @TableKeyId = a.Id)    
    
   UNION    
   SELECT a.CreatedBy, a.CreatedDate, a.ModifiedBy, a.ModifiedDate    
   FROM dbo.Master_ValuationFees a        
   WHERE (@TableName = 'Master_ValuationFee' AND @TableKeyId = a.Id)    
    
   UNION    
   SELECT a.CreatedBy, a.CreatedDate, a.ModifiedBy, a.ModifiedDate    
   FROM dbo.Master_ValuationFeeType a        
   WHERE (@TableName = 'Master_ValuationFeeType' AND @TableKeyId = a.Id)    
    
   UNION    
   SELECT a.CreatedBy, a.CreatedDate, a.ModifiedBy, a.ModifiedDate    
   FROM dbo.Master_Vendor a        
   WHERE (@TableName = 'Master_Vendor' AND @TableKeyId = a.Id)    
    
   UNION    
   SELECT a.CreatedBy, a.CreatedDate, a.ModifiedBy, a.ModifiedDate    
   FROM dbo.ValuationRequest a        
   WHERE (@TableName = 'ValuationRequest' AND @TableKeyId = a.Id)  
   
  
    
    
   --================ Section 3 : Return Final output ================       
   SELECT au.CreatedBy  CreatedBy, au.UserName CreatedByName,   t.CreatedDate,      
    au1.CreatedBy ModifiedBy,  au1.UserName ModifiedByName,  t.ModifiedDate,    
    @TableKeyId TableKey, @TableName TableName    
   FROM @Rpt t     
    LEFT JOIN [dbo].[Master_User] au  WITH(NOLOCK) ON au.Id = t.CreatedBy    
    LEFT JOIN [dbo].[Master_User] au1 WITH(NOLOCK) ON au1.Id = t.ModifiedBy    
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertException]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
 -- exec stp_npd_InsertException @Message='TEST',@Source ='TEST',@InnerException ='TEST',@StackTrace='TEST',@CreatedBy=1   
CREATE PROCEDURE [dbo].[usp_InsertException]                
(    
	@Message nvarchar(500),    
	@Source nvarchar(500), 
	@InnerException nvarchar(4000), 
	@StackTrace nvarchar(4000), 
	@CreatedBy nvarchar(4000),
	@Success bit = 1 OUTPUT
)              
AS                
BEGIN  
	INSERT INTO Master_Exception ([Message],[Source],[InnerException],[StrackTrace],[CreatedDate],[CreatedBy])
	VALUES (@Message, @Source, @InnerException, @StackTrace, GETDATE(), @CreatedBy);
	
	SET @Success = 1; 
	SELECT @Success;
END 

GO
/****** Object:  StoredProcedure [dbo].[usp_Invoice_GetInvoiceByRequestId]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

-- exec [usp_Invoice_GetInvoiceByRequestId] @RequestId = 66
CREATE PROCEDURE [dbo].[usp_Invoice_GetInvoiceByRequestId]          
(
@RequestId INT 
)        
AS          
BEGIN    

SET NOCOUNT ON;

SELECT V.Id AS Id,V.ReferenceNO,ValuationRequestId,TransactionModeId,TransactionStatusId,Amount,CheckNumer,CheckBankName,CheckDate,
		CardNumber,CardBankName,CardHolderName,[ExpireDate],AccountBankName,AccountHolderName,Note,V.CreatedBy,V.CreatedDate,Balance,TransactionDate,U.UserName,VR.StatusName AS RequestStatus,
		CASE WHEN TransactionModeId =1 THEN 'CASH' WHEN TransactionModeId =2 THEN 'CHEQUE' WHEN TransactionModeId =3 THEN 'CREDIT' WHEN TransactionModeId =4 THEN 'NETBANKING' END AS TransactionMode,
		MD.[Status] AS TransactionStatusName 
FROM dbo.ValuationInVoice V
	inner join dbo.Master_ValuationStatus MD on V.TransactionStatusId=MD.Id
	inner join dbo.vw_ValuationRequest VR on V.ValuationRequestId=VR.Id 
	inner join dbo.Master_User U on V.CreatedBy=U.Id
WHERE ValuationRequestId=@RequestId AND ISNULL(V.IsDeleted, 0) = 0 
order by V.id desc
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Location_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[usp_Location_SearchAllList]            
(  
    @CurrentPageNumber INT = 0,            
    @PageSize INT = 25,            
    @SortColumn VARCHAR(100) = 'Id',            
    @SortDirection VARCHAR(5) = 'DESC', -- Default sorting in descending order
    @SearchText VARCHAR(MAX) = NULL
)          
AS             
BEGIN       
    DECLARE @Letter VARCHAR(MAX) = @SearchText;

    SELECT * FROM 
    (
        SELECT 
            COUNT(U.[Id]) OVER() TotalRecord, 
            ROW_NUMBER() OVER (ORDER BY U.Id DESC) TotalFilterCount, -- Sort by Id in descending order
            U.Id, 
            U.IsActive, 
            U.LocationName, 
            CT.CountryName,  
            ST.StateName StatesEmirates, 
            CY.CityName RegionName, 
            U.Sector, 
            U.Latitude, 
            U.Longitude, 
            HD.[Description] HomeCurrency, 
            FD.[Description] ForeignCurrency
        FROM dbo.Master_Location U   
        JOIN dbo.Master_Country CT  ON U.CountryId=CT.Id  
        JOIN dbo.Master_State ST    ON U.StateId=ST.Id  
        JOIN dbo.Master_City CY     ON U.CityId=CY.Id  
        LEFT JOIN dbo.Master_DictionaryDetail HD  ON HD.Id = U.HomeCurrencyId
        LEFT JOIN dbo.Master_DictionaryDetail FD  ON FD.Id = U.ForeignCurrencyId   
        LEFT JOIN dbo.Master_Dictionary HC		   ON HD.DictionaryId   = HC.Id AND  HC.DictionaryCode = 'CURRENCY' 
        LEFT JOIN dbo.Master_Dictionary FC		   ON FD.DictionaryId	= FC.Id  AND FC.DictionaryCode = 'CURRENCY'   
        WHERE (@Letter IS NULL  OR (ISNULL(U.LocationName, '') LIKE '%'+@Letter+'%' OR CT.CountryName LIKE '%'+@Letter+'%' OR 
                                     ST.StateName LIKE '%'+@Letter+'%' OR CY.CityName LIKE '%'+@Letter+'%' OR
                                     U.Sector LIKE '%'+@Letter+'%'	   OR FD.[Description] LIKE '%'+@Letter+'%' OR
                                     HD.[Description] LIKE '%'+@Letter+'%'
									) 
               )
			AND ISNULL(U.IsDeleted, 0) = 0
    ) Res

    WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize  
    
    ORDER BY 
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN  Id  END DESC,
        CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Id' THEN  Id  END ASC,
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'CountryName' THEN  CountryName  END DESC,
        CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'CountryName' THEN  CountryName  END ASC,
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'RegionName' THEN  RegionName  END DESC,
        CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'RegionName' THEN  RegionName  END ASC,
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Sector' THEN  Sector  END DESC,
        CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Sector' THEN  Sector  END ASC,
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'HomeCurrency' THEN  HomeCurrency  END DESC,
        CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'HomeCurrency' THEN  HomeCurrency  END ASC,
		  CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'StatesEmirates' THEN   StatesEmirates  END DESC,
        CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = ' StatesEmirates' THEN   StatesEmirates  END ASC,
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ForeignCurrency' THEN  ForeignCurrency  END DESC,
        CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'ForeignCurrency' THEN  ForeignCurrency  END ASC  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Master_Valuation_InvoiceStatus_List]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
-- exec [usp_Master_Valuation_InvoiceStatus_List] @TypeId = 3
CREATE PROCEDURE [dbo].[usp_Master_Valuation_InvoiceStatus_List]          
(
	@Type INT 
)        
AS          
BEGIN    

SET NOCOUNT ON;

	SELECT Id, vs.[Status]   [StatusName]    FROM Master_ValuationStatus vs      WHERE ISNULL(IsActive, 0) = 1      AND [Type] = @Type;  

SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Master_ValuationStatus_List]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- exec usp_Master_ValuationStatus_List @RoleId=1, @ValReqId = 84  
CREATE PROCEDURE [dbo].[usp_Master_ValuationStatus_List]
  @RoleId   INT = NULL,
  @Action   VARCHAR(10) = NULL,
  @ValReqId INT = NULL
AS
  BEGIN
	DECLARE @tsts TABLE([StatusName] varchar(200), [StatusCode] varchar(200), [Id] INT);

	INSERT INTO @tsts
	SELECT vs.[Status] [StatusName], vs.[StatusCode], vs.Id
	FROM  dbo.Master_valuationstatus vs 
	JOIN  dbo.ValuationRequest vr ON vr.StatusId = vs.Id 
	WHERE vr.Id = @ValReqId

    IF @RoleId IN (2, 3)
	BEGIN
		INSERT INTO @tsts
		SELECT vs.[Status] [StatusName], vs.[StatusCode], vs.Id
		FROM  dbo.Master_valuationstatus vs
		WHERE ISNULL(vs.IsActive, 0) = 1 AND vs.[Type] = 1  AND vs.[Group] = @RoleId
		ORDER BY vs.[Status]
	END

    ELSE IF (@Action IS NULL AND @ValReqId IS NULL)	BEGIN		 INSERT INTO @tsts		 SELECT vs.[Status] [StatusName], vs.[StatusCode], vs.Id         FROM dbo.Master_ValuationStatus vs		 WHERE  ISNULL(vs.IsActive, 0) = 1 AND vs.[Type] = 1 -- AND vs.[Group] = 1		 ORDER BY vs.[Status]	END	ELSE BEGIN           IF ISNULL(@ValReqId, 0) = 0 BEGIN  			INSERT INTO @tsts            SELECT vs.[Status] [StatusName], vs.[StatusCode], vs.Id            FROM dbo.Master_ValuationStatus vs WITH(NOLOCK)              WHERE ISNULL(vs.IsActive, 0) = 1 AND vs.[Type] = 1 AND vs.[Status] = 'New'         END           ELSE BEGIN 			INSERT INTO @tsts			SELECT vs.[Status] [StatusName], vs.[StatusCode], vs.Id			FROM dbo.Master_ValuationStatus vs 			OUTER APPLY (SELECT TOP 1 * FROM dbo.ValuationRequest vr WHERE vr.Id = @ValReqId) vr			WHERE  ISNULL(vs.IsActive, 0) = 1 				   AND vs.[Type] = 1 -- AND vs.[Group] = 1 			      -- AND (vr.Id IS NULL OR vs.Id >= vr.StatusId)			ORDER BY vs.[Status]        END      END	SELECT DISTINCT t.* FROM @tsts t	ORDER BY t.[StatusName]END
GO
/****** Object:  StoredProcedure [dbo].[usp_MasterDictionary_UpsertDictionaryDetails]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
-- exec [usp_PropertyType_UpsertSubTypes]  @Id = 1, @CreatedBy = 1, @RequestData = '33_Govt22'
CREATE   PROCEDURE [dbo].[usp_MasterDictionary_UpsertDictionaryDetails] 
(
	@Id INT,            
	@CreatedBy INT = 1,            
	@RequestData VARCHAR(MAX) = NULL
)        
AS          
BEGIN     
	DECLARE @Val TABLE([Id] INT, [SubTypeName] VARCHAR(5000));
	DECLARE @dt DATETIME = GETDATE();

	INSERT INTO @Val
	SELECT ptv.[Id] [Id], ptv.[Value] [SubTypeName] 
	FROM dbo.ufn_Split_Multi(@RequestData,',','_') ptv
	
	--- Delete unwanted ones ------
	UPDATE p SET p.IsActive = 0, p.ModifiedBy = @CreatedBy, p.ModifiedDate = @dt
	FROM dbo.Master_DictionaryDetail p 
	WHERE NOT EXISTS (SELECT TOP 1 1 FROM @Val v WHERE v.Id = p.Id)
		  AND p.DictionaryId = @Id 
		  AND p.IsActive = 1

	--- Insert into new values -----
	INSERT INTO dbo.Master_DictionaryDetail (DictionaryId, [Description], IsActive, CreatedBy, CreatedDate)
	SELECT @Id, v.SubTypeName, 1, @CreatedBy, @dt
	FROM @Val v WHERE ISNULL(v.Id, 0) = 0 

	--- Update existing ones ------
	UPDATE p SET p.[Description] = v.SubTypeName, p.IsActive = 1, p.ModifiedBy = @CreatedBy, p.ModifiedDate = @dt
	FROM dbo.Master_DictionaryDetail p 
	JOIN @Val v ON v.Id = p.Id
	WHERE p.DictionaryId = @Id  
END 

GO
/****** Object:  StoredProcedure [dbo].[usp_MasterNotification_AllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- exec [usp_MasterNotification_AllList] @LogInUserId = 1, @IsCount =0, @PageNum = 2, @PageSize=25
CREATE   PROCEDURE [dbo].[usp_MasterNotification_AllList]  
@LogInUserId INT,
@ValReqId INT = 0,
@IsCount BIT = 0,
@PageNum INT = 1,
@PageSize INT = 25
AS          
BEGIN    
	DECLARE @app INT, @val INT;
	SELECT @app = u.IsApprover, @val = u.IsValuer
	FROM dbo.vw_User u 
	WHERE u.Id = @LogInUserId 

	 IF @IsCount = 1 BEGIN
		 SELECT  COUNT(1) TotalRecords
		 FROM dbo.Master_Notification n
		 JOIN dbo.ValuationRequest v ON v.Id = n.ValuationRequestId
		 WHERE	   (@LogInUserId IS NULL	OR n.CreatedBy = @LogInUserId)
			   AND (@ValReqId = 0			OR n.ValuationRequestId = @ValReqId)
			   AND (@app IS NULL			OR v.ApproverId = @LogInUserId)
			   AND (@val IS NULL			OR v.ValuerId = @LogInUserId)
			   AND n.ReadDate IS NULL 
	 END
	 ELSE BEGIN
		SET @PageNum = @PageSize * @PageNum;

		SELECT * FROM 
		(
			 SELECT  n.*, v.ReferenceNo ValRefNo, v.ApproverId, v.ValuerId,
					 COUNT(n.[Id]) OVER() TotalRecord, ROW_NUMBER() OVER (ORDER BY n.Id DESC) TotalFilterCount
			 FROM dbo.Master_Notification n
			 JOIN dbo.ValuationRequest v ON v.Id = n.ValuationRequestId
			 WHERE	   (@LogInUserId IS NULL	OR n.CreatedBy = @LogInUserId)
				   AND (@ValReqId = 0			OR n.ValuationRequestId = @ValReqId)
				   AND (@app IS NULL			OR v.ApproverId = @LogInUserId)
				   AND (@val IS NULL			OR v.ValuerId = @LogInUserId)  
		) Res 
		WHERE TotalFilterCount BETWEEN (@PageNum)  AND (@PageNum) + @PageSize 
		ORDER BY Res.CreatedDate DESC  
	 END
END 

GO
/****** Object:  StoredProcedure [dbo].[usp_OwnershipType_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [dbo].[usp_usp_OwnershipType_SearchAllList_SearchAllList] @OwnershipTypeId = 0,@PageNumber=1,@PageSize =20,@OrderClause='Id',@ReverseSort=0,@Letter=''
CREATE PROCEDURE [dbo].[usp_OwnershipType_SearchAllList]          
(
@OwnershipTypeId INT = 0,
@PageNumber INT = 1,            
@PageSize INT = 25,            
@OrderClause VARCHAR(100) = 'OwnershipType',            
@ReverseSort INT = 0,            
@Letter VARCHAR(MAX) =null
)        
AS          
BEGIN    

SET NOCOUNT ON;

Set @Letter = IsNull(@Letter, '')

DECLARE @t TABLE(Id INT, OwnershipType VARCHAR(250), IsActive INT, CreatedBy INT)
DECLARE @t1 TABLE(Id INT, OwnershipType VARCHAR(250), IsActive INT, CreatedBy INT)

insert into @t1
SELECT Id, OwnershipType,IsActive,CreatedBy
FROM Master_OwnershipType 
where OwnershipType  LIKE  '%' + @Letter + '%'

insert into @t
select * from @t1
order By
OwnershipType ASC
OFFSET @PageSize * (@PageNumber - 1) ROWS
FETCH NEXT @PageSize ROWS ONLY

SELECT COUNT(1) TotalRecords FROM @t1
SELECT * FROM @t;   
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Property_Delete]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----  exec [dbo].[usp_Property_Delete] @PropertyId=19, @By=1
CREATE   PROC [dbo].[usp_Property_Delete]  
@PropertyId INT,
@By INT = 1
AS
BEGIN 
	SET NOCOUNT ON;
	DECLARE @vrId VARCHAR(100) = NULL, @error VARCHAR(500)
    -- Insert statements for procedure here
	BEGIN TRY
		DECLARE @LOCAL BIT = 0
		IF(@@TRANCOUNT = 0)
		BEGIN
			BEGIN TRAN TRN
			SET @LOCAL = 1
		END  
		
		SELECT @vrId = vr.ReferenceNO FROM dbo.ValuationRequest vr WITH(NOLOCK) 
		WHERE vr.PropertyId = @PropertyId AND ISNULL(vr.IsDeleted, 0) = 0

		IF @vrId IS NOT NULL BEGIN
			SET  @error = FORMATMESSAGE('Valuation Request(s): %s exists against this Property, please delete them first.', + @vrId)

			RAISERROR(@error, 11, 1)
		END
		ELSE BEGIN
		-- update 
			--- Delete Property Location ------
			UPDATE Master_Property_Location SET IsDeleted=1, ModifiedBy=@By WHERE PropertyId= @PropertyId;

			--- Delete Property Amenity------
			UPDATE Master_Property_Amenity set IsDeleted=1, ModifiedBy=@By WHERE PropertyId= @PropertyId;
			
			--- Delete Property ------
			UPDATE Master_Property set IsDeleted=1, ModifiedBy=@By WHERE Id= @PropertyId;

		END


		IF(@@TRANCOUNT > 0 AND @LOCAL = 1)
		BEGIN
			COMMIT TRAN TRN
		END 
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0 AND @LOCAL = 1)
		BEGIN
			ROLLBACK TRAN TRN
		END

		/*
		IF (CURSOR_STATUS('global', 'PRODLIST_CURSOR') > -2)
			BEGIN
				DEALLOCATE PRODLIST_CURSOR
			END  
		IF(OBJECT_ID('tempdb..#JewerlyItems') IS NOT NULL)
			BEGIN
				DROP TABLE #JewerlyItems
			END 
		*/

		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();

		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Property_Search_GetPropertyList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec usp_Property_Search_GetPropertyList @SearchText = 'Ind', @PageSize = 10, @CurrentPageNumber = 0
CREATE PROCEDURE [dbo].[usp_Property_Search_GetPropertyList]          
(
@CurrentPageNumber INT = 0,            
@PageSize INT = 25,            
@SortColumn VARCHAR(100) = 'Id',            
@SortDirection VARCHAR(5) = 'DESC',            
@SearchText VARCHAR(MAX) =''
)        
AS          
BEGIN    

SET NOCOUNT ON;
DECLARE @Letter VARCHAR(MAX) = @SearchText; --ISNULL(@SearchText, '')

SELECT * FROM 
( 
SELECT COUNT(P.[Id]) OVER() TotalRecord,ROW_NUMBER() OVER (ORDER BY P.Id ASC) TotalFilterCount,
P.Id , P.PropertyName, PT.PropertyType, PS.PropertySubType, OT.OwnershipType, 
C.CountryName+','+S.StateName+','+CT.CityName AS [Location], ISNULL(P.IsActive,0) AS IsActive
FROM [dbo].[Master_Property] P 
LEFT JOIN [dbo].[Master_Property_Location] PD ON P.Id=PD.PropertyId
LEFT JOIN Master_PropertyType PT ON P.PropertyTypeId=PT.Id
LEFT JOIN Master_PropertySubType PS ON P.PropertySubTypeId=PS.Id
LEFT JOIN Master_OwnershipType OT ON P.OwnershipTypeId=OT.Id
LEFT JOIN Master_Country C ON PD.CountryId=C.Id
LEFT JOIN MASTER_State S ON PD.StateId=S.Id
LEFT JOIN MASTER_City CT ON PD.CityId = CT.Id

 WHERE   
 (@Letter IS NULL  OR (ISNULL(P.PropertyName, '') LIKE '%' + @Letter + '%'			 OR ISNULL(PT.PropertyType, '') LIKE '%' + @Letter + '%' 
								OR ISNULL(PS.PropertySubType, '') LIKE '%' + @Letter + '%'	 OR ISNULL(OT.OwnershipType, '') LIKE '%' + @Letter + '%' 
								OR ISNULL(C.CountryName, '') LIKE '%' + @Letter + '%' 	 OR ISNULL(S.StateName, '') LIKE '%' + @Letter + '%' 
								OR ISNULL(CT.CityName, '') LIKE '%' + @Letter + '%'	 OR ISNULL(C.IsActive, 0) LIKE '%' + @Letter + '%'
							 )
				)
				AND ISNULL(P.IsDeleted, 0) = 0
) Res  

WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize  

ORDER BY 
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN  Id  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Id' THEN  Id  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'PropertyName' THEN  PropertyName  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'PropertyName' THEN  PropertyName  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'PropertyType' THEN  PropertyType  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'PropertyType' THEN  PropertyType  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'PropertySubType' THEN  PropertySubType  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'PropertySubType' THEN  PropertySubType  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'OwnershipType' THEN  OwnershipType  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'OwnershipType' THEN  OwnershipType  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Location' THEN  [Location]  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Location' THEN  [Location]  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'IsActive' THEN  IsActive  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'IsActive' THEN  IsActive  END ASC 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_PropertyLocation_GetLocationByPropertyId]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [usp_PropertyLocation_GetLocationByPropertyId] @PropertyId = 1
CREATE PROCEDURE [dbo].[usp_PropertyLocation_GetLocationByPropertyId]          
(
@PropertyId INT = 0
)        
AS          
BEGIN    

SET NOCOUNT ON;

SELECT Id,PropertyId,CountryId,StateId,CityId,[Zone],BuildingProject,
Latitude,Longitude,Address1,Address2,Pincode,Landmark
FROM Master_Property_Location WHERE PropertyId=@PropertyId

SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_PropertySubType_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [dbo].[usp_PropertySubType_SearchAllList] @PropertySubTypeId = 0,@PageNumber=1,@PageSize =20,@OrderClause='Id',@ReverseSort=0,@Letter=''
CREATE PROCEDURE [dbo].[usp_PropertySubType_SearchAllList]          
(
@PropertySubTypeId INT = 0,
@PageNumber INT = 1,            
@PageSize INT = 25,            
@OrderClause VARCHAR(100) = 'PropertySubType',            
@ReverseSort INT = 0,            
@Letter VARCHAR(MAX) =null
)        
AS          
BEGIN    

SET NOCOUNT ON;

Set @Letter = IsNull(@Letter, '')

DECLARE @t TABLE(Id INT, PropertySubType VARCHAR(250), IsActive INT, CreatedDate DATETIME,CreatedBy INT,ModifiedDate DATETIME,ModifiedBy INT)
DECLARE @t1 TABLE(Id INT, PropertySubType VARCHAR(250), IsActive INT, CreatedDate DATETIME,CreatedBy INT,ModifiedDate DATETIME,ModifiedBy INT)

insert into @t1
SELECT Id, PropertySubType,IsActive,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy
FROM Master_PropertySubType 
where PropertySubType  LIKE  '%' + @Letter + '%'

insert into @t
select * from @t1
order By
PropertySubType ASC
OFFSET @PageSize * (@PageNumber - 1) ROWS
FETCH NEXT @PageSize ROWS ONLY

SELECT COUNT(1) TotalRecords FROM @t1
SELECT * FROM @t;   
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_PropertyType_GetAll]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

-- exec [usp_PropertyType_GetAll]  
CREATE PROCEDURE [dbo].[usp_PropertyType_GetAll] 
(
	@CurrentPageNumber INT = 0,            
	@PageSize INT = 25,            
	@SortColumn VARCHAR(100) = 'Id',            
	@SortDirection VARCHAR(5) = 'ASC',            
	@SearchText VARCHAR(MAX) = NULL
)        
AS          
BEGIN     
	DECLARE @Letter VARCHAR(MAX) = @SearchText; --ISNULL(@SearchText, '')

	SELECT * FROM 
	(
		SELECT COUNT(U.[Id]) OVER() TotalRecord, ROW_NUMBER() OVER (ORDER BY U.Id ASC) TotalFilterCount,
				U.Id, U.PropertyType, U.IsActive, s.SubTypes
		FROM [dbo].[Master_PropertyType] U  
		OUTER APPLY (SELECT STUFF((SELECT ',' + PropertySubType  
				   FROM Master_PropertySubType b       
				   WHERE b.PropertyTypeId = U.Id  AND b.IsActive = 1    
				   FOR XML PATH('')), 1, 1, ''
				  ) as SubTypes
				 ) s
		WHERE ISNULL(U.IsActive, 0) = 1  
			  AND (@Letter IS NULL  OR (U.PropertyType LIKE '%'+@Letter+'%' OR s.SubTypes LIKE '%'+@Letter+'%'))
			  AND ISNULL(U.IsDeleted, 0) = 0
	) Res

	
	
	ORDER BY 
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN  Id  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Id' THEN  Id  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'PropertyType' THEN  PropertyType  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'PropertyType' THEN  PropertyType  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'SubTypes' THEN  SubTypes  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'SubTypes' THEN  SubTypes  END ASC,   
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'IsActive' THEN  IsActive  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'IsActive' THEN  IsActive  END ASC   
END 

GO
/****** Object:  StoredProcedure [dbo].[usp_PropertyType_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   
  
-- exec [usp_PropertyType_SearchAllList]    
CREATE   PROCEDURE [dbo].[usp_PropertyType_SearchAllList]   
(  
 @CurrentPageNumber INT = 0,              
 @PageSize INT = 25,              
 @SortColumn VARCHAR(100) = 'Id',              
 @SortDirection VARCHAR(5) = 'ASC',              
 @SearchText VARCHAR(MAX) = NULL  
)          
AS            
BEGIN       
 DECLARE @Letter VARCHAR(MAX) = @SearchText; --ISNULL(@SearchText, '')  
  
 SELECT * FROM   
 (  
  SELECT COUNT(U.[Id]) OVER() TotalRecord, ROW_NUMBER() OVER (ORDER BY U.Id DESC) TotalFilterCount,  
    U.Id, U.PropertyType, U.IsActive, s.SubTypes  
  FROM [dbo].[Master_PropertyType] U -- order by CreatedDate desc
  OUTER APPLY (SELECT STUFF((SELECT ',' + PropertySubType    
       FROM Master_PropertySubType b         
       WHERE b.PropertyTypeId = U.Id  AND b.IsActive = 1      
       FOR XML PATH('')), 1, 1, ''  
      ) as SubTypes 
	  
	) s  
  WHERE 1 = 1 -- ISNULL(U.IsActive, 0) = 1    
     AND (@Letter IS NULL  OR (U.PropertyType LIKE '%'+@Letter+'%' OR s.SubTypes LIKE '%'+@Letter+'%'))  
     AND ISNULL(U.IsDeleted, 0) = 0  
	 
 ) Res  
  
 WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize   
 ORDER BY   
   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN  Id  END DESC,  
   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Id' THEN  Id  END ASC,  
   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'PropertyType' THEN  PropertyType  END DESC,  
   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'PropertyType' THEN  PropertyType  END ASC,  
   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'SubTypes' THEN  SubTypes  END DESC,  
   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'SubTypes' THEN  SubTypes  END ASC,     
   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'IsActive' THEN  IsActive  END DESC,  
   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'IsActive' THEN  IsActive  END ASC 
END   
  
GO
/****** Object:  StoredProcedure [dbo].[usp_PropertyType_UpsertSubTypes]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- exec [usp_PropertyType_UpsertSubTypes]  @Id = 1, @CreatedBy = 1, @RequestData = '33_Govt22'
CREATE   PROCEDURE [dbo].[usp_PropertyType_UpsertSubTypes] 
(
	@Id INT,            
	@CreatedBy INT = 1,            
	@RequestData VARCHAR(MAX) = NULL
)        
AS          
BEGIN     
	DECLARE @Val TABLE([Id] INT, [SubTypeName] VARCHAR(5000));
	DECLARE @dt DATETIME = GETDATE();

	INSERT INTO @Val
	SELECT ptv.[Id] [Id], ptv.[Value] [SubTypeName] 
	FROM dbo.ufn_Split_Multi(@RequestData,',','_') ptv
	
	--- Delete unwanted ones ------
	UPDATE p SET p.IsActive = 0, p.ModifiedBy = @CreatedBy, p.ModifiedDate = @dt
	FROM dbo.Master_PropertySubType p 
	WHERE NOT EXISTS (SELECT TOP 1 1 FROM @Val v WHERE v.Id = p.Id)
		  AND p.PropertyTypeId = @Id 
		  AND p.IsActive = 1

	--- Insert into new values -----
	INSERT INTO dbo.Master_PropertySubType (PropertyTypeId, PropertySubType, IsActive, CreatedBy, CreatedDate)
	SELECT @Id, v.SubTypeName, 1, @CreatedBy, @dt
	FROM @Val v WHERE ISNULL(v.Id, 0) = 0 

	--- Update existing ones ------
	UPDATE p SET p.PropertySubType = v.SubTypeName, p.IsActive = 1, p.ModifiedBy = @CreatedBy, p.ModifiedDate = @dt
	FROM dbo.Master_PropertySubType p 
	JOIN @Val v ON v.Id = p.Id
	WHERE p.PropertyTypeId = @Id  
END 

GO
/****** Object:  StoredProcedure [dbo].[usp_Qualification_GetQualificationByTableKeyId]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [usp_Qualification_GetQualificationByTableKeyId] @TableKeyId = 1, @TableName = 'Master_User'
CREATE PROCEDURE [dbo].[usp_Qualification_GetQualificationByTableKeyId]          
(
@TableKeyId INT = 0,           
@TableName VARCHAR(100)
)        
AS          
BEGIN    

SET NOCOUNT ON;

SELECT Id, Qualification,[Subject],Institute,Grade,YearOfInstitute,IsActive,CreatedBy
FROM Master_Qualification where TableKeyId=@TableKeyId AND TableName=@TableName AND ISNULL(IsDeleted, 0) = 0;

SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Quotation_GetQuotationByRequestId]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
-- exec [usp_Quotation_GetQuotationByRequestId] @RequestId = 53
CREATE PROCEDURE [dbo].[usp_Quotation_GetQuotationByRequestId]          
(
	@RequestId INT 
)        
AS          
BEGIN    

SET NOCOUNT ON;

	SELECT  Q.Id,Q.ReferenceNO,Q.ValuationRequestId,Q.StatusId,S.[Status] StatusName,Q.ValuationFee,Q.VAT,Q.OtherCharges,Q.InstructorCharges,
			Q.Discount,Q.TotalFee,Q.CreatedBy,Q.CreatedDate,U.UserName, VR.[StatusName] AS RequestStatus
	FROM dbo.ValuationQuotation Q
		INNER JOIN dbo.Master_ValuationStatus S ON Q.StatusId= S.Id AND s.[Type] = 2
		inner join dbo.vw_ValuationRequest VR on Q.ValuationRequestId = VR.Id 
		LEFT join dbo.Master_User U on Q.CreatedBy=U.Id
		WHERE ValuationRequestId=@RequestId AND ISNULL(Q.IsDeleted, 0) = 0
	order by Q.id desc
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_ResourceType_AllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [usp_ResourceType_AllList] @TableKeyId = 1, @TableName = 'Master_User'
CREATE PROCEDURE [dbo].[usp_ResourceType_AllList] 
AS          
BEGIN    

SET NOCOUNT ON;

SELECT Id, ResourceType,IsActive
FROM Master_ResourceType where ISNULL(IsActive,0)=1 AND ISNULL(IsDeleted, 0) = 0;

SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Role_AllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- exec [usp_Role_AllList]  
CREATE PROCEDURE [dbo].[usp_Role_AllList] 
(
	@CurrentPageNumber INT = 0,            
	@PageSize INT = 25,            
	@SortColumn VARCHAR(100) = 'Id',            
	@SortDirection VARCHAR(5) = 'ASC',            
	@SearchText VARCHAR(MAX) = NULL
)        
AS          
BEGIN     
	DECLARE @Letter VARCHAR(MAX) = @SearchText; --ISNULL(@SearchText, '')

	SELECT * FROM 
	(
		SELECT COUNT(U.[Id]) OVER() TotalRecord, ROW_NUMBER() OVER (ORDER BY U.Id ASC) TotalFilterCount,
				U.Id, U.Id RoleId, U.RoleName, U.IsActive
		FROM [dbo].[Master_Role] U  
		WHERE ISNULL(U.IsDeleted, 0) = 0 AND
		(@Letter IS NULL  OR (ISNULL(U.RoleName, '') LIKE '%' + @Letter + '%')) 
		AND ISNULL(U.IsDeleted, 0) = 0
	) Res

	WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize  
	
	ORDER BY 
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN  Id  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Id' THEN  Id  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'RoleName' THEN  RoleName  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'RoleName' THEN  RoleName  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'IsActive' THEN  IsActive  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'IsActive' THEN  IsActive  END ASC   
END 

GO
/****** Object:  StoredProcedure [dbo].[usp_Role_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

-- exec [usp_Role_AllList]  
CREATE PROCEDURE [dbo].[usp_Role_SearchAllList]
(
	@CurrentPageNumber INT = 0,            
	@PageSize INT = 25,            
	@SortColumn VARCHAR(100) = 'Id',            
	@SortDirection VARCHAR(5) = 'ASC',            
	@SearchText VARCHAR(MAX) = NULL
)        
AS          
BEGIN     
	DECLARE @Letter VARCHAR(MAX) = @SearchText; --ISNULL(@SearchText, '')

	SELECT * FROM 
	(
		SELECT COUNT(U.[Id]) OVER() TotalRecord, ROW_NUMBER() OVER (ORDER BY U.Id ASC) TotalFilterCount,
				U.Id, U.RoleName, U.IsActive
		FROM [dbo].[Master_Role] U  
		WHERE ISNULL(U.IsDeleted, 0) = 0 AND
		(@Letter IS NULL  OR (ISNULL(U.RoleName, '') LIKE '%' + @Letter + '%')) 
		AND ISNULL(U.IsDeleted, 0) = 0
	) Res

	WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize  
	
	ORDER BY 
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN  Id  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Id' THEN  Id  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'RoleName' THEN  RoleName  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'RoleName' THEN  RoleName  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'IsActive' THEN  IsActive  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'IsActive' THEN  IsActive  END ASC   
END 

GO
/****** Object:  StoredProcedure [dbo].[usp_Site_GetSiteDescriptionByRequestId]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
-- exec usp_Site_GetSiteDescriptionByRequestId  28  
CREATE PROCEDURE [dbo].[usp_Site_GetSiteDescriptionByRequestId]            
(  
@RequestId INT   
)          
AS            
BEGIN      
  
SET NOCOUNT ON;  
  
SELECT


SD.Id
,SD.ValuationRequestId
,SD.Location
,SD.InternalArea
,SD.ExternalArea
,SD.Floor
,SD.Room
,SD.Bedrooms
,SD.Storage
,SD.Quantity
,SD.AdditionComment
,SD.PropertyCondition
,SD.AdditionalNotes
,SD.Others
,MD.FileName
,MD.FilePath
,MD.FileType
,MD.DocumentName
FROM SiteDescription SD INNER JOIN ValuationRequest VR ON SD.ValuationRequestId=VR.Id  
Left Join Master_Document MD ON SD.ID=MD.TableKeyId and MD.TableName='SiteDescription'
WHERE ValuationRequestId=@RequestId;  
  
SET NOCOUNT OFF;  
           
END   
GO
/****** Object:  StoredProcedure [dbo].[usp_State_AllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [usp_State_AllList] 
CREATE PROCEDURE [dbo].[usp_State_AllList] 
AS          
BEGIN    

SET NOCOUNT ON;

SELECT Id, StateName,StateCode,CountryId, IsActive
FROM Master_State where ISNULL(IsActive,0)=1;

SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_State_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [dbo].[usp_State_SearchAllList] @StateId = 0,@PageNumber=1,@PageSize =20,@OrderClause='Id',@ReverseSort=0,@Letter=''
CREATE PROCEDURE [dbo].[usp_State_SearchAllList]          
(
@StateId INT = 0,
@PageNumber INT = 1,            
@PageSize INT = 25,            
@OrderClause VARCHAR(100) = 'StateName',            
@ReverseSort INT = 0,            
@Letter VARCHAR(MAX) =null
)        
AS          
BEGIN    

SET NOCOUNT ON;

Set @Letter = IsNull(@Letter, '')

DECLARE @t TABLE(Id INT, StateName VARCHAR(250), StateCode Varchar(50), CountryId INT,CountryName VARCHAR(250), IsActive INT, CreatedBy INT)
DECLARE @t1 TABLE(Id INT, StateName VARCHAR(250), StateCode Varchar(50), CountryId INT,CountryName VARCHAR(250), IsActive INT, CreatedBy INT)

insert into @t1
SELECT S.Id, S.StateName,S.StateCode,S.CountryId,C.CountryName,C.IsActive,C.CreatedBy
FROM Master_State S 
Inner join Master_Country C ON S.CountryId=C.Id
where S.StateName  LIKE  '%' + @Letter + '%'

insert into @t
select * from @t1
order By
StateName ASC
OFFSET @PageSize * (@PageNumber - 1) ROWS
FETCH NEXT @PageSize ROWS ONLY

SELECT COUNT(1) TotalRecords FROM @t1
SELECT * FROM @t;   
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_SubProperty_GetSubPropertyByPropertyIdList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [usp_SubProperty_GetSubPropertyByPropertyIdList] @PropertyTypeId = 0
CREATE PROCEDURE [dbo].[usp_SubProperty_GetSubPropertyByPropertyIdList]            
(  
@PropertyTypeId INT = 0            
)          
AS            
BEGIN      
  
SET NOCOUNT ON;  

select Id, PropertySubType, IsActive from Master_PropertySubType where @PropertyTypeId = PropertyTypeId
  
SET NOCOUNT OFF;  
           
END   
GO
/****** Object:  StoredProcedure [dbo].[usp_Update]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Update]
@By INT = NULL
AS
BEGIN
 
 UPDATE p SET p.CreatedDate = GETDATE()
 FROM [dbo].[EmailLogHistory] p
 WHERE p.ToAddress = 'admin@gmail.com' AND p.Id = @By 
END


 
GO
/****** Object:  StoredProcedure [dbo].[usp_User_AllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- exec [usp_User_AllList] 
CREATE PROCEDURE [dbo].[usp_User_AllList] 
AS          
BEGIN     
	
	SELECT Id, UserName
	FROM Master_User 
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_User_GetUserDetails]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_User_GetUserDetails] 
@Id INT = NULL,
@LastName VARCHAR(100) = NULL,
@IsActive BIT = NULL,
@Email VARCHAR(100) = NULL,
@Password VARCHAR(100) = NULL
AS 
BEGIN
	SELECT 'Yalla' DD

END
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Search_GetUserList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- exec usp_User_Search_GetUserList @CurrentPageNumber =1,@PageSize=100, @SearchText ='ya'  @SearchText = 'Ni', @PageSize = 10, @CurrentPageNumber = 0
CREATE PROCEDURE [dbo].[usp_User_Search_GetUserList]          
( 
	@UserId INT = 0,
	@CurrentPageNumber INT = 0,            
	@PageSize INT = 25,            
	@SortColumn VARCHAR(100) = 'Id',            
	@SortDirection VARCHAR(5) = 'ASC',            
	@SearchText VARCHAR(MAX) = NULL
)        
AS          
BEGIN     
	DECLARE @Letter VARCHAR(MAX) = @SearchText; --ISNULL(@SearchText, '')

	SELECT * FROM 
	(
		SELECT COUNT(U.[Id]) OVER() TotalRecord, ROW_NUMBER() OVER (ORDER BY U.Id ASC) TotalCount,
				U.Id, U.UserName, DP.Department, DS.Designation, RT.ResourceType,
				R.RoleName,AD.Email,AD.Phone, U.CreatedDate, U.IsActive
		FROM [dbo].[Master_User] U 
		LEFT JOIN Master_Department DP ON U.DepartmentId=DP.Id
		LEFT JOIN Master_Designation DS ON U.DepartmentId=DS.Id
		LEFT JOIN Master_ResourceType RT ON U.ResourceId=RT.Id
		LEFT JOIN Master_Role R ON U.RoleId=R.Id
		LEFT JOIN Master_Address AD ON U.Id = AD.TableKeyId AND AD.TableName='Master_User'
		WHERE
		(@Letter IS NULL  OR (ISNULL(U.UserName, '') LIKE '%' + @Letter + '%'			 OR ISNULL(DP.Department, '') LIKE '%' + @Letter + '%' 
								OR ISNULL(DS.Designation, '') LIKE '%' + @Letter + '%'	 OR ISNULL(RT.ResourceType, '') LIKE '%' + @Letter + '%' 
								OR ISNULL(AD.Email, '') LIKE '%' + @Letter + '%'		 OR ISNULL(U.IsActive, 0) LIKE '%' + @Letter + '%'	 
								OR ISNULL(R.RoleName, '') LIKE '%' + @Letter + '%'		 OR ISNULL(AD.Phone, '') LIKE '%' + @Letter + '%'
							 )
		) 
		AND ISNULL(U.IsDeleted, 0) = 0
	) Res

	WHERE TotalCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize  
	
	ORDER BY 
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN  Id  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Id' THEN  Id  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'UserName' THEN  UserName  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'UserName' THEN  UserName  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Department' THEN  UserName  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Department' THEN  UserName  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Designation' THEN  Designation  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Designation' THEN  Designation  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ResourceType' THEN  ResourceType  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'ResourceType' THEN  ResourceType  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'RoleName' THEN  RoleName  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'RoleName' THEN  RoleName  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Phone' THEN  Phone  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Phone' THEN  Phone  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Email' THEN  Email  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Email' THEN  Email  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'IsActive' THEN  IsActive  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'IsActive' THEN  IsActive  END ASC   
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_User_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- exec usp_User_SearchAllList @CurrentPageNumber =0,@PageSize=25, @SearchText ='p'  @SearchText = 'Ni', @PageSize = 10, @CurrentPageNumber = 0
CREATE PROCEDURE [dbo].[usp_User_SearchAllList]          
(  
	@CurrentPageNumber INT = 0,            
	@PageSize INT = 25,            
	@SortColumn VARCHAR(100) = 'Id',            
	@SortDirection VARCHAR(5) = 'DESC',            
	@SearchText VARCHAR(MAX) = NULL
)        
AS          
BEGIN     
	DECLARE @Letter VARCHAR(MAX) = @SearchText; --ISNULL(@SearchText, '')

	SELECT * FROM 
	(
		SELECT COUNT(U.[Id]) OVER() TotalRecord, ROW_NUMBER() OVER (ORDER BY U.Id DESC) TotalFilterCount,
				U.Id, U.UserName, DP.Department, DS.Designation, RT.ResourceType, R.RoleName, U.Email, S.Phone, U.CreatedDate, U.IsActive
		FROM [dbo].[Master_User] U 
		LEFT JOIN Master_Department DP	 ON U.DepartmentId=DP.Id
		LEFT JOIN Master_Designation DS  ON U.DesignationId=DS.Id
		LEFT JOIN Master_ResourceType RT ON U.ResourceId=RT.Id
		LEFT JOIN Master_Role R			 ON U.RoleId = R.Id
		-- LEFT JOIN Master_Address AD		 ON U.Id = AD.TableKeyId AND AD.TableName='Master_User'
		OUTER APPLY (SELECT STUFF((SELECT ',' + AD.Phone    
			FROM Master_Address AD        
			WHERE U.Id = AD.TableKeyId AND AD.TableName='Master_User'  AND ISNULL(AD.IsDeleted,0)=0  -- AND AD.IsActive = 1 
			FOR XML PATH('')), 1, 1, ''  
			) as Phone 
		) S
		WHERE
		(@Letter IS NULL  OR (ISNULL(U.UserName, '') LIKE '%' + @Letter + '%'			 OR ISNULL(DP.Department, '') LIKE '%' + @Letter + '%' 
								OR ISNULL(DS.Designation, '') LIKE '%' + @Letter + '%'	 OR ISNULL(RT.ResourceType, '') LIKE '%' + @Letter + '%' 
								OR ISNULL(U.Email, '') LIKE '%' + @Letter + '%'		 OR ISNULL(U.IsActive, 0) LIKE '%' + @Letter + '%'	 
								OR ISNULL(R.RoleName, '') LIKE '%' + @Letter + '%'		 OR ISNULL(S.Phone, '') LIKE '%' + @Letter + '%'
							 )
		) 
		AND ISNULL(U.IsDeleted, 0) = 0
	) Res

	WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize  
	
	ORDER BY 
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN  Id  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Id' THEN  Id  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'UserName' THEN  UserName  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'UserName' THEN  UserName  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Department' THEN  UserName  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Department' THEN  UserName  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Designation' THEN  Designation  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Designation' THEN  Designation  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ResourceType' THEN  ResourceType  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'ResourceType' THEN  ResourceType  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'RoleName' THEN  RoleName  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'RoleName' THEN  RoleName  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Phone' THEN  Phone  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Phone' THEN  Phone  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Email' THEN  Email  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Email' THEN  Email  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'IsActive' THEN  IsActive  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'IsActive' THEN  IsActive  END ASC   
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_User_VerifyUserLogin]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[usp_User_VerifyUserLogin]              
(                  
	@Email VARCHAR(100),                
	@Password VARCHAR(100)  
)            
AS              
BEGIN        
	SELECT u.UserName, u.Id UserId, u.Email EmailAddress, u.RoleId, r.RoleName
	FROM dbo.Master_User u 
	JOIN dbo.Master_Role r ON r.Id = u.RoleId 
	WHERE u.Email = @Email   
	AND u.[Password]=@Password 
	AND u.IsActive=1  
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationFees_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
-- exec [dbo].[usp_ValuationFees_SearchAllList]  @SearchText ='General' @PageNumber=0 @Id = 0,@PageNumber=1,@PageSize =20,@OrderClause='Id',@ReverseSort=0,@Letter=''      
CREATE PROCEDURE [dbo].[usp_ValuationFees_SearchAllList]                
(      
 @CurrentPageNumber INT = 0,                
 @PageSize INT = 25,                
 @SortColumn VARCHAR(100) = 'Id',                
 @SortDirection VARCHAR(5) = 'DESC',                
 @SearchText VARCHAR(MAX) = NULL    
)              
AS                
BEGIN          
     
	 DECLARE @Letter VARCHAR(MAX) = @SearchText; --ISNULL(@SearchText, '')    
	 DECLARE @LetterNumeric NUMERIC    
	 SET @LetterNumeric = TRY_CAST(@Letter AS NUMERIC)    
    
	 SELECT * FROM     
	 (    
		  SELECT COUNT(VF.[Id]) OVER() TotalRecord, ROW_NUMBER() OVER (ORDER BY VF.Id DESC) TotalFilterCount,    
					VF.Id, VF.PropertyTypeId,PT.PropertyType, VF.PropertySubTypeId,PS.PropertySubType,VF.OwnershipTypeId,OT.OwnershipType,      
					VF.CarpetAreaInSqFt,VF.CarpetAreaInSqMtr,VF.ClientTypeId,CT.ClientType,DD.Description AS ValuationType,VF.ValuationFeeTypeId,VT.ValuationFeeType,      
					VF.ValuationFees,VF.VAT,VF.OtherCharges,ISNULL(VF.TotalValuationFees, FixedvaluationFees) TotalValuationFees, 
					VF.CreatedBy, VF.IsActive     
		  FROM Master_ValuationFees VF       
			  INNER JOIN Master_ValuationFeeType VT ON VF.ValuationFeeTypeId=VT.Id      
			  INNER JOIN Master_PropertyType PT ON VF.PropertyTypeId=PT.Id      
			  INNER JOIN Master_PropertySubType PS ON VF.PropertySubTypeId=PS.Id      
			  INNER JOIN Master_OwnershipType OT ON VF.OwnershipTypeId=OT.Id      
			  INNER JOIN Master_ClientType CT ON VF.ClientTypeId=CT.Id    
			  LEFT JOIN Master_DictionaryDetail DD ON VF.ValuationType = DD.Id    
		  WHERE    
			(@Letter IS NULL  OR (ISNULL(PT.PropertyType, '') LIKE '%' + @Letter + '%'      
									 OR ISNULL(PS.PropertySubType, '') LIKE '%' + @Letter + '%'     
									 OR ISNULL(VF.ValuationType, '') LIKE '%' + @Letter + '%'    
									 OR ISNULL(DD.Description, '') LIKE '%' + @Letter + '%'   
									 OR ISNULL(CT.ClientType, '') LIKE '%' + @Letter + '%'    
									 OR VF.TotalValuationFees = @LetterNumeric  
									 OR ISNULL(VF.TotalValuationFees, 0) LIKE '%' + CAST(@Letter AS VARCHAR) + '%')     
		   )    
		  AND ISNULL(VF.IsDeleted, 0) = 0    
	 ) Res    
    
	 WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize      
     
	 ORDER BY     
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN  Id  END DESC,    
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Id' THEN  Id  END ASC,    
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'PropertyType' THEN  PropertyType  END DESC,    
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'PropertyType' THEN  PropertyType  END ASC,    
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'PropertySubType' THEN  PropertySubType  END DESC,    
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'PropertySubType' THEN  PropertySubType  END ASC,    
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'OwnershipType' THEN  OwnershipType  END DESC,    
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'OwnershipType' THEN  OwnershipType  END ASC,    
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'CarpetAreaInSqFt' THEN  CarpetAreaInSqFt  END DESC,    
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'CarpetAreaInSqFt' THEN  CarpetAreaInSqFt  END ASC,    
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'CarpetAreaInSqMtr' THEN  CarpetAreaInSqMtr  END DESC,    
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'CarpetAreaInSqMtr' THEN  CarpetAreaInSqMtr  END ASC,    
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ClientType' THEN  ClientType  END DESC,    
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'ClientType' THEN  ClientType  END ASC,    
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ValuationType' THEN  ValuationType  END DESC,    
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'ValuationType' THEN  ValuationType  END ASC,      
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ValuationFeeType' THEN  ValuationFeeType  END DESC,    
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'ValuationFeeType' THEN  ValuationFeeType  END ASC,      
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'ValuationFees' THEN  ValuationFees  END ASC,    
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ValuationFees' THEN  ValuationFees  END DESC,    
	   CASE WHEN @SortDirection = 'DESC'  AND @SortColumn = 'OtherCharges' THEN  OtherCharges  END DESC,      
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'OtherCharges' THEN  OtherCharges  END ASC,    
	   CASE WHEN @SortDirection = 'DESC'  AND @SortColumn = 'IsActive' THEN  IsActive  END DESC,      
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'IsActive' THEN  IsActive  END ASC,    
	   CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'TotalValuationFees' THEN  TotalValuationFees  END DESC,    
	   CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'TotalValuationFees' THEN  TotalValuationFees  END ASC     
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationFeeType_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [dbo].[usp_ValuationFeeType_SearchAllList] @OwnershipTypeId = 0,@PageNumber=1,@PageSize =20,@OrderClause='Id',@ReverseSort=0,@Letter=''
CREATE PROCEDURE [dbo].[usp_ValuationFeeType_SearchAllList]          
(
@ValuationFeeTypeId INT = 0,
@PageNumber INT = 1,            
@PageSize INT = 25,            
@OrderClause VARCHAR(100) = 'ValuationFeeType',            
@ReverseSort INT = 0,            
@Letter VARCHAR(MAX) =null
)        
AS          
BEGIN    

SET NOCOUNT ON;

Set @Letter = IsNull(@Letter, '')

DECLARE @t TABLE(Id INT, ValuationFeeType VARCHAR(250), IsActive INT, CreatedBy INT)
DECLARE @t1 TABLE(Id INT, ValuationFeeType VARCHAR(250), IsActive INT, CreatedBy INT)

insert into @t1
SELECT Id, ValuationFeeType,IsActive,CreatedBy
FROM Master_ValuationFeeType 
where ValuationFeeType  LIKE  '%' + @Letter + '%' AND ISNULL(IsDeleted, 0) = 0

insert into @t
select * from @t1
order By
ValuationFeeType ASC
OFFSET @PageSize * (@PageNumber - 1) ROWS
FETCH NEXT @PageSize ROWS ONLY

SELECT COUNT(1) TotalRecords FROM @t1
SELECT * FROM @t;   
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationMethod_AllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [usp_ValuationMethod_AllList] @TableKeyId = 1, @TableName = 'Master_User'
CREATE PROCEDURE [dbo].[usp_ValuationMethod_AllList] 
AS          
BEGIN    

SET NOCOUNT ON;


SELECT DD.Id, DD.Description
FROM Master_DictionaryDetail AS DD
JOIN Master_Dictionary AS D ON DD.DictionaryId = D.Id
WHERE D.Description = 'Valuation Method';
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequest_ApproverLevel]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
---- EXEC [dbo].[usp_ValuationRequest_ApproverLevel] @ValReqId = 85
CREATE   PROCEDURE [dbo].[usp_ValuationRequest_ApproverLevel] 
( 
   @ValReqId INT = 0,
   @Amount DECIMAL(18, 4) = NULL
)        
AS          
BEGIN   
	IF ISNULL(@ValReqId, 0) != 0 
	BEGIN 
		 SELECT DISTINCT val.Id ApproverLevelId, val.[Description] ApproverLevel, u.Id ApproverId, u.UserName ApproverName,
				IIF(vrl.ValuationRequestId IS NOT NULL, 1, NULL) IsSelected, vrl.ValuationRequestId, vr.ReferenceNO,
				vrl.ApproverComment, vrl.StatusId, vs.StatusCode, vs.[Status], vs.ColorCode, vs.BackGroundColor,
				vrl.ModifiedDate CreatedDate, vrl.ModifiedBy CreatedBy, u1.UserName CreatedByName 
		 FROM dbo.[Master_ValuationRequestApproverLevel] val  
		 JOIN dbo.Master_User u						ON u.ApproverLevelId = val.Id  
		 OUTER APPLY (SELECT TOP 1 vrl.*
					   FROM dbo.[ValuationRequestApproverLevel] vrl WHERE vrl.ValuationRequestId = @ValReqId 
					   AND vrl.ApproverId = u.Id 
					   AND vrl.ApproverLevelId = val.Id 
					   AND ISNULL(vrl.IsDeleted, 0) = 0   
					   ORDER BY vrl.Id DESC
					  ) vrl
		 LEFT JOIN dbo.Master_User u1				ON u1.Id = vrl.ModifiedBy
		 LEFT JOIN dbo.Master_ValuationStatus vs	ON vs.Id = vrl.StatusId
		 LEFT JOIN dbo.vw_ValuationRequest vr		ON vr.Id = vrl.ValuationRequestId 
		 WHERE ISNULL(val.IsActive, 0) = 1  
			   AND val.Id != 1
		 ORDER BY u.UserName
	END
	ELSE BEGIN  
		 DECLARE @tbl TABLE (ApproverLevelId INT, ApproverLevel varchar(500))
		
		 INSERT INTO @tbl (ApproverLevelId, ApproverLevel)
		 SELECT DISTINCT val.Id, val.[Description]
		 FROM dbo.[Master_ValuationRequestApproverLevel] val 
		 WHERE   ISNULL(@Amount, 0)  >= ISNULL(val.FromAmount, 0) 
				 AND ISNULL(val.IsDeleted, 0) = 0
				 AND val.Id != 1

		 SELECT a.ApproverLevelId, a.ApproverLevel,  u.Id ApproverId, u.UserName ApproverName 
		 FROM @tbl a 
		 JOIN dbo.Master_User u ON u.ApproverLevelId = a.ApproverLevelId 
		 ORDER BY u.UserName
	END
END  
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequest_GetDependencies]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
  
-- EXEC dbo.usp_ValuationRequest_GetDependencies 10  
CREATE   PROCEDURE [dbo].[usp_ValuationRequest_GetDependencies]  
@Id INT  
AS  
BEGIN  
   
 SELECT r.Id, r.ReferenceNO, c.Id ClientId, c.ClientName, c.ClientTypeId, ct.ClientType, p.PropertyTypeId, pt.PropertyType,  
   p.OwnershipTypeId, o.OwnershipType, p.PropertySubTypeId, sp.PropertySubType,p.Id PropertyId , p.PropertyName,
   pl.CountryId AS LocationCountryId, pl.StateId AS LocationStateId, pl.CityId AS LocationCityId
 FROM dbo.vw_ValuationRequest r  
 JOIN dbo.Master_Client   c   ON c.Id = r.ClientId  
 JOIN dbo.Master_Property   p  ON p.Id = r.PropertyId   
 LEFT JOIN dbo.Master_ClientType ct  ON c.ClientTypeId = ct.Id   
 LEFT JOIN dbo.Master_PropertyType pt ON pt.Id = p.PropertyTypeId   
 LEFT JOIN dbo.Master_OwnershipType o ON o.Id = p.OwnershipTypeId  
 LEFT JOIN dbo.Master_PropertySubType sp ON sp.Id = p.PropertySubTypeId  
 LEFT JOIN dbo.Master_Property_Location pl ON p.Id = pl.PropertyId
 WHERE r.Id = @Id  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequest_GetLatestQuotation]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- exec [dbo].[usp_ValuationRequest_GetLatestQuotation] 0,0,'2023-11-10','2023-11-19'
CREATE PROCEDURE [dbo].[usp_ValuationRequest_GetLatestQuotation]          
(
	@ClientId INT = 0,
	@PropertyId INT = 0,
	@fromDate VARCHAR(20) = NULL,
	@ToDate VARCHAR(20)= NULL,
	@Pagesize INT = 5,
	@LoginUserId INT = NULL
)        
AS          
BEGIN   
	IF (@Pagesize = -1) BEGIN
		SET @Pagesize = 100000
	END

	DECLARE @app INT, @val INT;
	SELECT @app = u.IsApprover, @val = u.IsValuer
	FROM dbo.vw_User u 
	WHERE u.Id = @LogInUserId 
 
	SELECT TOP (@Pagesize) VQ.Id AS QuotationId,VR.Id AS ValId, VR.ReferenceNo AS ValRefNum,MC.ClientName,MP.PropertyName, 
						   VQ.ReferenceNo AS QuotationNum, VQ.TotalFee AS QuotationFee
	from  [dbo].[ValuationQuotation] VQ
	INNER JOIN vw_ValuationRequest VR	ON VQ.ValuationRequestId=VR.Id
	INNER JOIN Master_Client MC			ON VR.ClientId=MC.Id
	INNER JOIN Master_Property MP	    ON VR.PropertyId=MP.Id 
	WHERE     (@ClientId =0			 OR  VR.ClientId = @ClientId)
		  AND (@PropertyId =0		 OR  VR.PropertyId = @PropertyId)
		  AND (@FromDate IS NULL	 OR  VQ.CreatedDate >= @FromDate)
		  AND (@ToDate IS NULL		 OR  VQ.CreatedDate <= @ToDate)
		  AND (@app IS NULL			 OR  VR.ApproverId = @LogInUserId)
		  AND (@val IS NULL			 OR  VR.ValuerId   = @LogInUserId)
		  AND VQ.StatusId IS NOT NULL 
		  AND ISNULL(VQ.IsDeleted, 0) = 0
	ORDER BY VQ.Id DESC   
         
END 

GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequest_GetLatestRequest]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- exec [dbo].[usp_ValuationRequest_GetLatestRequest] 
CREATE PROCEDURE [dbo].[usp_ValuationRequest_GetLatestRequest]      
(
	@ClientId INT = 0,
	@PropertyId INT = 0,
	@fromDate VARCHAR(20)= NULL,
	@ToDate VARCHAR(20)= NULL,
	@Pagesize INT = 5,
	@LoginUserId INT = NULL
)        
AS          
BEGIN    
	IF (@Pagesize = -1) BEGIN
		SET @Pagesize = 100000
	END
	
	DECLARE @app INT, @val INT;
	SELECT @app = u.IsApprover, @val = u.IsValuer
	FROM dbo.vw_User u 
	WHERE u.Id = @LogInUserId 

	SELECT TOP (@Pagesize) VR.Id AS ValId,VR.ReferenceNO AS ValRefNum, MC.ClientName,MP.PropertyName,
						   VR.ValuationDate, VR.StatusName AS [Status], VR.BackGroundColor, VR.ColorCode
	from dbo.vw_ValuationRequest VR
	JOIN dbo.Master_Client MC		ON VR.ClientId=MC.Id
	JOIN dbo.Master_Property MP		ON VR.PropertyId=MP.Id 
	WHERE	(@ClientId =0			 OR  VR.ClientId = @ClientId)
		AND (@PropertyId =0			 OR  VR.PropertyId = @PropertyId)
		AND (@FromDate IS NULL		 OR  VR.ValuationDate >= @FromDate)
		AND (@ToDate IS NULL		 OR  VR.ValuationDate <= @ToDate)
		AND (@app IS NULL			 OR  VR.ApproverId = @LogInUserId)
		AND (@val IS NULL			 OR  VR.ValuerId   = @LogInUserId)
	ORDER BY VR.Id DESC   
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequest_GetNotificationData]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- exec [usp_ValuationRequest_GetNotificationData] 1, 41
CREATE   PROCEDURE [dbo].[usp_ValuationRequest_GetNotificationData] 
@Action INT,
@ValId INT
AS
BEGIN
    DECLARE @res TABLE (ValId INT, ValRefNo varchar(max), Client varchar(max), Property varchar(max), 
						[Location] varchar(max), [Status] varchar(max), StatusId INT, ToEmailList varchar(max));
	DECLARE @toEmail varchar(max) = '';


	----- Get email of admin, requestor and created user for request -------
	SELECT @toEmail =  STUFF((SELECT DISTINCT '; ' + u.Email FROM dbo.Master_User u  
						WHERE u.Id IN (vr.CreatedBy) OR u.RoleId IN (1, 4) FOR XML PATH ('')) , 1, 1, '')   
	FROM dbo.ValuationRequest vr WITH(NOLOCK) 
	WHERE vr.Id = @ValId 
	 
     ---- Create Valuation or status change -----
     -- IF (@Action IN (1, 2)) 
	 BEGIN  
		INSERT INTO @res
		SELECT  vr.Id ValId, vr.[ReferenceNO], c.ClientName, p.PropertyName, p.[TotalAddress], vr.[StatusName], vr.StatusId, 
				@toEmail + IIF(a.Email IS NULL, '', ';' + a.Email) + IIF(a.AlternateEmail IS NULL, '', ';' + a.AlternateEmail) + ';ch.yallareddy@gmail.com'
			  
		FROM dbo.vw_ValuationRequest vr WITH(NOLOCK) 
		LEFT JOIN dbo.Master_Client c WITH(NOLOCK) ON c.Id = vr.ClientId
		LEFT JOIN dbo.Master_Address a WITH(NOLOCK) ON a.TableKeyId = c.Id AND a.TableName = 'Master_Client' AND a.IsActive = 1
		LEFT JOIN dbo.vw_Property_Location p WITH(NOLOCK) ON p.PropertyId = vr.PropertyId 
		WHERE vr.Id = @ValId
	 END
	 ---- Quotation crated -----
	 
	 ---- Invoice crated ----- 
	 
	 SELECT * FROM @res
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequest_GetStatus]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
--exec usp_ValuationRequest_GetStatus
CREATE   PROC [dbo].[usp_ValuationRequest_GetStatus]
@RoleId INT,
@ValReqId INT = NULL
AS
BEGIN
	SELECT * FROM dbo.Master_ValuationStatus s  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequest_GetTopQuotationDue]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [dbo].[usp_ValuationRequest_GetTopQuotationDue] -- 0,0,'2023-11-10','2023-11-19'
CREATE PROCEDURE [dbo].[usp_ValuationRequest_GetTopQuotationDue]          
(
	@ClientId INT = 0,
	@PropertyId INT = 0,
	@fromDate VARCHAR(20)= NULL,
	@ToDate VARCHAR(20)= NULL,
	@Pagesize INT = 5,
	@LoginUserId INT = NULL
)        
AS          
BEGIN    
	IF (@Pagesize = -1) BEGIN
		SET @Pagesize = 100000
	END

	DECLARE @app INT, @val INT;
	SELECT @app = u.IsApprover, @val = u.IsValuer
	FROM dbo.vw_User u 
	WHERE u.Id = @LogInUserId 
 
	SELECT TOP (@Pagesize) VR.Id AS ValId, VR.ReferenceNo AS ValRefNum,MC.ClientName,MP.PropertyName, 
			VQ.ReferenceNo AS QuotationNum, VQ.TotalFee AS QuotationFee
	FROM [dbo].[ValuationQuotation] VQ
		JOIN [dbo].ValuationRequest VR		ON VQ.ValuationRequestId=VR.Id
		JOIN [dbo].Master_Client MC			ON VR.ClientId=MC.Id
		JOIN [dbo].Master_Property MP		ON VR.PropertyId=MP.Id 
		LEFT JOIN [dbo].[ValuationInvoice] VI ON vi.ValuationRequestId = VQ.ValuationRequestId
	WHERE	(@ClientId =0			OR  VR.ClientId = @ClientId)
		AND (@PropertyId =0			OR  VR.PropertyId = @PropertyId)
		AND (@FromDate IS NULL		OR  VQ.CreatedDate >= @FromDate)
		AND (@ToDate IS NULL		OR  VQ.CreatedDate <= @ToDate)
		AND (@app IS NULL			OR  VR.ApproverId = @LogInUserId)
		AND (@val IS NULL			OR  VR.ValuerId   = @LogInUserId)
		AND VQ.StatusId IS NOT NULL		  AND ISNULL(VQ.IsDeleted, 0) = 0
		AND VI.ValuationRequestId IS NULL AND ISNULL(VI.IsDeleted, 0) = 0
	ORDER BY VQ.TotalFee DESC   
         
END  

GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequest_GetTopValuation]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- exec [dbo].[usp_ValuationRequest_GetTopValuation] 
CREATE PROCEDURE [dbo].[usp_ValuationRequest_GetTopValuation]          
(
	@ClientId INT = 0,
	@PropertyId INT = 0,
	@fromDate VARCHAR(20)= NULL,
	@ToDate VARCHAR(20)= NULL,
	@Pagesize INT = 5,
	@LoginUserId INT = NULL
)        
AS          
BEGIN    
	IF (@Pagesize = -1) BEGIN
		SET @Pagesize = 100000
	END

	DECLARE @app INT, @val INT;
	SELECT @app = u.IsApprover, @val = u.IsValuer
	FROM dbo.vw_User u 
	WHERE u.Id = @LogInUserId 
 
	SELECT TOP (@Pagesize) VQ.ValuationRequestId AS ValId, VR.ReferenceNo AS ValRefNum,MC.ClientName,MP.PropertyName, MAX(TotalFee) AS ValuationAmount
	FROM	  dbo.ValuationQuotation VQ 
		 JOIN dbo.vw_ValuationRequest VR ON VQ.ValuationRequestId=VR.Id
		 JOIN dbo.Master_Client MC ON VR.ClientId=MC.Id
		 JOIN dbo.Master_Property MP ON VR.PropertyId=MP.Id
	WHERE	(@ClientId =0		OR (VR.ClientId = @ClientId))
		AND (@PropertyId =0		OR (VR.PropertyId = @PropertyId))
		AND (@FromDate IS NULL  OR (VR.ValuationDate >= @FromDate))
		AND (@ToDate IS NULL	OR (VR.ValuationDate <= @ToDate))
		AND (@app IS NULL		OR  VR.ApproverId = @LogInUserId)
		AND (@val IS NULL		OR  VR.ValuerId   = @LogInUserId)
		AND ISNULL(VQ.IsDeleted, 0) = 0
	GROUP By VQ.ValuationRequestId,VR.ReferenceNo,MC.ClientName,MP.PropertyName 
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequest_GetWidgetRequest]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
-- exec [dbo].[usp_ValuationRequest_GetWidgetRequest] 
CREATE    PROCEDURE [dbo].[usp_ValuationRequest_GetWidgetRequest]      
(
	@ClientId INT = 0,
	@PropertyId INT = 0,
	@fromDate VARCHAR(20)= NULL,
	@ToDate VARCHAR(20)= NULL,
	@Pagesize INT = 5,
	@LoginUserId INT = NULL
)        
AS          
BEGIN    
	IF (@Pagesize = -1) BEGIN
		SET @Pagesize = 100000
	END
	
	DECLARE @app INT, @val INT;
	SELECT @app = u.IsApprover, @val = u.IsValuer
	FROM dbo.vw_User u 
	WHERE u.Id = @LogInUserId 

	DECLARE @TotalClients INT, @TotalProperties INT, @TotalCompleted DECIMAL(18, 2), @TotalPending DECIMAL(18, 2),
			@TotalRequests DECIMAL(18, 2), @TotalDue DECIMAL(18, 2), @TotalRevenue DECIMAL(18, 2), @assignedProj INT

	SELECT vr.Id ValReqId, vr.ClientId, vr.PropertyId, vr.[StatusId], VR.StatusName
	INTO #Report
	FROM dbo.vw_ValuationRequest VR 
		JOIN dbo.Master_Client MC			ON VR.ClientId=MC.Id
		JOIN dbo.Master_Property MP			ON VR.PropertyId=MP.Id 
	WHERE		(@ClientId =0		OR  VR.ClientId = @ClientId)
			AND (@PropertyId =0		OR  VR.PropertyId = @PropertyId)
			AND (@FromDate IS NULL  OR  VR.ValuationDate >= @FromDate)
			AND (@ToDate IS NULL	OR  VR.ValuationDate <= @ToDate)
			AND (@app IS NULL		OR  VR.ApproverId = @LogInUserId)
		    AND (@val IS NULL		OR  VR.ValuerId   = @LogInUserId) 

	SELECT @TotalClients = COUNT(DISTINCT r.ClientId), @TotalProperties = COUNT(DISTINCT r.PropertyId),	
		   @assignedProj = (SELECT COUNT(1) FROM #Report r1 WHERE r1.StatusName NOT IN ('Completed', 'Approved', 'Rejected'))
	FROM #Report r;

	SELECT @TotalRequests  = COUNT(1) FROM #Report r;
	SELECT @TotalCompleted = SUM((IIF(r.[StatusName]  = 'Completed', 1, 0))) FROM #Report r;
	SELECT @TotalPending   = SUM((IIF(r.[StatusName] != 'Completed', 1, 0))) FROM #Report r;
	 
	SELECT @TotalCompleted = ROUND(@TotalCompleted / CAST(@TotalRequests AS DECIMAL(18, 2))*100, 0)
	SELECT @TotalPending = ROUND(@TotalPending / CAST(@TotalRequests AS DECIMAL(18, 2))*100, 0)
	 

	 SELECT @TotalDue = SUM(ISNULL(q.TotalFee, 0)) 
	 FROM dbo.ValuationQuotation q  
	 JOIN #Report t						  ON t.ValReqId = q.ValuationRequestId 

	 SELECT @TotalRevenue = SUM(vi.Amount) 
	 FROM dbo.ValuationInvoice vi  
	 JOIN #Report t		 ON t.ValReqId = vi.ValuationRequestId  

	-- Final selection -----
	SELECT @TotalClients TotalClients, @TotalProperties TotalProjects, @assignedProj AssignedProjects,
		   @TotalCompleted CompletedPerc, @TotalPending PendingPerc,
		   @TotalRequests TotalRequests, @TotalDue TotalDue, @TotalRevenue TotalRevenue

	DROP TABLE #Report;
END 
 
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequest_PerformApproverActions]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
 -- EXEC dbo.[usp_ValuationRequest_UpsertApproverLevels]  @ValReqId = 67, @CreatedBy = 1, @ValQuotId = 171, @RequestData = '2,3'
CREATE    PROCEDURE [dbo].[usp_ValuationRequest_PerformApproverActions] 
(
	@ValReqId  INT,    
	@StatusId INT,
	@Comment VARCHAR(1000),
	@CreatedBy INT
)        
AS          
BEGIN    
	--- Insert into new values -----
 	UPDATE a SET a.StatusId = @StatusId, a.ApproverComment = @Comment, a.ModifiedBy = @CreatedBy, a.ModifiedDate = GETDATE()
	FROM dbo.ValuationRequestApproverLevel a
	WHERE a.ValuationRequestId = @ValReqId AND a.ApproverId = @CreatedBy


	SELECT a.ApproverId
	FROM dbo.ValuationRequestApproverLevel a
	WHERE a.ValuationRequestId = @ValReqId AND a.StatusId IS NULL 
	ORDER BY a.ApproverLevelId ASC 
END 

GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequest_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 -- [usp_ValuationRequest_SearchAllList] @LogInUserId = 58 @PropertyTypeId='2' @SearchText = 'Mardul' @SortColumn=''
CREATE   PROCEDURE [dbo].[usp_ValuationRequest_SearchAllList] 
(
    @CurrentPageNumber INT = 0,            
    @PageSize INT = 25,            
    @SortColumn VARCHAR(100) = 'Id',            
    @SortDirection VARCHAR(5) = 'DESC', 
	@LogInUserId INT  = NULL,
    @SearchText VARCHAR(MAX) = NULL,
	@UserName VARCHAR(200) = NULL,
	@ClientName VARCHAR(200) = NULL,
	@PropertyName VARCHAR(200) = NULL,
	@ValuationStatus INT = 0,
	@ValuationMethod INT = 0,
	@PropertyTypeId INT = 0,
    @CountryId INT = 0,
    @StateId INT = 0,
    @CityId INT = 0,
    @fromDate DATE = NULL,
    @ToDate DATE = NULL,
	@ValRef VARCHAR(200) = NULL 
)        
AS          
BEGIN     
    DECLARE @Letter VARCHAR(MAX) = @SearchText, @app INT, @val INT
	SET @CountryId=nullif(@CountryId, 0)
	SET @StateId=nullif(@StateId, 0)
	SET @CityId=nullif(@CityId, 0)
	SET @ValuationStatus=nullif(@ValuationStatus, 0)
	SET @ValuationMethod=nullif(@ValuationMethod, 0)
	SET @PropertyTypeId=nullif(@PropertyTypeId, 0)

	SELECT @app = u.IsApprover, @val = IsValuer
	FROM dbo.vw_User u WHERE u.Id = @LogInUserId 

    SELECT * FROM 
    (
        SELECT COUNT(VR.[Id]) OVER() TotalRecord,  ROW_NUMBER() OVER (ORDER BY VR.Id DESC) TotalFilterCount,
             VR.Id, VR.ReferenceNO, CT.ClientType, C.ClientName, MS.StateName AS [Location], PT.PropertyType, P.PropertyName , 
			 P.ValuationPurpose, MDD.[Description] AS MethodOfValuation, VR.ValuationDate, MR.UserName AS Requestor,  MRU.UserName AS Valuator,  
			 MU.UserName AS Approver, VR.StatusName, VR.ColorCode, VR.BackGroundColor
        FROM [dbo].[vw_ValuationRequest] VR
        LEFT JOIN Master_Client C				ON VR.ClientId = C.Id
        LEFT JOIN Master_ClientType CT			ON C.ClientTypeId = CT.Id
        LEFT JOIN Master_Property P				ON VR.PropertyId = P.Id
		LEFT JOIN Master_PropertyType PT		ON PT.Id = P.PropertyTypeId 
        LEFT JOIN Master_User MU				ON VR.ApproverId = MU.Id
        LEFT JOIN Master_User MR				ON VR.CreatedBy = MR.Id
        LEFT JOIN Master_User MRU				ON VR.ValuerId = MRU.Id
        LEFT JOIN Master_DictionaryDetail MDD	ON MDD.Id = VR.ValuerId 
        LEFT JOIN Master_Dictionary MD			ON MD.Id = MDD.DictionaryId AND MD.DictionaryCode = 'ValuationMethod'
        LEFT JOIN Master_Property_Location PL	ON VR.PropertyId = PL.PropertyID
        LEFT JOIN Master_State MS				ON PL.StateId = MS.ID 
        WHERE  (@Letter IS NULL		 OR (C.ClientName LIKE '%' + @Letter + '%')  OR ISNULL(VR.ReferenceNO, '') LIKE '%' + @Letter + '%'
									 OR ISNULL(CT.ClientType, '') LIKE '%' + @Letter + '%'    OR ISNULL(C.ClientName, '') LIKE '%' + @Letter + '%'
									 OR ISNULL(PT.PropertyType, '') LIKE '%' + @Letter + '%'    OR ISNULL(P.PropertyName, '') LIKE '%' + @Letter + '%'
									 OR ISNULL(MS.StateName, '') LIKE '%' + @Letter + '%'    OR ISNULL(P.ValuationPurpose, '') LIKE '%' + @Letter + '%'
									 OR ISNULL(MDD.[Description], '') LIKE '%' + @Letter + '%'    OR ISNULL(MR.UserName, '') LIKE '%' + @Letter + '%'
									 OR ISNULL(MRU.UserName, '') LIKE '%' + @Letter + '%'    OR Convert(nvarchar(20), ValuationDate, 113)  LIKE '%' + REPLACE(@Letter,'-',' ') + '%'
									 OR ISNULL(MU.UserName, '') LIKE '%' + @Letter + '%' OR ISNULL(VR.StatusName, '') LIKE '%' + @Letter + '%'
									 OR ISNULL(VR.StatusName, '') LIKE '%' + @Letter + '%')
            AND (@CountryId IS NULL			OR (PL.CountryId = @CountryId))
            AND (@StateId IS NULL			OR (PL.StateId = @StateId))
            AND (@CityId IS NULL			OR (PL.CityId = @CityId))
			AND (@CityId IS NULL			OR (PL.CityId = @CityId))
            AND (@FromDate IS NULL			OR (VR.ValuationDate >= @FromDate))
            AND (@ToDate IS NULL			OR (VR.ValuationDate <= @ToDate))
			AND (@ValuationStatus IS NULL   OR VR.StatusId = @ValuationStatus)
			AND (@ValuationMethod IS NULL   OR VR.ValuationModeId = @ValuationMethod)
			AND (@PropertyTypeId IS NULL	OR P.PropertyTypeId = @PropertyTypeId)
			AND (@UserName IS NULL			OR (MU.UserName LIKE '%' + @UserName + '%'  OR MR.UserName LIKE '%' + @UserName + '%'  OR MRU.UserName LIKE '%' + @UserName + '%' ))
			AND (@ClientName IS NULL		OR  C.Id = @ClientName)
			AND (@PropertyName IS NULL		OR  P.Id = @PropertyName)
			AND (@ValRef IS NULL			OR  VR.ReferenceNO LIKE '%' + @ValRef + '%')
			AND (@app IS NULL				OR  VR.ApproverId = @LogInUserId) -- AND (VR.[Group] = 2 OR VR.[StatusCode] = 'STA')))
			AND (@val IS NULL				OR  VR.ValuerId   = @LogInUserId)
			AND ISNULL(VR.IsDeleted, 0) = 0
    ) Res 
    WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize  

    ORDER BY 
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN Id END DESC,
        CASE WHEN @SortDirection = 'ASC' AND @SortColumn  = 'Id' THEN Id END ASC,
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ClientName' THEN ClientName END DESC,
        CASE WHEN @SortDirection = 'ASC' AND @SortColumn  = 'ClientName' THEN ClientName END ASC,
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ClientType' THEN ClientType END DESC,
        CASE WHEN @SortDirection = 'ASC' AND @SortColumn  = 'ClientType' THEN ClientType END ASC,
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'PropertyName' THEN PropertyName END DESC,
        CASE WHEN @SortDirection = 'ASC' AND @SortColumn  = 'PropertyName' THEN PropertyName END ASC ,
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'PropertyType' THEN PropertyType END DESC,
        CASE WHEN @SortDirection = 'ASC' AND @SortColumn  = 'PropertyType' THEN PropertyType END ASC ,
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ReferenceNO' THEN ReferenceNO END DESC,
        CASE WHEN @SortDirection = 'ASC' AND @SortColumn  = 'ReferenceNO' THEN ReferenceNO END ASC ,
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Location' THEN [Location] END DESC,
        CASE WHEN @SortDirection = 'ASC' AND @SortColumn  = 'Location' THEN [Location] END ASC ,
		CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ValuationPurpose' THEN ValuationPurpose END DESC,
        CASE WHEN @SortDirection = 'ASC' AND @SortColumn  = 'ValuationPurpose' THEN ValuationPurpose END ASC ,
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Requestor' THEN Requestor END DESC,
        CASE WHEN @SortDirection = 'ASC' AND @SortColumn  = 'Requestor' THEN Requestor END ASC ,
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Valuator' THEN Valuator END DESC,
        CASE WHEN @SortDirection = 'ASC' AND @SortColumn  = 'Valuator' THEN Valuator END ASC ,
		 CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ValuationDate' THEN ValuationDate END DESC,
        CASE WHEN @SortDirection = 'ASC' AND @SortColumn  = 'ValuationDate' THEN ValuationDate END ASC ,
        CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Approver' THEN Approver END DESC,
        CASE WHEN @SortDirection = 'ASC' AND @SortColumn  = 'Approver' THEN Approver END ASC 
END  
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequest_StatusChangeValidation]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC dbo.usp_ValuationRequest_StatusChangeValidation @ValReqId = 69, @StatusCd = 'STV'
CREATE   PROC [dbo].[usp_ValuationRequest_StatusChangeValidation]
@ValReqId INT,
@StatusCd VARCHAR(100) 
AS
BEGIN
	DECLARE @status VARCHAR(200), @statusC VARCHAR(200), @err VARCHAR(max), @app INT, @val INT

	--SELECT @app = u.IsApprover, @val = u.IsValuer
	--FROM dbo.vw_User u WHERE u.Id = @LogInUserId 

	--SELECT @status = v.StatusName, @statusC = v.StatusCode
	--FROM dbo.vw_ValuationRequest v  
	--WHERE v.Id = @ValReqId

	IF (@StatusCd = 'STV' AND 
	    EXISTS (SELECT TOP 1 am.[Status]
				FROM dbo.vw_ValuationRequest v  
				JOIN dbo.ValuationRequestApproverLevel av  ON av.ValuationRequestId = v.Id
				JOIN dbo.Master_ValuationStatus			am ON am.Id = av.StatusId AND am.StatusCode != 'APP'
				WHERE v.Id = @ValReqId))
	BEGIN
		SET @err = 'Status change request is not allowed for Valuation, as other approvers actions is pending.'
	END   

	SELECT @err ErrorMessage 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequest_StatusHistory]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
---- EXEC dbo.usp_ValuationRequest_StatusHistory 5
CREATE    PROC [dbo].[usp_ValuationRequest_StatusHistory]
@ValReqId INT
AS
BEGIN
	SELECT  vr.ReferenceNO, vh.StatusId, vs.StatusCode, vs.[Status], vs.ColorCode,	vs.BackGroundColor,		
		    vh.CreatedDate, vh.CreatedBy, u.UserName CreatedByName
	FROM dbo.[ValuationRequestStatusHistory] vh WITH(NOLOCK)
	JOIN dbo.[vw_ValuationRequest] vr	  WITH(NOLOCK) ON vr.Id = vh.ValuationRequestId
	JOIN dbo.[Master_ValuationStatus] vs  WITH(NOLOCK) ON vs.Id = vh.StatusId
	JOIN dbo.[vw_User]	 u				  WITH(NOLOCK) ON u.Id = vh.CreatedBy
	WHERE vr.Id = @ValReqId 
	ORDER BY vh.Id DESC
END
 
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequest_UpsertApproverLevels]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 -- EXEC dbo.[usp_ValuationRequest_UpsertApproverLevels]  @ValReqId = 67, @CreatedBy = 1, @ValQuotId = 171, @RequestData = '2,3'
CREATE   PROCEDURE [dbo].[usp_ValuationRequest_UpsertApproverLevels] 
(
	@ValReqId  INT,    
	@CreatedBy INT = 1,
	@ValQuotId INT = NULL, 
	@RequestData VARCHAR(MAX) = NULL
)        
AS          
BEGIN     
	DECLARE @Val TABLE([ApproverLevelId] INT, [ApproverId] INT)
	DECLARE @ValQ TABLE([ValQId] INT)
	DECLARE @dt DATETIME = GETDATE()


	INSERT INTO @Val
	SELECT ptv.[Id], ptv.[Value] 
	FROM dbo.ufn_Split_Multi(@RequestData, ';', ',') ptv 
	
	UNION
	SELECT 1, v.ApproverId
	FROM dbo.ValuationRequest v WITH(NOLOCK)
	WHERE v.Id = @ValReqId AND v.ApproverId IS NOT NULL -- For existing approvers 

	DELETE t FROM @Val t WHERE t.[ApproverId] = 0

	--- Get Val Quotation data ----
	INSERT INTO @ValQ 
	SELECT TOP 1 v.Id
	FROM dbo.ValuationQuotation v WHERE v.ValuationRequestId = @ValReqId 
		 AND ISNULL(v.IsDeleted, 0) = 0 
		 AND (@ValQuotId IS NULL OR v.Id = @ValQuotId)
	ORDER BY v.Id DESC
		  

	--- Delete unwanted ones ------
	UPDATE p SET p.IsDeleted = IIF(vra.[ApproverLevelId] IS NULL, 1, NULL), p.ModifiedBy = @CreatedBy, p.ModifiedDate = @dt
	-- SELECT p.*
	FROM dbo.[ValuationRequestApproverLevel] p 
	OUTER APPLY (SELECT TOP 1 * FROM @Val v  
				 WHERE	   v.[ApproverLevelId] = p.[ApproverLevelId] AND v.ApproverId = p.ApproverId 
				) vra
	WHERE	 p.ValuationRequestId = @ValReqId 
		AND (p.ValuationQuotationId IN (SELECT t.ValQId FROM @ValQ t)) 
	 

	--- Insert into new values -----
 	INSERT INTO dbo.[ValuationRequestApproverLevel] (ValuationRequestId, ValuationQuotationId, ApproverId, ApproverLevelId, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate)
	SELECT @ValReqId, vt.ValQId, v.ApproverId, v.ApproverLevelId, @CreatedBy, @dt, @CreatedBy, @dt
	FROM @Val v  
	OUTER APPLY (SELECT t.ValQId FROM @ValQ t) vt
	OUTER APPLY (SELECT TOP 1 v1.* FROM [ValuationRequestApproverLevel] v1 
				   WHERE v1.[ApproverLevelId] = v.[ApproverLevelId] 
					AND  v1.ApproverId = v.ApproverId
					AND  v1.ValuationRequestId = @ValReqId 
					AND  v1.ValuationQuotationId = vt.ValQId
			   ) vq
	WHERE vt.ValQId IS NOT NULL AND vq.Id IS NULL
END 

GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequestStatus_AllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
--exec usp_ValuationRequestStatus_AllList @RoleId=4,@Action='Add' 
--exec usp_ValuationRequestStatus_AllList   @RoleId=4,@Action='Edit', @ValReqId=67
CREATE PROCEDURE [dbo].[usp_ValuationRequestStatus_AllList]  
    @RoleId INT = 0,      @Action VARCHAR(10) = NULL,    @ValReqId INT = NULLAS  BEGIN      SET NOCOUNT ON;        IF @RoleId = 2 OR @RoleId = 3      BEGIN          SELECT Id, Status          FROM Master_ValuationStatus          WHERE ISNULL(IsActive, 0) = 1            AND Status IN ('Approved', 'Rejected');      END      ELSE IF @RoleId = 4      BEGIN          -- Check if @Action is Add and return only 'New'          IF @Action = 'Add'          BEGIN              SELECT Id, vs.[Status]   [StatusName]            FROM Master_ValuationStatus vs              WHERE ISNULL(IsActive, 0) = 1                AND Status = 'New';          END          ELSE          BEGIN              -- Check if @ValReqId is provided and not equal to 0            IF @ValReqId IS NOT NULL AND @ValReqId <> 0 and @RoleId!=4            BEGIN                -- Return StatusId and Status for the specified ValReqId                SELECT vrs.Id, vrs.[Status]   [StatusName]                FROM Master_ValuationStatus vrs				inner join ValuationRequest VR on vrs.Id=VR.StatusId                WHERE VR.Id = @ValReqId                  AND ISNULL(vrs.IsActive, 0) = 1;            END            ELSE            BEGIN                -- Return all statuses for @RoleId = 4 and other actions                SELECT Id, vrs.[Status]   [StatusName]                  FROM Master_ValuationStatus vrs                 WHERE ISNULL(IsActive, 0) = 1;            END        END      END      ELSE      BEGIN          -- Handle other RoleIds here or specify the desired behavior                 SELECT Id, vrs.[Status]   [StatusName]            FROM Master_ValuationStatus vrs          WHERE 1 = 0; -- This will return an empty result set      END        SET NOCOUNT OFF;  END  
GO
/****** Object:  StoredProcedure [dbo].[usp_ValuationRequestStatusList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec usp_ValuationRequestStatus_AllList @RoleId=4,@Action='Add' [dbo].[usp_ValuationRequestStatusList]
--exec usp_ValuationRequestStatus_AllList   @RoleId=4,@Action='Add', @ValReqId=0
CREATE   PROCEDURE [dbo].[usp_ValuationRequestStatusList]

  @RoleId INT = 0,      @Action VARCHAR(10) = NULL,    @ValReqId INT = NULLAS  BEGIN      SET NOCOUNT ON;        IF @RoleId = 2 OR @RoleId = 3      BEGIN          SELECT Id, Status          FROM Master_ValuationStatus          WHERE ISNULL(IsActive, 0) = 1            AND Status IN ('Approved', 'Rejected');      END      ELSE IF @RoleId = 4      BEGIN          -- Check if @Action is Add and return only 'New'          IF @Action = 'Add'          BEGIN              SELECT Id, vs.[Status]   [StatusName]            FROM Master_ValuationStatus vs              WHERE ISNULL(IsActive, 0) = 1                AND Status = 'New';          END          ELSE          BEGIN              -- Check if @ValReqId is provided and not equal to 0            IF @ValReqId IS NOT NULL AND @ValReqId <> 0 and @RoleId!=4            BEGIN                -- Return StatusId and Status for the specified ValReqId                SELECT vrs.Id, vrs.[Status]   [StatusName]                FROM Master_ValuationStatus vrs				inner join ValuationRequest VR on vrs.Id=VR.StatusId                WHERE VR.Id = @ValReqId                  AND ISNULL(vrs.IsActive, 0) = 1;            END            ELSE            BEGIN                -- Return all statuses for @RoleId = 4 and other actions                SELECT Id, vrs.[Status]   [StatusName]                  FROM Master_ValuationStatus vrs                 WHERE ISNULL(IsActive, 0) = 1;            END        END      END      ELSE      BEGIN          -- Handle other RoleIds here or specify the desired behavior                 SELECT Id, vrs.[Status]   [StatusName]            FROM Master_ValuationStatus vrs          WHERE 1 = 0; -- This will return an empty result set      END        SET NOCOUNT OFF;  END  
GO
/****** Object:  StoredProcedure [dbo].[usp_Valution_GetValuationList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

-- exec usp_Vendor_Search_GetVendorList @SearchText = '', @PageSize = 10, @CurrentPageNumber = 0
CREATE PROCEDURE [dbo].[usp_Vendor_Search_GetVendorList]          
(
@CurrentPageNumber INT = 0,            
@PageSize INT = 25,            
@SortColumn VARCHAR(100) = 'Id',            
@SortDirection VARCHAR(5) = 'Desc',            
@SearchText VARCHAR(MAX) =''
)        
AS          
BEGIN    

SET NOCOUNT ON;
Set @SearchText = IsNull(@SearchText, '')

SELECT * from (
SELECT COUNT(V.[Id]) OVER() TotalRecord,ROW_NUMBER() OVER (ORDER BY V.Id ASC) TotalFilterCount,
V.Id , V.CompanyName,V.EstimattionDate,V.BusinessType, V.CompanyDescription, 
 ISNULL(V.Status,0) AS [Status]
FROM [dbo].[Master_Vendor] V 

 WHERE   
(CompanyName LIKE '%' + @SearchText + '%'       
OR BusinessType LIKE '%' + @SearchText + '%'
OR CompanyDescription LIKE '%' + @SearchText + '%')
AND ISNULL(V.IsDeleted, 0) = 0
) Res

WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize  

ORDER BY 
CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Id' THEN  Id  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Id' THEN  Id  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'CompanyName' THEN  CompanyName  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'CompanyName' THEN  CompanyName  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'EstimattionDate' THEN  CAST(EstimattionDate AS varchar)  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'EstimattionDate' THEN  CAST(EstimattionDate AS varchar)  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'BusinessType' THEN  BusinessType  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'BusinessType' THEN  BusinessType  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'Status' THEN  Status  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'Status' THEN  Status  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'CompanyDescription' THEN  CompanyDescription  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'CompanyDescription' THEN  CompanyDescription  END ASC

SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [dbo].[usp_Vendor_SearchAllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec [dbo].[usp_Vendor_SearchAllList] @VendorId = 0,@PageNumber=1,@PageSize =20,@OrderClause='Id',@ReverseSort=0,@Letter=''
CREATE PROCEDURE [dbo].[usp_Vendor_SearchAllList]          
(
@VendorId INT = 0,
@PageNumber INT = 1,            
@PageSize INT = 25,            
@OrderClause VARCHAR(100) = 'VendorName',            
@ReverseSort INT = 0,            
@Letter VARCHAR(MAX) =null
)        
AS          
BEGIN    

SET NOCOUNT ON;

Set @Letter = IsNull(@Letter, '')

DECLARE @t TABLE(Id INT, VendorName VARCHAR(250), CompanyName VARCHAR(250),EstimattionDate DATETIME,BusinessTypeId INT,CompanyDescription VARCHAR(250),
[Status] INT,Address1 VARCHAR(250),Address2 VARCHAR(250),Address3 VARCHAR(250),CountryName VARCHAR(250),StateName VARCHAR(250),CityName VARCHAR(250),
Email VARCHAR(100), Mobile VARCHAR(250),ContactPersonName VARCHAR(250), CreatedBy INT);

DECLARE @t1 TABLE(Id INT, VendorName VARCHAR(250), CompanyName VARCHAR(250),EstimattionDate DATETIME,BusinessTypeId INT,CompanyDescription VARCHAR(250),
[Status] INT,Address1 VARCHAR(250),Address2 VARCHAR(250),Address3 VARCHAR(250),CountryName VARCHAR(250),StateName VARCHAR(250),CityName VARCHAR(250),
Email VARCHAR(100), Mobile VARCHAR(250),ContactPersonName VARCHAR(250), CreatedBy INT);

insert into @t1
SELECT V.Id, V.VendorName,V.CompanyName,V.EstimattionDate,V.BusinessType,V.CompanyDescription,V.[Status],A.Address1,
A.Address2,A.Address3,CT.CountryName,ST.StateName,CY.CityName,C.Email,C.Mobile,C.ContactPersonName, V.CreatedBy
FROM [dbo].[Master_Vendor] V 
INNER JOIN Master_Address A ON V.Id=A.TableKeyId AND A.TableName='Master_User'
INNER JOIN Master_Country CT ON A.CountryId=CT.Id
INNER JOIN Master_State ST ON A.StateId=ST.Id
INNER JOIN Master_City CY ON A.CityId=CY.Id
INNER JOIN Master_Contact C ON V.Id=C.TableKeyId AND C.TableName='Master_User'
where V.VendorName  LIKE  '%' + @Letter + '%' AND ISNULL(V.IsDeleted, 0) = 0

insert into @t
select * from @t1
order By
VendorName ASC
OFFSET @PageSize * (@PageNumber - 1) ROWS
FETCH NEXT @PageSize ROWS ONLY

SELECT COUNT(1) TotalRecords FROM @t1
SELECT * FROM @t;   
 
SET NOCOUNT OFF;
         
END 
GO
/****** Object:  StoredProcedure [eltizam_dbUser].[GetLogDetailsByFilters]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec GetLogDetailsByFilters   @CurrentPageNumber=1, @PageSize =1, @TableName='MasterClient',@DateFrom=null,@DateTo=null
CREATE   PROCEDURE [eltizam_dbUser].[GetLogDetailsByFilters]
    @CurrentPageNumber INT = 0,            
    @PageSize INT = 1000,            
    @SortColumn VARCHAR(100) = 'Id',            
    @SortDirection VARCHAR(5) = 'ASC',            
    @SearchText VARCHAR(MAX) ='',
    @TableName NVARCHAR(MAX) = NULL,
    @Id INT = NULL,
    @TableKey INT = NULL,
    @DateFrom DATETIME = NULL,
    @DateTo DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;
	SELECT * FROM 
	(
    	SELECT COUNT(al.[Id]) OVER() TotalRecord, ROW_NUMBER() OVER (ORDER BY al.Id ASC) TotalFilterCount,

        al.ActionType,
        al.ParentTableKeyId,
        al.ParentTableName,
        al.TableKeyId,
        al.TableName,
        al.Id,
        al.CreatedBy,
        al.CreatedDate,
        CreatedDateFormatted = CONVERT(NVARCHAR(MAX), al.CreatedDate, 120), -- Format date and time
        CreatedByName = ISNULL(u.FirstName + ' ' + u.LastName, ''), -- Use ISNULL to handle null user
        AuditLogListData.PropertyName,
        AuditLogListData.OldValue,
        AuditLogListData.NewValue
        
    FROM
        Master_AuditLog al
    LEFT JOIN
        Master_User u ON al.CreatedBy = u.Id
    OUTER APPLY
        OPENJSON(al.Log) WITH (
            PropertyName NVARCHAR(MAX) '$.PropertyName',
            OldValue NVARCHAR(MAX) '$.OldValue',
            NewValue NVARCHAR(MAX) '$.NewValue'
        ) AS AuditLogListData 
				) Res


    WHERE TotalFilterCount BETWEEN (@CurrentPageNumber) + 1  AND (@CurrentPageNumber) + @PageSize 
	And
        (@TableName IS NULL OR TableName = @TableName)
        AND (@TableKey IS NULL OR (ParentTableKeyId = @TableKey OR TableKeyId = @TableKey))
        AND (@DateFrom IS NULL OR CreatedDate >= @DateFrom)
        AND (@DateTo IS NULL OR CreatedDate <= @DateTo)
        AND (@Id IS NULL OR Id = @Id)

		ORDER BY 
			
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'TableName' THEN  TableName  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'TableName' THEN  TableName  END ASC,
			CASE WHEN @SortDirection = 'DESC' AND @SortColumn = 'ActionType' THEN  ActionType  END DESC,
			CASE WHEN @SortDirection = 'ASC'  AND @SortColumn = 'ActionType' THEN  ActionType  END ASC
		 

 
   

END
GO
/****** Object:  StoredProcedure [eltizam_dbUser].[GetLogDetailsByFiltersTest]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec GetLogDetailsByFiltersTest @TableName='MasterClient'
CREATE PROCEDURE [eltizam_dbUser].[GetLogDetailsByFiltersTest]
    @CurrentPageNumber INT = 0,            
@PageSize INT = 10,            
@SortColumn VARCHAR(100) = 'Id',            
@SortDirection VARCHAR(5) = 'ASC',            
@SearchText VARCHAR(MAX) ='',
    @TableName NVARCHAR(MAX) = NULL,
    @Id INT = NULL,
    @TableKey INT = NULL,
    @DateFrom DATETIME = NULL,
    @DateTo DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        al.ActionType,
        al.ParentTableKeyId,
        al.ParentTableName,
        al.TableKeyId,
        al.TableName,
        al.Id,
        al.CreatedBy,
        al.CreatedDate,
        CreatedDateFormatted = CONVERT(NVARCHAR(MAX), al.CreatedDate, 120), -- Format date and time
        CreatedByName = ISNULL(u.FirstName + ' ' + u.LastName, ''), -- Use ISNULL to handle null user
        AuditLogListData = JSON_QUERY(al.Log), -- Log column is JSON
		TotalRecord = COUNT(*) OVER (), -- Total count of records
		  TotalFilterCount = COUNT(*) OVER () -- Total count of filtered records
   
    FROM
        Master_AuditLog al
    LEFT JOIN
        Master_User u ON al.CreatedBy = u.Id
    --WHERE
    --    (@TableName IS NULL OR (al.ParentTableName = @TableName OR al.TableName = @TableName))
    --    AND (@TableKey IS NULL OR (al.ParentTableKeyId = @TableKey OR al.TableKeyId = @TableKey))
    --    AND (@DateFrom IS NULL OR al.CreatedDate >= @DateFrom)
    --    AND (@DateTo IS NULL OR al.CreatedDate <= @DateTo)
    --    AND (@Id IS NULL OR al.Id = @Id);
        
    WHERE
    (@TableName IS NULL OR al.TableName = @TableName)
    AND (@TableKey IS NULL OR (al.ParentTableKeyId = @TableKey OR al.TableKeyId = @TableKey))
    AND (@DateFrom IS NULL OR al.CreatedDate >= @DateFrom)
    AND (@DateTo IS NULL OR al.CreatedDate <= @DateTo)
    AND (@Id IS NULL OR al.Id = @Id);


    SET NOCOUNT OFF;
END



GO
/****** Object:  StoredProcedure [eltizam_dbUser].[GetLogDetailsByFilterstest2]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [eltizam_dbUser].[GetLogDetailsByFilterstest2]
    @CurrentPageNumber INT = 0,            
    @PageSize INT = 10,            
    @SortColumn VARCHAR(100) = 'Id',            
    @SortDirection VARCHAR(5) = 'ASC',            
    @SearchText VARCHAR(MAX) ='',
    @TableName NVARCHAR(MAX) = NULL,
    @Id INT = NULL,
    @TableKey INT = NULL,
    @DateFrom DATETIME = NULL,
    @DateTo DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        al.ActionType,
        al.ParentTableKeyId,
        al.ParentTableName,
        al.TableKeyId,
        al.TableName,
        al.Id,
        al.CreatedBy,
        al.CreatedDate,
        CreatedDateFormatted = CONVERT(NVARCHAR(MAX), al.CreatedDate, 120), -- Format date and time
        CreatedByName = ISNULL(u.FirstName + ' ' + u.LastName, ''), -- Use ISNULL to handle null user
        AuditLogListData.PropertyName,
        AuditLogListData.OldValue,
        AuditLogListData.NewValue,
        TotalRecord = COUNT(*) OVER (), -- Total count of records
        TotalFilterCount = COUNT(*) OVER () -- Total count of filtered records
    FROM
        Master_AuditLog al
    LEFT JOIN
        Master_User u ON al.CreatedBy = u.Id
    OUTER APPLY
        OPENJSON(al.Log) WITH (
            PropertyName NVARCHAR(MAX) '$.PropertyName',
            OldValue NVARCHAR(MAX) '$.OldValue',
            NewValue NVARCHAR(MAX) '$.NewValue'
        ) AS AuditLogListData
    WHERE
        (@TableName IS NULL OR al.TableName = @TableName)
        AND (@TableKey IS NULL OR (al.ParentTableKeyId = @TableKey OR al.TableKeyId = @TableKey))
        AND (@DateFrom IS NULL OR al.CreatedDate >= @DateFrom)
        AND (@DateTo IS NULL OR al.CreatedDate <= @DateTo)
        AND (@Id IS NULL OR al.Id = @Id);

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [eltizam_dbUser].[GetToEmailsNotification]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [eltizam_dbUser].[GetToEmailsNotification]
    @Action NVARCHAR(100),
    @ValiadtionRequestId NVARCHAR(100)
AS
BEGIN
    DECLARE @Emails NVARCHAR(MAX)

    SET @Emails = 'vishramsawant75@gmail.com,' + 'ravi.sudhir@neosoftmail.com'
   
    SELECT @Emails AS CommaSeparatedEmails
END
GO
/****** Object:  StoredProcedure [eltizam_dbUser].[usp_ApproverLevel_AllList]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [eltizam_dbUser].[usp_ApproverLevel_AllList]
AS
BEGIN
	SELECT Id, Description FROM Master_ValuationRequestApproverLevel WHERE IsActive=1;

END
GO
/****** Object:  StoredProcedure [eltizam_dbUser].[usp_GetToEmailsNotification]    Script Date: 1/3/2024 11:34:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec usp_GetToEmailsNotification '', ''
CREATE   PROCEDURE [eltizam_dbUser].[usp_GetToEmailsNotification]
    @Action NVARCHAR(100),
    @ValiadtionRequestId INT
AS
BEGIN
    DECLARE @Emails NVARCHAR(MAX)

    SET @Emails = 'vishramsawant75@gmail.com'
   
    SELECT @Emails AS ToEmailList
END
GO
