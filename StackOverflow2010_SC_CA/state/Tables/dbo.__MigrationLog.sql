CREATE TABLE [dbo].[__MigrationLog]
(
[migration_id] [uniqueidentifier] NOT NULL,
[script_checksum] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[script_filename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[complete_dt] [datetime2] NOT NULL,
[applied_by] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[deployed] [tinyint] NOT NULL CONSTRAINT [DF___MigrationLog_deployed] DEFAULT ((1)),
[version] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[package_version] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[release_version] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sequence_no] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[__MigrationLog] ADD CONSTRAINT [PK___MigrationLog] PRIMARY KEY CLUSTERED  ([migration_id], [complete_dt], [script_checksum]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX___MigrationLog_CompleteDt] ON [dbo].[__MigrationLog] ([complete_dt]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UX___MigrationLog_SequenceNo] ON [dbo].[__MigrationLog] ([sequence_no]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX___MigrationLog_Version] ON [dbo].[__MigrationLog] ([version]) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'This table is required by SQL Change Automation projects to keep track of which migrations have been executed during deployment. Please do not alter or remove this table from the database.', 'SCHEMA', N'dbo', 'TABLE', N'__MigrationLog', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The executing user at the time of deployment (populated using the SYSTEM_USER function).', 'SCHEMA', N'dbo', 'TABLE', N'__MigrationLog', 'COLUMN', N'applied_by'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The date/time that the migration finished executing. This value is populated using the SYSDATETIME function.', 'SCHEMA', N'dbo', 'TABLE', N'__MigrationLog', 'COLUMN', N'complete_dt'
GO
EXEC sp_addextendedproperty N'MS_Description', N'This column contains a number of potential states:

0 - Marked As Deployed: The migration was not executed.
1- Deployed: The migration was executed successfully.
2- Imported: The migration was generated by importing from this DB.

"Marked As Deployed" and "Imported" are similar in that the migration was not executed on this database; it was was only marked as such to prevent it from executing during subsequent deployments.', 'SCHEMA', N'dbo', 'TABLE', N'__MigrationLog', 'COLUMN', N'deployed'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique identifier of a migration script file. This value is stored within the <Migration /> Xml fragment within the header of the file itself.

Note that it is possible for this value to repeat in the [__MigrationLog] table. In the case of programmable object scripts, a record will be inserted with a particular ID each time a change is made to the source file and subsequently deployed.

In the case of a migration, you may see the same [migration_id] repeated, but only in the scenario where the "Mark As Deployed" button/command has been run.', 'SCHEMA', N'dbo', 'TABLE', N'__MigrationLog', 'COLUMN', N'migration_id'
GO
EXEC sp_addextendedproperty N'MS_Description', N'If you have enabled SQLCMD Packaging in your SQL Change Automation project, or if you are using Octopus Deploy, this will be the version number that your database package was stamped with at build-time.', 'SCHEMA', N'dbo', 'TABLE', N'__MigrationLog', 'COLUMN', N'package_version'
GO
EXEC sp_addextendedproperty N'MS_Description', N'If you are using Octopus Deploy, you can use the value in this column to look-up which release was responsible for deploying this migration.
If deploying via PowerShell, set the $ReleaseVersion variable to populate this column.
If deploying via Visual Studio, this column will always be NULL.', 'SCHEMA', N'dbo', 'TABLE', N'__MigrationLog', 'COLUMN', N'release_version'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A SHA256 representation of the migration script file at the time of build.  This value is used to determine whether a migration has been changed since it was deployed. In the case of a programmable object script, a different checksum will cause the migration to be redeployed.
Note: if any variables have been specified as part of a deployment, this will not affect the checksum value.', 'SCHEMA', N'dbo', 'TABLE', N'__MigrationLog', 'COLUMN', N'script_checksum'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the migration script file on disk, at the time of build.
If Semantic Versioning has been enabled, then this value will contain the full relative path from the root of the project folder. If it is not enabled, then it will simply contain the filename itself.', 'SCHEMA', N'dbo', 'TABLE', N'__MigrationLog', 'COLUMN', N'script_filename'
GO
EXEC sp_addextendedproperty N'MS_Description', N'An auto-seeded numeric identifier that can be used to determine the order in which migrations were deployed.', 'SCHEMA', N'dbo', 'TABLE', N'__MigrationLog', 'COLUMN', N'sequence_no'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The semantic version that this migration was created under. In SQL Change Automation projects, a folder can be given a version number, e.g. 1.0.0, and one or more migration scripts can be stored within that folder to provide logical grouping of related database changes.', 'SCHEMA', N'dbo', 'TABLE', N'__MigrationLog', 'COLUMN', N'version'
GO
