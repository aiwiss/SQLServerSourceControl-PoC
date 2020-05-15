CREATE TABLE [dbo].[Comments]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[CreationDate] [datetime] NOT NULL,
[PostId] [int] NOT NULL,
[Score] [int] NULL,
[Text] [nvarchar] (700) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UserId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD CONSTRAINT [PK_Comments__Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
