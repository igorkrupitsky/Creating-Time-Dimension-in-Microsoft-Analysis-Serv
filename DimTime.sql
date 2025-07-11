USE [DW_DATAMART]
GO
/****** Object:  Table [dbo].[DimTime]    Script Date: 04/08/2008 14:55:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimTime](
	[DimTimeKey] [int] NOT NULL,
	[Time] [varchar](50) NOT NULL,
	[Time24] [varchar](50) NOT NULL,
	[Hour] [tinyint] NOT NULL,
	[HourName] [varchar](10) NOT NULL,
	[Minute] [tinyint] NOT NULL,
	[MinuteKey] [int] NOT NULL,
	[MinuteName] [varchar](20) NOT NULL,
	[Second] [tinyint] NOT NULL,
	[Hour24] [tinyint] NOT NULL,
	[AM] [char](2) NOT NULL,
 CONSTRAINT [PK_DimTime] PRIMARY KEY CLUSTERED 
(
	[DimTimeKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF