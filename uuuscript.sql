
CREATE TABLE [dbo].[ApprovedInstitutes](
	[Serial] [int] IDENTITY(1,1) NOT NULL,
	[InstituteID] [nvarchar](30) NOT NULL,
	[InstituteName] [nvarchar](max) NULL,
	[AffiliationUniversity] [nvarchar](max) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](150) NULL,
	[Contact] [numeric](15, 0) NULL,
	[AffiliationDate] [nvarchar](30) NULL,
	[InstituteType] [nvarchar](10) NOT NULL,
	[Established] [int] NULL,
	[twof] [int] NULL,
	[twelveb] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InstituteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FakeReports](
	[Serial] [int] IDENTITY(1,1) NOT NULL,
	[FakeInstituteID] [nvarchar](20) NULL,
	[FakeInstituteName] [nvarchar](100) NULL,
	[MessageBody] [nvarchar](max) NULL,
	[ReportTime] [nvarchar](max) NULL,
	[ReportType] [int] NULL,
	[ReportsCount] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InstituteAdmins]    Script Date: 4/23/2017 1:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstituteAdmins](
	[Serial] [int] IDENTITY(1,1) NOT NULL,
	[InstituteID] [nvarchar](30) NULL,
	[PassPhrase] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InstituteProgrammeMapping]    Script Date: 4/23/2017 1:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstituteProgrammeMapping](
	[Serial] [int] IDENTITY(1,1) NOT NULL,
	[InstituteID] [nvarchar](30) NULL,
	[ProgrammeCode] [nvarchar](50) NULL,
	[DateStarted] [nvarchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InstitutesDetails]    Script Date: 4/23/2017 1:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstitutesDetails](
	[Serial] [int] IDENTITY(1,1) NOT NULL,
	[InstituteID] [nvarchar](30) NOT NULL,
	[LogoImage] [nvarchar](max) NULL,
	[Website] [nvarchar](100) NULL,
	[AlternateContact] [nvarchar](20) NULL,
	[AlternateEmail] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[InstituteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentsDataDump]    Script Date: 4/23/2017 1:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsDataDump](
	[Serial] [int] IDENTITY(1,1) NOT NULL,
	[DegreeCode] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[FathersName] [nvarchar](max) NULL,
	[DateOfBirth] [nvarchar](max) NULL,
	[ProgramCode] [nvarchar](50) NULL,
	[YearStarted] [numeric](4, 0) NULL,
	[YearCompleted] [numeric](4, 0) NULL,
	[DivisionSecured] [nvarchar](10) NULL,
	[Contact] [numeric](20, 0) NULL,
	[Address] [nvarchar](max) NULL,
	[Photo] [nvarchar](max) NULL,
	[InstituteID] [nvarchar](30) NULL,
	[DegreeApprovedDate] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DegreeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UGCAdmins]    Script Date: 4/23/2017 1:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UGCAdmins](
	[Serial] [int] IDENTITY(1,1) NOT NULL,
	[PassPhrase] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UGCInbox]    Script Date: 4/23/2017 1:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UGCInbox](
	[Serial] [int] IDENTITY(24000,1) NOT NULL,
	[InstituteID] [nvarchar](50) NULL,
	[Subject] [int] NULL,
	[MessageBody] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UGCProgrammes]    Script Date: 4/23/2017 1:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UGCProgrammes](
	[Serial] [int] IDENTITY(1,1) NOT NULL,
	[ProgrammeCode] [nvarchar](50) NOT NULL,
	[ProgrammeName] [nvarchar](200) NULL,
	[UGC_StartDate] [nvarchar](100) NULL,
	[Duration] [int] NULL,
	[ProgrammeType] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProgrammeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[InstituteAdmins]  WITH CHECK ADD FOREIGN KEY([InstituteID])
REFERENCES [dbo].[ApprovedInstitutes] ([InstituteID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InstituteProgrammeMapping]  WITH NOCHECK ADD FOREIGN KEY([InstituteID])
REFERENCES [dbo].[ApprovedInstitutes] ([InstituteID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InstitutesDetails]  WITH NOCHECK ADD FOREIGN KEY([InstituteID])
REFERENCES [dbo].[ApprovedInstitutes] ([InstituteID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentsDataDump]  WITH CHECK ADD FOREIGN KEY([InstituteID])
REFERENCES [dbo].[ApprovedInstitutes] ([InstituteID])
GO
ALTER TABLE [dbo].[StudentsDataDump]  WITH NOCHECK ADD FOREIGN KEY([InstituteID])
REFERENCES [dbo].[ApprovedInstitutes] ([InstituteID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentsDataDump]  WITH CHECK ADD FOREIGN KEY([ProgramCode])
REFERENCES [dbo].[UGCProgrammes] ([ProgrammeCode])
GO
/****** Object:  StoredProcedure [dbo].[AddNewDegree]    Script Date: 4/23/2017 1:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[AddNewDegree] @DegreeCode nvarchar(50),@Name nvarchar(max),@FathersName nvarchar(max),@DOB nvarchar(max),@ProgrammeCode nvarchar(50),@YearStarted numeric(4),@YearCompleted numeric(4),@Division nvarchar(10),@Contact numeric(20),@Address nvarchar(max),@Photo nvarchar(max),@InstituteID nvarchar(30),@DegreeDate nvarchar(50)
as 
insert into StudentsDataDump values(@DegreeCode ,@Name ,@FathersName ,@DOB,@ProgrammeCode ,@YearStarted ,@YearCompleted ,@Division ,@Contact ,@Address ,@Photo ,@InstituteID ,@DegreeDate)


GO
/****** Object:  StoredProcedure [dbo].[AddNewInstitute]    Script Date: 4/23/2017 1:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--sp_columns 'ApprovedInstitutes'
create proc [dbo].[AddNewInstitute] 
@InstituteID nvarchar(30), @InstituteName nvarchar(max),@AffUni nvarchar(max),@City nvarchar(50),@State nvarchar(50),@Address nvarchar(max),@Email nvarchar(150),@Contact nvarchar(20),@AffDate nvarchar(20),@InstiType nvarchar(10), @Established int,@twof int,@twelveb int
as
 insert into ApprovedInstitutes values(@InstituteID,@InstituteName,@AffUni,@City,@State,@Address,@Email,@Contact,@AffDate,@InstiType,@Established,@twof,@twelveb)






GO
/****** Object:  StoredProcedure [dbo].[ShowProgrammesOf]    Script Date: 4/23/2017 1:55:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[ShowProgrammesOf] @InstituteID nvarchar(50) as 
begin
select b.ProgrammeCode,b.ProgrammeName,b.ProgrammeType,a.DateStarted as DateApproved from InstituteProgrammeMapping a inner join UGCProgrammes b on a.ProgrammeCode=b.ProgrammeCode where InstituteID=@InstituteID
end



GO
USE [master]
GO
ALTER DATABASE [UISDB] SET  READ_WRITE 
GO
