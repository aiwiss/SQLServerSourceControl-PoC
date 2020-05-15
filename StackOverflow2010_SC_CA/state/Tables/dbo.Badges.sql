CREATE TABLE [dbo].[Badges]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UserId] [int] NOT NULL,
[Date] [datetime] NOT NULL,
[NewColumn] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewColumn2] [nchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Badges] ADD CONSTRAINT [PK_Badges__Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
