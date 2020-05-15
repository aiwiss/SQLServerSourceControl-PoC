CREATE TABLE [dbo].[VoteTypes]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VoteTypes] ADD CONSTRAINT [PK_VoteType__Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
