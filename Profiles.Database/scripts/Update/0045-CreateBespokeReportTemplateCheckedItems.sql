IF NOT EXISTS (SELECT * FROM sys.objects 
WHERE object_id = OBJECT_ID(N'[dbo].[BespokeReportTemplateCheckedItems]') AND type in (N'U'))

BEGIN

CREATE TABLE [dbo].[BespokeReportTemplateCheckedItems](
	[BespokeReportTemplateId] [uniqueidentifier] NOT NULL,
	[CheckedId] [nvarchar](200) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_BespokeReportTemplateCheckedItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[BespokeReportTemplateCheckedItems] ADD  CONSTRAINT [DF_BespokeReportTemplateCheckedItems_Id]  DEFAULT (newid()) FOR [Id]

ALTER TABLE [dbo].[BespokeReportTemplateCheckedItems]  WITH NOCHECK ADD  CONSTRAINT [FK_BespokeReportTemplateCheckedItems_BespokeReportTemplate] FOREIGN KEY([BespokeReportTemplateId])
REFERENCES [dbo].[BespokeReportTemplate] ([Id])


ALTER TABLE [dbo].[BespokeReportTemplateCheckedItems] CHECK CONSTRAINT [FK_BespokeReportTemplateCheckedItems_BespokeReportTemplate]

END