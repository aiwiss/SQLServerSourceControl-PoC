-- <Migration ID="40e2ec3f-e742-40d0-94a4-15afec88f300" />
GO

PRINT N'Altering [dbo].[Badges]'
GO
ALTER TABLE [dbo].[Badges] ADD
[NewColumn2] [nchar] (10) NULL
GO
