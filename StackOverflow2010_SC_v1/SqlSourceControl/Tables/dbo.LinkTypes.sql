CREATE TABLE [dbo].[LinkTypes]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Type] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LinkTypes] ADD CONSTRAINT [PK_LinkTypes__Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
