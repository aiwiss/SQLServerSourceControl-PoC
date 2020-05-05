CREATE TABLE [dbo].[Users]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[AboutMe] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Age] [int] NULL,
[CreationDate] [datetime] NOT NULL,
[DisplayName] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DownVotes] [int] NOT NULL,
[EmailHash] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastAccessDate] [datetime] NOT NULL,
[Location] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reputation] [int] NOT NULL,
[UpVotes] [int] NOT NULL,
[Views] [int] NOT NULL,
[WebsiteUrl] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountId] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK_Users_Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
