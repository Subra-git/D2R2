
    INSERT INTO [luDataFieldType]
    (
      [Id],
      [Name],
      [SqlType]
    )
    VALUES
    (
      '993C0A2C-8EF4-4BDA-9F21-3867EF2CA825',
      'Percentage',
      'tinyint'
      )
    
    INSERT INTO [luDataFieldType]
    (
      [Id],
      [Name],
      [SqlType]
    )
    VALUES
    (
      'B1A35FAB-D4CF-4797-8F81-474892DA5251',
      'Boolean',
      'bit'
      )
    
    INSERT INTO [luDataFieldType]
    (
      [Id],
      [Name],
      [SqlType]
    )
    VALUES
    (
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      'List',
      'uniqueidentifier'
      )
    
    INSERT INTO [luDataFieldType]
    (
      [Id],
      [Name],
      [SqlType]
    )
    VALUES
    (
      '2F23C12A-4CB3-41B1-915C-7A8A70E99C7E',
      'Integer',
      'int'
      )
    
    INSERT INTO [luDataFieldType]
    (
      [Id],
      [Name],
      [SqlType]
    )
    VALUES
    (
      'C7698CDD-BA52-4635-9C1D-8D69609E5716',
      'Decimal',
      'money'
      )
    
    INSERT INTO [luDataFieldType]
    (
      [Id],
      [Name],
      [SqlType]
    )
    VALUES
    (
      '18D206DE-4C28-4736-97DE-9054FF8A081E',
      'Date',
      'datetime'
      )
    
    INSERT INTO [luDataFieldType]
    (
      [Id],
      [Name],
      [SqlType]
    )
    VALUES
    (
      'D297F63B-638A-4574-B042-97C248338A26',
      'Long Text',
      'text'
      )
    
    INSERT INTO [luDataFieldType]
    (
      [Id],
      [Name],
      [SqlType]
    )
    VALUES
    (
      '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
      'Multi Value List',
      'uniqueidentifier'
      )
    
    INSERT INTO [luDataFieldType]
    (
      [Id],
      [Name],
      [SqlType]
    )
    VALUES
    (
      'F2280EEE-9A0D-4B9D-8650-BF7BD264D086',
      'URL',
      'varchar(200)'
      )
    
    INSERT INTO [luDataFieldType]
    (
      [Id],
      [Name],
      [SqlType]
    )
    VALUES
    (
      'EC6D59BF-5BFA-4BFC-94CD-C929E2E313C0',
      'Text',
      'varchar(255)'
      )
    
    INSERT INTO [luDataFieldType]
    (
      [Id],
      [Name],
      [SqlType]
    )
    VALUES
    (
      '8452BD52-BC9F-495C-9F60-F423931E2072',
      'Currency',
      'money'
      )
    
      INSERT INTO [luProfileUserRole]
      (
      [Id],
      [Name],
      [IsContributor]
      )
      VALUES
      (
      'BD2DBD9C-BA9E-471B-967E-46C589F3A32F',
      'Technical reviewer',
      0
      )
    
      INSERT INTO [luProfileUserRole]
      (
      [Id],
      [Name],
      [IsContributor]
      )
      VALUES
      (
      'E0EC32DD-EAB8-4789-B692-62EFF2E21530',
      'Policy author',
      1
      )
    
      INSERT INTO [luProfileUserRole]
      (
      [Id],
      [Name],
      [IsContributor]
      )
      VALUES
      (
      'FB862AE9-ED89-4B6B-826C-6565C25219B5',
      'Policy reviewer',
      0
      )
    
      INSERT INTO [luProfileUserRole]
      (
      [Id],
      [Name],
      [IsContributor]
      )
      VALUES
      (
      '1F73C650-A8F2-432A-BC2A-78550D6652FF',
      'Technical author',
      1
      )
    
      INSERT INTO [luProfileVersionState]
      (
        [Id],
        [Name]
      )
      VALUES
      (
        '87E8CF8E-5769-4953-8F4F-01291AC6607C',
        'Published'
      )
    
      INSERT INTO [luProfileVersionState]
      (
        [Id],
        [Name]
      )
      VALUES
      (
        'FBDAF26D-F94F-467D-B524-E2D4B64F2AA0',
        'Draft'
      )
    
      INSERT INTO [luSectionReviewFrequency]
      (
      [Id],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
        '06788E48-149B-4B04-8EB6-40104E174E12',
        'Annually',
        3
      )
    
      INSERT INTO [luSectionReviewFrequency]
      (
      [Id],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
        'EEE5D6A5-327A-48B0-9FF8-7DA28DCE0FEB',
        'Every 6 months',
        2
      )
    
      INSERT INTO [luSectionReviewFrequency]
      (
      [Id],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
        '90D4AC32-2598-49B5-A3A8-9F1A5F854ED7',
        'Every 2 years',
        4
      )
    
      INSERT INTO [luSectionReviewFrequency]
      (
      [Id],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
        '37481649-5986-47E8-B91D-BD73EBB479EB',
        'Quarterly',
        1
      )
    
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      'A17946FE-1FFB-4E2E-9E3B-0284B6F5D168',
      
          'Impact on wider society and stakeholder groups'
        ,
      'Wider Society',
      6
      )
    
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      '158F8D0C-15A7-4F31-98FC-0C06196045D5',
      
          'Qualitative risk analysis: risk scenarios'
        ,
      'Risk',
      9
      )
    
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      
          'Human health implications'
        ,
      'Human Health',
      5
      )
    
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      '2F451B2B-7D6D-4DFF-8D22-73F133848634',
      
          'International trade'
        ,
      'International Trade',
      11
      )
    
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      'C90FBBAD-BE8D-4317-BF7C-7A56B45B2828',
      
          'Current surveillance activities in the UK'
        ,
      'Surveillance',
      10
      )
    
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      '99F0EE93-3E56-455C-8666-B0C9EB581589',
      
          'Geographic distribution'
        ,
      'Geographic Distribution',
      2
      )
    
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      '404DD5D4-4447-4CAD-A0AB-C8F0DA284B49',
      
          'Animal welfare'
        ,
      'Animal Welfare',
      4
      )
    
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      '9BDAD251-9A9F-4A65-BFAB-D4A852526ABC',
      
          'Approach to control of this issue in animals in the UK'
        ,
      'Approach To Control',
      8
      )
    
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      
          'Epidemiology of animal infection'
        ,
      'Epidemiology',
      3
      )
    
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      'EBB3C892-C7B8-4F64-8F40-FA6D29BF51DE',
      
          'Legislation and other mandates'
        ,
      'Legislation And Mandates',
      7
      )
      
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      '1ED0595D-3E1A-49D4-B340-C0D41E17D045',
      
          'Summary'
        ,
      'Summary',
      1
      )
    
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      'B71A47FA-7E4A-4CBA-B91C-C0D778068ABC',
      
          'Opportunity to add value'
        ,
      'Opportunity To Add Value',
      12
      )


	INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      '164B8DA6-92BE-473B-B35C-585D72664E60',
      
          'Public and stakeholder perception'
        ,
      'Public And Stakeholder Perception',
      13
      )
    
      INSERT INTO [ProfileSection]
      (
      [Id],
      [Name],
      [ShortName],
      [SectionNumber]
      )
      VALUES
      (
      '809D2408-82A1-45E1-9692-5CA76162D967',
      
          'Areas of uncertainty'
        ,
      'Areas Of Uncertainty',
      14
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'd0086a85-e54b-4ca7-90e0-070915b76c3a',
      
          'Description'

      ,
      'Description',
      '1ed0595d-3e1a-49d4-b340-c0d41e17d045',
      1,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
      
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '602f2ca1-0db9-4e1c-a2b6-9bf708cb7ab0',
      
          'Affected species comments'

      ,
      'Affected Species Comments',
      '1ed0595d-3e1a-49d4-b340-c0d41e17d045',
      2,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
      
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '625eecf0-273d-410e-a251-d493cfbd54c4',
      
          'Revision history'

      ,
      'Revision History',
      '1ed0595d-3e1a-49d4-b340-c0d41e17d045',
      3,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
  
	INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'E15E60A1-639D-4FAC-9DFD-EA12E432CBC6',
      
          'Opportunity to add value summary'

      ,
      'Opportunity To Add Value Summary',
      'b71a47fa-7e4a-4cba-b91c-c0d778068abc',
      1,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
      
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '7CCE0546-D9C0-4AAE-9ADA-A601819036DE',
      
          'Public and stakeholder perception summary'

      ,
      'Public And Stakeholder Perception Summary',
      '164b8da6-92be-473b-b35c-585d72664e60',
      1,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
      
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'FD6AD7AC-5760-4652-9DDE-597CAEDEBD79',
      
          'FFG costs summary'

      ,
      'FFG Costs Summary',
      'a17946fe-1ffb-4e2e-9e3b-0284b6f5d168',
      8,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )

	INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '1D6EC9BC-76A9-4C7A-AEC8-DB3FB85F7DD1',
      
          'Areas of uncertainty summary'

      ,
      'Areas Of Uncertainty Summary',
      '809d2408-82a1-45e1-9692-5ca76162d967',
      1,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
      
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'C7BEF5CF-0A53-43B3-A6C4-03C86014E766',
      
          'Methods of transmission between animals in each species/group'

      ,
      'Transmission Mechanism',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      13,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '418F7B77-78E8-455D-A307-05DA702B16A4',
      
          'The level of human-animal (or products) interaction/exposure relating to each species/group'

      ,
      'Level Of Human Exposure To Animal Or Products',
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      2,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '9FBE8E95-D897-46BC-8E32-0689E4490358',
      
          'Pathological features that may be observed for this disease or issue in each species/group'

      ,
      'Pathological Features',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      8,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'D62C2D6C-D824-4E37-B744-072A7274D062',
      
          'Mechanisms of spread between premises'

      ,
      'Spread Mechanism',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      18,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '49C62B0D-93F4-4880-A6A0-072A804217A6',
      
          'Usual method(s) of confirmation of diagnosis in Great Britain'

      ,
      'Confirmation Of Diagnosis',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      12,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '67F93ED4-CB22-4E0E-8D36-0A06E76D0985',
      
          'Differential diagnoses in each species/group'

      ,
      'Differential Diagnoses',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      4,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'E3B69F62-BCAF-41F6-A68F-0AA6AD1DEB5E',
      
          'Definition of a confirmed case'

      ,
      'Confirmed Case Definition',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      3,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'B6BECBDB-CDFE-4695-BD5C-0BB72344C78A',
      
          'Modal severity of human disease in Great Britain'

      ,
      'Modal Severity Of Human Disease',
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      7,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '61E59EA4-AA92-484B-8151-0BBE0BA1BD7C',
      
          'Impact on freedom from pain or injury or disease in each species/group'

      ,
      'Freedom From Pain Or Injury',
      '404DD5D4-4447-4CAD-A0AB-C8F0DA284B49',
      4,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'F9AF0D5F-CE13-4FD9-A1AC-0DD894D6C56A',
      
          'Summary impact on human health of this infection/issue and the extent to which it is attributable to all animals and their products derived from Great Britain'

      ,
      'Impact On Human Health',
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      14,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'CB1DE3F4-FD98-46A2-BC82-12FC88D76EED',
      
          'Symptoms and clinical signs of human disease'

      ,
      'Symptoms Of Human Disease',
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      5,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '57C1057F-BDB0-4E86-B5E1-1D31A2F3B8C3',
      
          'Impact on the local environment'

      ,
      'Local Environment',
      'A17946FE-1FFB-4E2E-9E3B-0284B6F5D168',
      3,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '55940F19-9CE3-4118-A6B1-2311F41FC285',
      
          'Potential options for control (not currently in use in Great Britain)'

      ,
      'Other Control Mechanisms',
      '9BDAD251-9A9F-4A65-BFAB-D4A852526ABC',
      2,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '3729B39A-9546-4EC9-BFF4-263F0A074820',
      
          'Impact on freedom to express normal behaviour in each species/group'

      ,
      'Freedom To Express Normal Behaviour',
      '404DD5D4-4447-4CAD-A0AB-C8F0DA284B49',
      5,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'D2174FEE-AA09-4CB9-B66C-266E7AC6F463',
      
          'Summary of impact on animal welfare across all species/groups'

      ,
      'Summary Impact On Animal Welfare',
      '404DD5D4-4447-4CAD-A0AB-C8F0DA284B49',
      9,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'F38BE7D1-A91F-464B-AEB2-273C70BF850F',
      
          'Rate of spread on and between affected premises for this species'

      ,
      'Rate Of Spread On Premises',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      14,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '03005543-E9F3-46C8-B931-2AD4C6BEC38B',
      
          'Definition of a probable case'

      ,
      'Probable Case Definition',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      2,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '4D00439E-740C-4037-8D30-2E26046AE558',
      
          'Impact of this disease on the breadth of trade in animals and animal products (live animals and/or products)'

      ,
      'Range Of Commodities Compromised',
      '2F451B2B-7D6D-4DFF-8D22-73F133848634',
      7,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '15371B7D-9630-44B1-BCFC-31B7850FCDB6',
      
          'Global geographic distribution'

      ,
      'Global Geographic Distribution',
      '99F0EE93-3E56-455C-8666-B0C9EB581589',
      7,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'F76CABF4-12F0-4353-A3E4-3351055C9BF1',
      
          'Welfare impact of likely or statutory control measures for in each species'

      ,
      'Welfare Effect',
      '9BDAD251-9A9F-4A65-BFAB-D4A852526ABC',
      4,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '6DE18354-7BFF-45AE-B632-34F76E1A8A8D',
      
          'Potential to increase understanding of the epidemiology of this infection or issue in each species/group'

      ,
      'Increase Understanding Potential',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      20,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '0D17356A-3A96-4812-85C1-35EFAF3A3CDD',
      
          'Impact on the global environment'

      ,
      'Global Environment',
      'A17946FE-1FFB-4E2E-9E3B-0284B6F5D168',
      2,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'E2FEC6A1-8242-4121-AD75-372D04A000D2',
      
          'Case fatality rate in each species/group'

      ,
      'Mortality Indicator',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      9,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '8E8EB69C-0450-4C65-89AA-3B7B223F1B08',
      
          'Potential to reduce risk of introduction or prevalence for each species/group'

      ,
      'Potential To Reduce Risk',
      '9BDAD251-9A9F-4A65-BFAB-D4A852526ABC',
      5,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '56A3F23B-B097-4203-8295-3DE62F1725ED',
      
          'Proportion of infected and/or affected animals suffering more severely than selected as modal in any of the "5 freedoms" for the specified species/group'

      ,
      'Proportion Of Animals Affected Suffering Severely',
      '404DD5D4-4447-4CAD-A0AB-C8F0DA284B49',
      8,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'C3EFE5F2-E103-4667-9C14-431D5D98D3BA',
      
          'Total potential unplanned cost to the Exchequer'

      ,
      'Potential Unplanned Cost To Exchequer',
      'A17946FE-1FFB-4E2E-9E3B-0284B6F5D168',
      1,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '4F6FD1E5-F8D8-4169-B3BE-48229F07CAFF',
      
          'Annual level of export consignments containing animals/commodities in each species/group sent into intracommunity trade'

      ,
      'Impact On Intra Community Flows',
      '2F451B2B-7D6D-4DFF-8D22-73F133848634',
      8,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '14E5D526-B35A-47AB-AAAD-4A9C2E173099',
      
          'Susceptibility to therapeutic agents'

      ,
      'Therapeutic Agent Susceptibility',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      16,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'C61B45B4-DC41-4572-A264-4AF007BB4A89',
      
          'Estimated total costs of current annual government veterinary expenditure on this infection or issue in all species'

      ,
      'Total Surveillance Costs',
      'A17946FE-1FFB-4E2E-9E3B-0284B6F5D168',
      6,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '4F14D5E9-E6FD-40F5-BE80-4DF7BDFE062E',
      
          'Annual level of export consignments containing animals commodities of this species/group sent into third country trade'

      ,
      'Impact On Third Country Flows',
      '2F451B2B-7D6D-4DFF-8D22-73F133848634',
      9,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '47AB0C86-44CD-45DE-8A3A-5073A44EA73F',
      
          'Is there substantial commercial trade in each species/group affected by this disease?'

      ,
      'Substantial Commercial Trade',
      '2F451B2B-7D6D-4DFF-8D22-73F133848634',
      1,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '7BB0F2FA-6B33-4C9F-B49A-513B221A83CA',
      
          'Persistence in the environment'

      ,
      'Persistence In Environment Indicator',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      17,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '189E764F-21FB-4EBE-8E50-5262152BCFBF',
      
          'Impact on freedom from discomfort in each species/group'

      ,
      'Freedom From Discomfort',
      '404DD5D4-4447-4CAD-A0AB-C8F0DA284B49',
      3,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '33BC3269-F975-47E3-AEE0-527C15D55660',
      
          'Current approaches to control for each species/group'

      ,
      'Current Control Mechanisms',
      '9BDAD251-9A9F-4A65-BFAB-D4A852526ABC',
      1,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '745A30C4-5098-4D02-91B2-55E75F54551F',
      
          'Current holding level prevalence of the disease, infection or issue in Great Britain (endemics only)'

      ,
      'Current Prevalence In GB',
      '99F0EE93-3E56-455C-8666-B0C9EB581589',
      2,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '897D6E20-C1D2-4C46-BEEA-5766C9B32DF5',
      
          'Potential for silent spread in each species/group'

      ,
      'Potential For Silent Spread',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      5,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'EDD8D3A8-C7A1-4B60-A025-5D5BFF2A6CD7',
      
          'Relative importance of export trade to the industry sector'

      ,
      'Importance Of Export Trade',
      '2F451B2B-7D6D-4DFF-8D22-73F133848634',
      4,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'A025E3EE-5A2A-47CC-99DC-63ACF3D98F59',
      
          'Is this disease or issue generally considered to infect people?'

      ,
      'Zoonotic Indicator',
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      1,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'A9AE8EF9-FD50-463B-A5A1-64C05B16C176',
      
          'Summary of impact on international trade'

      ,
      'Impact On International Trade',
      '2F451B2B-7D6D-4DFF-8D22-73F133848634',
      11,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '210B87C7-E283-4B99-A7EB-6BCD315714EB',
      
          'Impact on the sector that produces each species/group'

      ,
      'Local Agricultural Economy',
      'A17946FE-1FFB-4E2E-9E3B-0284B6F5D168',
      4,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '9204DCE4-C357-4BF0-833D-6D371F771078',
      
          'Level of national preparedness or level of implementation for endemics/welfare issues for each species/group'

      ,
      'Level Of National Preparedness',
      '9BDAD251-9A9F-4A65-BFAB-D4A852526ABC',
      11,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'B35E3C7F-0651-42FC-B427-6D6D1926F3D1',
      
          'Transmissibility between humans in Great Britain''s society'

      ,
      'Transmissibility Indicator',
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      6,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '79F66ED7-4939-4FF8-9195-6F4AEA723FB2',
      
          'Annual level of human cases of the disease in Great Britain'

      ,
      'Annual Number Of Human Cases In GB',
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      10,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '53A4A7F1-8300-4E9A-8F5B-726D46F7B4D1',
      
          'Potential scope to reduce further human exposure through government veterinary policy innovations for each species'

      ,
      'Potential To Reduce Human Exposure',
      '9BDAD251-9A9F-4A65-BFAB-D4A852526ABC',
      6,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '9F8B60E7-C1DF-486D-97F4-7B34D228DDE2',
      
          'Is there a reservoir in any species/group not listed below (including wildlife, humans or vectors)?'

      ,
      'Wildlife Reservoir Indicator',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      19,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'F868A520-F31A-43E7-9B93-87E4508073B1',
      
          'Proportion of human cases in Great Britain attributable to exposure to animals or animal products in each species/group from Great Britain'

      ,
      'Attributable Fraction',
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      4,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '6626AA73-8321-4128-961C-88CD5DE73D8D',
      
          'Average cost per case'

      ,
      'Average Cost Per Case',
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      11,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'DAAC3F4D-106E-4417-ACC7-92D8309C945F',
      
          'Resources and time required to re-establish intra-community trading status'

      ,
      'Reestablishment Of Trading Status',
      '2F451B2B-7D6D-4DFF-8D22-73F133848634',
      5,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '957DBA98-8C70-478A-84FB-97B1BA35E53F',
      
          'Likelihood of serious human morbidity in Great Britain'

      ,
      'Maximum Severity Of Human Disease',
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      8,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '5790EEAA-1496-4357-A4ED-98B2B991D090',
      
          'Potential for risk change in animals in each species/group in Great Britain'

      ,
      'Potential For Risk Change',
      '99F0EE93-3E56-455C-8666-B0C9EB581589',
      6,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '0FEA51E7-D610-4C8F-B344-9A680EDD3B81',
      
          'Is there an obligation to control this disease under EU law?'

      ,
      'Statutory Obligation To Control',
      '2F451B2B-7D6D-4DFF-8D22-73F133848634',
      3,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'FA11A678-E6F1-4799-B099-A17CC02EE78A',
      
          'Primary detection method in each species/group (select one for each species/group)'

      ,
      'Primary Detection Methods',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      11,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '96318DC8-1FC5-4E15-B0F8-A2EC86752B48',
      
          'Impact on wider rural community'

      ,
      'Wider Rural Community',
      'A17946FE-1FFB-4E2E-9E3B-0284B6F5D168',
      5,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '585637C0-257C-4366-8819-AAAF8D85A23B',
      
          'Prevalence and geographic distribution of human disease'

      ,
      'Geographic Distribution Of Human Disease',
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      9,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '13B0550B-7F49-4998-98B0-AC4950DA6743',
      
          'Potential to reduce welfare implications in each species/group'

      ,
      'Potential To Reduce Welfare Implications',
      '404DD5D4-4447-4CAD-A0AB-C8F0DA284B49',
      7,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '3756BE7D-AB87-46ED-841A-AF6FF3CDB325',
      
          'Number of clinical cases in each species/group, at the modal severity, per year in Great Britain'

      ,
      'Number Of Cases Per Year In GB',
      '99F0EE93-3E56-455C-8666-B0C9EB581589',
      5,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '01889E3F-2F76-4C4A-8870-B291B3800587',
      
          'Description of the agent'

      ,
      'Agent Description',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      15,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '354A1B85-99A6-48D6-ADA7-B2E9C2D7E728',
      
          'Potential level of imports for each species/group'

      ,
      'Impact On Level Of Imports',
      '2F451B2B-7D6D-4DFF-8D22-73F133848634',
      2,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '1B1FD167-E16B-4297-9BEA-B34C434A998C',
      
          'Current surveillance activities for each species/group'

      ,
      'Current Surveillance Activities',
      'C90FBBAD-BE8D-4317-BF7C-7A56B45B2828',
      1,
      1,
      1,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'AB87554C-98D0-4FF4-9C93-B3AC33720669',
      
          'Is the causative organism or issue reportable under Great Britain''s legislation'

      ,
      'Reportable Causative Organism Indicator',
      'EBB3C892-C7B8-4F64-8F40-FA6D29BF51DE',
      2,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '504166F3-FE15-4E0C-B902-B5C3E9A19453',
      
          'Describe the events that could lead to a change in the indicator under surveillance, and the risk of their occurrence, in each species/group'

      ,
      'Risk Scenarios',
      '158F8D0C-15A7-4F31-98FC-0C06196045D5',
      1,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'A9AE1563-C6AA-47CC-9562-B62643DF1E48',
      
          'Potential for restricting impact by regionalisation/zoning or compartmentalisation'

      ,
      'Potential For Regionalisation',
      '2F451B2B-7D6D-4DFF-8D22-73F133848634',
      6,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '50F4BC33-0011-48E0-9567-B8AE9F891261',
      
          'Uncertainty: Assessment of the current state of knowledge of the public health significance of this infection or issue'

      ,
      'Uncertainty',
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      13,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '93B12402-F412-4227-9E86-B929F5C42171',
      
          'Is this disease or infection or issue currently present in Great Britain?'

      ,
      'GB Presence Indicator',
      '99F0EE93-3E56-455C-8666-B0C9EB581589',
      1,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '7D177709-095F-4220-9C2D-B9FC9164C141',
      
          'Export market value for each species/group'

      ,
      'Export Market Value',
      '2F451B2B-7D6D-4DFF-8D22-73F133848634',
      10,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'F03E03A8-2BB8-4B05-87C5-C10B81BB960A',
      
          'Summary of current surveillance activities'

      ,
      'Summary Of Surveillance Activities',
      'C90FBBAD-BE8D-4317-BF7C-7A56B45B2828',
      2,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '48FEE308-AF80-491B-8932-C6F340C24363',
      
          'Summary description of the impact of this infection or issue in all species of animals on the wider economy, environment and society'

      ,
      'Impact On Society Summary',
      'A17946FE-1FFB-4E2E-9E3B-0284B6F5D168',
      7,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '55C96DCC-03E8-4650-A055-C97CAAD5BE01',
      
          'Risk of introduction of this disease/agent/issue into animals in Great Britain (exotics only)'

      ,
      'Risk Of Introduction To GB',
      '99F0EE93-3E56-455C-8666-B0C9EB581589',
      4,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'D298E014-DF8D-4680-B93E-CB62CB2DE2C8',
      
          'Methods of transmission to humans'

      ,
      'Human Transmission Mechanism',
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      3,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '1B134289-B3A6-4FF1-BC6A-CE45F9E7BD10',
      
          'Details of when compensation applies and to what scale for each species/group'

      ,
      'Compensation',
      '9BDAD251-9A9F-4A65-BFAB-D4A852526ABC',
      10,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '47F994AA-F7F3-4F06-A24E-CE6473062C90',
      
          'Is this a notifiable disease under Great Britain''s legislation?'

      ,
      'Notifiable Disease Indicator',
      'EBB3C892-C7B8-4F64-8F40-FA6D29BF51DE',
      1,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'B8D2BDB4-EB9C-4570-8F0E-CFA3C887C835',
      
          'Uptake of control measures applied at the holding level for each species/group by their keepers'

      ,
      'Uptake At Holding Level',
      '9BDAD251-9A9F-4A65-BFAB-D4A852526ABC',
      3,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'D317E180-917A-413B-8606-D0BD4CBC175A',
      
          'Indirect economic costs of human illness in Great Britain'

      ,
      'Indirect Economic Cost Of Human Illness',
      '8D034220-78F9-47F0-8998-2F5144A531D0',
      12,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '182824DB-4314-4300-BE77-D4FCED18EC7A',
      
          'Applicable legislation/mandates'

      ,
      'Applicable Legislation And Mandates',
      'EBB3C892-C7B8-4F64-8F40-FA6D29BF51DE',
      3,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'EC01BBC4-DDCB-4F80-9B8E-D7A148A7B4B0',
      
          'Definition of a suspect case'

      ,
      'Suspect Case Definition',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      1,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'D7588CC0-F429-4F3C-8F99-E1C2190B4840',
      
          'Efficacy and practicality of control measures applied at the holding level for each species/group'

      ,
      'Controls At The Holding Level',
      '9BDAD251-9A9F-4A65-BFAB-D4A852526ABC',
      8,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'BB3453D6-4B2F-4790-A63B-E2BF7B10FE9F',
      
          'Incubation period in each species/group'

      ,
      'Incubation Period',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      6,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'E0AF3E4E-55DC-425C-80A7-E48C68841E0E',
      
          'Is there a vaccine that could be used in Great Britain for each species/group'

      ,
      'Vaccines Available Indicator',
      '9BDAD251-9A9F-4A65-BFAB-D4A852526ABC',
      7,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '2321B085-9F3A-45AE-9022-E4C32B74D78D',
      
          'Modal duration of welfare impact experienced by animals for each species/group in Great Britain'

      ,
      'Duration Of Disease',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      10,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '581D943B-3B52-49D8-99C7-E654BF1BDA96',
      
          'Summary overview of the legislation'

      ,
      'Legislation Overview',
      'EBB3C892-C7B8-4F64-8F40-FA6D29BF51DE',
      4,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'FBF10EF6-3DFE-4409-BC6F-E9D0A7316368',
      
          'Date of most recent occurrence in Great Britain (exotics only)'

      ,
      'Date Of Most Recent Occurrence In GB',
      '99F0EE93-3E56-455C-8666-B0C9EB581589',
      3,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      'CA2A4681-77BE-4056-8AE5-F09D64D95E60',
      
          'Impact on freedom from hunger and thirst in each species/group'

      ,
      'Freedom From Hunger And Thirst',
      '404DD5D4-4447-4CAD-A0AB-C8F0DA284B49',
      2,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '0DDC56EA-EB54-416C-9947-F113E4B8AB23',
      
          'Is the welfare of any animal of each species/group compromised as a direct consequence of the issue being profiled and/or because of the current control policy associated with this issue in Great Britain?'

      ,
      'Welfare Issue Indicator',
      '404DD5D4-4447-4CAD-A0AB-C8F0DA284B49',
      1,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '9D9F02FE-2028-4CF9-912B-F2153293828D',
      
          'Impact on freedom from fear and distress in each species/group'

      ,
      'Freedom From Fear And Distress',
      '404DD5D4-4447-4CAD-A0AB-C8F0DA284B49',
      6,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '739B5116-5E5C-4A24-B38B-F4811F32C22B',
      
          'Clinical signs for this disease or issue in each species/group'

      ,
      'Clinical Signs',
      '03022A5F-37FE-4B5F-A93A-F1FC95555DF1',
      7,
      1,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ProfileQuestion]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileSectionId],
      [QuestionNumber],
      [IsPerSpecies],
      [IsRepeating],
      [UserGuidance]
      )
      VALUES
      (
      '7CA791E4-2CF3-4CDA-B746-FD0D08FE3431',
      
          'Efficacy of control measures to prevent dissemination of this infection or issue in or between animals that are implemented above the holding level'

      ,
      'Controls Above The Holding Level',
      '9BDAD251-9A9F-4A65-BFAB-D4A852526ABC',
      9,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '3F1E42D9-3FEB-4717-9A2B-0089B19FBA65',
      'Exposure Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '26293ED4-3683-4B4E-80BF-04AF8598BC54',
      'Total Surveillance Costs',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '647F6550-B665-46F5-8DDC-084E2E8883F3',
      'Incubation Period',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '5E87AC66-F00A-4237-B26D-08BF7D55F967',
      'Disease Duration',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'A7AEFC6D-04EC-4147-8F6C-11238385F381',
      'Statutory Obligation Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '9119A543-114B-4C8C-BF92-128EC64A80DD',
      'Import Impact Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '5E27114E-7F37-4496-B890-231F7E63EBE3',
      'Proportion Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '92104271-8505-4189-A43D-23F88E25DBEE',
      'Spread Mechanism',
      1
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'F41B0195-76F7-4B95-9C9C-2C1DCC376821',
      'Uncertainty Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
      'Transmission Mechanism',
      1
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '2AE33A23-5954-4166-B4EE-30FB7F9D5FA3',
      'Transmissibility Indicator',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '2EA88BA1-A288-417E-A842-312824A6A544',
      'Mortality Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'B226B76C-2EE2-4E75-ACF1-398200246C1B',
      'Spread Rate Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'D41B31E1-D0C0-464D-B640-3D26DD21546E',
      'Surveillance Mechanism',
      1
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '3182F93A-71CF-41CD-915D-4989A8FB4876',
      'Cases Per Year',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'ED182673-29CD-4988-8A80-4B36686D97DF',
      'Commodities Compromised Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '1D110CBE-4E1D-4F18-9E4C-54AED253A783',
      'Issue Extent',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '4F9A74EC-180D-458C-9DC6-6D35B1FFF8BA',
      'Human Exposure Reduction Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '3F19FF76-3D76-458C-9F20-6E6F2AA4B919',
      'Human Cases Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '439705E1-E95D-49BA-A858-76CF2CEDE3EE',
      'Modal Severity Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '982FB2B7-98F1-470D-91D2-7773754423E1',
      'Trade Impact Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      'Geographic Area',
      1
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'A60612AB-6358-47B8-9700-794F91BB3198',
      'Maximum Severity Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '1D2FCB0D-8103-4C9A-9DA1-7C36605B4698',
      'Cost Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '37C50C86-8E8E-4C07-BF6B-8296A3B1CEC5',
      'Local Environment Impact Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'D236E027-A052-4A94-A480-8337E61683FE',
      'Regionalisation Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '9ACB37C7-3CB3-4789-B13E-84A4E9042DF5',
      'Legislation Type',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'BC7F05B7-C105-4CAC-B9AF-92210C0F603F',
      'Wildlife Reservoir Indicator',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'D88C3775-DBF6-44C4-8965-961A1A616021',
      'Global Environment Impact Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '19A8013C-E7D6-4AED-A58F-AA1F775CBA54',
      'Diagnosis And Detection Mechanism',
      1
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '8187878C-68BF-4144-A3F6-B7B6DF8F7956',
      'Unplanned Cost Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'C9BDCE7D-45FD-4F40-BE03-BB75EE0169C4',
      'Boolean Flag',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'A9419166-D275-4315-ACBB-BC9B5423B179',
      'Attributable Fraction',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'BDB87DA4-E26F-4952-A87B-BEE28DADFCD8',
      'Risk Change',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Control Mechanism',
      1
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'DCD7592C-2EDB-42CD-9D42-D0396D1D7918',
      'Indicator Flag',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'A84D86CB-DF9B-427D-A24E-D07C9BA9EA2E',
      'Time Period',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      'CEE054F1-2693-4FD7-A893-D9167E432693',
      'Risk Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '118E00A5-C8FD-4978-86CC-E35F471E9514',
      'Impact Level',
      0
      )
    
      INSERT INTO [ReferenceTable]
      (
      [Id],
      [Name],
      [IsMaintainable]
      )
      VALUES
      (
      '41DB6774-5F05-4EDE-BC0F-EC3FF112F8B2',
      'Prevalence Level',
      0
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'F9F33975-FE4C-4D5E-8AA1-00384654324B',
      'CEE054F1-2693-4FD7-A893-D9167E432693',
      'Very low',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '2899BF4E-20D8-481B-84AD-0121F2479365',
      '2AE33A23-5954-4166-B4EE-30FB7F9D5FA3',
      'Common',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '9E1E2348-5C73-4C63-B0B9-0182F9F4A99F',
      'D88C3775-DBF6-44C4-8965-961A1A616021',
      'Negligible',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'E9397129-B123-4F28-A749-05368052D602',
      '5E87AC66-F00A-4237-B26D-08BF7D55F967',
      'Months',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'C878CD62-7CD7-4F6F-AC59-0900D8F58141',
      'D41B31E1-D0C0-464D-B640-3D26DD21546E',
      'Outbreak investigation',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'F10B4506-76AF-45CE-BBF3-093F30305C0E',
      '8187878C-68BF-4144-A3F6-B7B6DF8F7956',
      'Medium',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '469B42D5-8BC7-4701-A98E-0AE0994853DD',
      'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
      'Direct animal contact',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'CDE9CFCE-858B-4A2E-A7D3-0DC60F7F5561',
      'A84D86CB-DF9B-427D-A24E-D07C9BA9EA2E',
      'Hours',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '7D16C7B8-257F-43C8-B6D0-0EC5577B1BBF',
      '1D110CBE-4E1D-4F18-9E4C-54AED253A783',
      'Severe',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'C93353DC-32B3-4E3E-AFEB-111FC1ACF201',
      'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
      'Sexual',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'F5AA682E-9E26-4597-8B68-115DE566642F',
      '1D110CBE-4E1D-4F18-9E4C-54AED253A783',
      'Moderate',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'ACEA173A-6997-452B-AEE7-124E6524BB13',
      'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
      'Waterborne',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '2EACE78B-DAE8-422C-9F8C-13395A6BF898',
      'ED182673-29CD-4988-8A80-4B36686D97DF',
      'Very high',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'DA4AF5DE-B5B8-4E42-AD9A-13EC4351D0BC',
      '26293ED4-3683-4B4E-80BF-04AF8598BC54',
      '£500K to £999K',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '221CD009-E173-405B-A18B-1615895C4188',
      '5E87AC66-F00A-4237-B26D-08BF7D55F967',
      'Hours',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '48B95319-292E-4069-9591-1691214FA31E',
      '37C50C86-8E8E-4C07-BF6B-8296A3B1CEC5',
      'Medium',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '2B6ECEA7-6E3B-4481-96FF-182797FE0A5D',
      'CEE054F1-2693-4FD7-A893-D9167E432693',
      'Negligible',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '653BDC06-16FD-4C1D-8A3A-19CA465A95CB',
      '2EA88BA1-A288-417E-A842-312824A6A544',
      'Low',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '6FB70FDD-A021-4732-88F6-1A70086BE49E',
      'BDB87DA4-E26F-4952-A87B-BEE28DADFCD8',
      'High',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '77EA6051-2312-41A5-8B28-1AF4CD2CC49D',
      '5E87AC66-F00A-4237-B26D-08BF7D55F967',
      'Days',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '1E3CE62E-C2AE-429E-8980-1B13BFAD799A',
      '26293ED4-3683-4B4E-80BF-04AF8598BC54',
      '£100K to £499K',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '8FB26ACF-6C66-4D1A-9F54-1B8632F1E01E',
      '1D2FCB0D-8103-4C9A-9DA1-7C36605B4698',
      'Very high',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '0810ECDB-4ECB-46BC-8969-1C98262856BC',
      '1D110CBE-4E1D-4F18-9E4C-54AED253A783',
      'Minor',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '1A955A7B-A621-44B3-90EF-1D44479617B2',
      'BDB87DA4-E26F-4952-A87B-BEE28DADFCD8',
      'Low',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'CC1FD6D5-D5AF-4B44-BDC7-23AC61238D77',
      '92104271-8505-4189-A43D-23F88E25DBEE',
      'Sexual transmission',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '081A172C-59C3-4ED5-9B90-243D99087D61',
      'A60612AB-6358-47B8-9700-794F91BB3198',
      'Medium',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '8CB80044-4D3F-4D63-87C9-24E3CC993260',
      'F41B0195-76F7-4B95-9C9C-2C1DCC376821',
      'Medium uncertainty',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '53B882AD-67E8-474E-BF8C-250BB10D2B88',
      '439705E1-E95D-49BA-A858-76CF2CEDE3EE',
      'Serious',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '8041CDBB-57E3-47BC-8390-274ECD82D340',
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      'Central / South America',
      6
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'A1C98473-B131-4233-9788-2A449F1C2776',
      '3F1E42D9-3FEB-4717-9A2B-0089B19FBA65',
      'Very high',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'D16578DC-3549-40B0-A5A0-2AF78312143A',
      '647F6550-B665-46F5-8DDC-084E2E8883F3',
      'Months',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '533262C1-454C-45E3-876B-2B47841AB5C2',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Import controls',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'F844322C-0DC1-431A-8F7B-2B53B3478E83',
      '26293ED4-3683-4B4E-80BF-04AF8598BC54',
      '£1M to £5M',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '72BCFA83-3AB0-448A-834A-310492FBF790',
      '2EA88BA1-A288-417E-A842-312824A6A544',
      'Medium',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '8C9327EA-553A-4EC9-8606-3179DDAFF596',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Improve stockmanship',
      11
      )
   
    INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '37A64447-44CC-4704-B029-3C8D8441313C',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Routine testing to identify cases',
      12
      )
   
    INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'C56A67BD-5B59-4D26-97F5-83E2F2A363A3',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Genetic methods',
      13
      )
   
    INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '338E32D5-202C-46D6-B8A2-20E5D56D04D7',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Other unlisted control types',
      14
      )
      
       INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '3B2E8D44-81BD-4F06-AC9F-50DA38B717CA',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'No practical control method available',
      15
      )
      
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '76E5922D-32D9-4CEA-93B5-35DB7A46A82C',
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      'Middle East',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '7B67B103-9125-40C7-9EAC-36BCA2403740',
      'F41B0195-76F7-4B95-9C9C-2C1DCC376821',
      'High uncertainty',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '009C9A74-B6BB-4944-99DA-38420843C05A',
      '4F9A74EC-180D-458C-9DC6-6D35B1FFF8BA',
      'Not applicable',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '99A6D8B5-EE90-4B7F-944C-3A005439EBC8',
      '118E00A5-C8FD-4978-86CC-E35F471E9514',
      'Medium',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'D6EDC88C-8E4D-48D3-8F86-3A09A2B6BC0B',
      'B226B76C-2EE2-4E75-ACF1-398200246C1B',
      'Very high',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '8E228F0A-A8EC-4814-AD9D-3A7A204BEC58',
      '1D2FCB0D-8103-4C9A-9DA1-7C36605B4698',
      'Medium',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'EF1FB030-FB8F-401A-ACC0-3C422BCF99F8',
      '439705E1-E95D-49BA-A858-76CF2CEDE3EE',
      'Mild',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'C66501CF-04FF-473A-B68D-3DCEFA02CD93',
      'B226B76C-2EE2-4E75-ACF1-398200246C1B',
      'Low',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'EE54DC09-0ACA-4D97-AB4B-3DFE9AB20BBE',
      '1D110CBE-4E1D-4F18-9E4C-54AED253A783',
      'None',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '8CA8E861-5BE4-42C4-B5B2-3ED85CD8CDD9',
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      'Africa',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '84F36AE4-49CB-4F7C-8871-474D5B08D468',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Raise awareness for rapid detection',
      10
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '4AEACE50-3999-4768-AA3A-478F10208F2B',
      '9ACB37C7-3CB3-4789-B13E-84A4E9042DF5',
      'OIE obligations',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '37034711-1214-4F15-915F-47C2C6520A5F',
      'D236E027-A052-4A94-A480-8337E61683FE',
      'High',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '0963FF1D-D8CF-4FAE-BC7F-4B163D75A166',
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      'Indian subcontinent',
      8
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '8FDB4141-5898-417B-90A3-4C73B747DDC3',
      'ED182673-29CD-4988-8A80-4B36686D97DF',
      'Low',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '6E2DD137-4224-4FAB-BE6D-4D4DBC6568B0',
      '41DB6774-5F05-4EDE-BC0F-EC3FF112F8B2',
      '>10-20%',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '502EE7E6-9FBC-4716-85FA-4DC89C3CEBD6',
      '4F9A74EC-180D-458C-9DC6-6D35B1FFF8BA',
      'Medium',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'C1A74D91-9BAA-4BCE-83FD-4F07B74BFEEF',
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      'South East Asia',
      7
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '4F8A7425-34ED-400A-9136-4F9E48069A2B',
      'ED182673-29CD-4988-8A80-4B36686D97DF',
      'High',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '4609E099-128D-4A8F-A403-511788C185F9',
      '19A8013C-E7D6-4AED-A58F-AA1F775CBA54',
      'Livestock production data',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '47870AF7-483D-4728-8009-52A84FD4CBF4',
      'D41B31E1-D0C0-464D-B640-3D26DD21546E',
      'Time limited survey',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'A6219B68-6216-4F2D-8384-55EE4FF73024',
      '92104271-8505-4189-A43D-23F88E25DBEE',
      'Aerosol',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '1F131F9F-5661-4B2F-8BA8-57A493D5107C',
      'A9419166-D275-4315-ACBB-BC9B5423B179',
      'Very low',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '7159297A-344E-42D1-A603-5946927B8FF2',
      'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
      'Vector',
      6
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'EDC719FE-7779-423B-AE67-5BFBA6001385',
      'A84D86CB-DF9B-427D-A24E-D07C9BA9EA2E',
      'Weeks',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '13EDF126-03B0-4DE3-84C8-5C13654AEDB9',
      '1D2FCB0D-8103-4C9A-9DA1-7C36605B4698',
      'High',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '331EE4DB-25BB-4986-8E4E-5FCA090896CD',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Farm bio-security',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'F3B22390-A586-4889-98AC-6162905101B8',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Treatment of infected animals',
      7
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'B2E32CFC-37F6-4764-9082-6225E7725E62',
      '3F1E42D9-3FEB-4717-9A2B-0089B19FBA65',
      'Low',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '13957250-081B-4685-A142-63D0560B9A7B',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Culling',
      8
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '3AA0FB56-ED65-4A8B-A732-6403F3EFCD73',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Vaccination',
      6
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '13A598E9-2430-4BA9-9A7B-6547BDC3DF3B',
      '26293ED4-3683-4B4E-80BF-04AF8598BC54',
      '< £100K',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '44EA0EF7-C369-41E1-B6A7-65D49AA6D90E',
      '9119A543-114B-4C8C-BF92-128EC64A80DD',
      'Negligible',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '9994258C-1094-4D83-8FD9-65DB43B4D306',
      '439705E1-E95D-49BA-A858-76CF2CEDE3EE',
      'Life threatening / maiming',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'D3BB4D8C-D62D-4ADB-B225-664DBE2CFE3C',
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      'Central / Far East Asia',
      9
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '0F30B14E-A9CC-4E26-8E63-685DA2964154',
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      'Australasia',
      10
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '67FDD764-D257-485E-8B42-6959716848C9',
      'CEE054F1-2693-4FD7-A893-D9167E432693',
      'Medium',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'F7190B7D-6A03-49FA-BC88-696EFEF50F18',
      'A7AEFC6D-04EC-4147-8F6C-11238385F381',
      'Yes',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'C8583C83-8963-46AA-BDB1-69BAC5C93BB5',
      '37C50C86-8E8E-4C07-BF6B-8296A3B1CEC5',
      'Very low',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'C825EA45-2646-42B3-A7FA-733C9F71D084',
      '3F1E42D9-3FEB-4717-9A2B-0089B19FBA65',
      'Medium',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '0212EE8A-47FE-4BDC-96E9-73F678F82421',
      'A9419166-D275-4315-ACBB-BC9B5423B179',
      'Negligible',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'C6019511-6CAA-4FF5-9DB6-73F6E18071DF',
      '9119A543-114B-4C8C-BF92-128EC64A80DD',
      'Some',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '88F7EFE7-0729-4739-A9B7-7414FCDA0B7A',
      'B226B76C-2EE2-4E75-ACF1-398200246C1B',
      'High',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '5686922C-10B6-4B3D-9923-7482B1C43ECE',
      '41DB6774-5F05-4EDE-BC0F-EC3FF112F8B2',
      '>2-10%',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'D7A8BCF9-600C-4277-BA5C-74C81E4BAA09',
      '92104271-8505-4189-A43D-23F88E25DBEE',
      'Fomite',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '5534C71A-F3D2-482B-BEAF-78335C6CE3B4',
      'BC7F05B7-C105-4CAC-B9AF-92210C0F603F',
      'No',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '098C4F6B-CB4B-4967-8365-79FD4A9C7848',
      'BDB87DA4-E26F-4952-A87B-BEE28DADFCD8',
      'No change',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '69952CB1-0641-41CA-901E-7F2B3394B50C',
      '3182F93A-71CF-41CD-915D-4989A8FB4876',
      '100Ks',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '0DEB0107-FF61-426F-9A24-8051D41187C1',
      'D41B31E1-D0C0-464D-B640-3D26DD21546E',
      'Census',
      6
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '0E23EA69-BB46-4FD1-A08C-80C6CC5FE361',
      'A84D86CB-DF9B-427D-A24E-D07C9BA9EA2E',
      'Days',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '79DF15AC-5290-42D3-AE64-810D706D94A1',
      'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
      'Other environmental',
      7
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'E5E0E3AF-B122-42C3-8B82-82101ABC6FB9',
      'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
      'Foodborne',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'B3E0DDA5-C4C3-4423-B7F7-827047297E18',
      '5E27114E-7F37-4496-B890-231F7E63EBE3',
      'Medium',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'CBB4614A-4964-4CD1-8859-829D08CA3DFB',
      'DCD7592C-2EDB-42CD-9D42-D0396D1D7918',
      'No',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '0E598904-29D5-458B-9D16-83B05B9CF46D',
      '3182F93A-71CF-41CD-915D-4989A8FB4876',
      '1000s',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '2445F71D-E1CF-4A16-9EC9-83F14786E18D',
      '3F19FF76-3D76-458C-9F20-6E6F2AA4B919',
      'Medium',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '90751241-41DD-493C-BDA2-84D8EFCBC02C',
      '118E00A5-C8FD-4978-86CC-E35F471E9514',
      'High',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '1A1B519A-23DA-46CD-8647-862D5A2E4FF4',
      'A7AEFC6D-04EC-4147-8F6C-11238385F381',
      'No',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'A4037745-3D33-4C2D-B116-887413AE95E1',
      '5E87AC66-F00A-4237-B26D-08BF7D55F967',
      'Years',
      6
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '4FB0E20B-3002-4991-B098-8BD0E8477803',
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      'North America',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'F3E04DBB-AEFE-4157-8F69-8BEFD5A8BE97',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Movement restrictions (voluntary)',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'DA228E32-ACEA-4D6C-B8B0-8CB26335E002',
      '5E27114E-7F37-4496-B890-231F7E63EBE3',
      'None',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '5C24CF19-D6F0-4383-A0D1-8CC36C7368F6',
      'CEE054F1-2693-4FD7-A893-D9167E432693',
      'Low',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '02E6950B-B083-477E-8DD6-8ECFC8AB822C',
      '2EA88BA1-A288-417E-A842-312824A6A544',
      'High',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'B2068D4E-6712-4D73-851A-8F906F0D8CC6',
      'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
      'Aerosol',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'B46CEA75-EC76-4093-A67E-90C5655ADA1B',
      '8187878C-68BF-4144-A3F6-B7B6DF8F7956',
      'Very high',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '59EF471A-CA72-479E-8717-93FF37F85F7C',
      '982FB2B7-98F1-470D-91D2-7773754423E1',
      'High',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '83961ACE-E015-4B25-BE81-94A075C13F9E',
      '41DB6774-5F05-4EDE-BC0F-EC3FF112F8B2',
      '>20-50%',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '026EF175-E896-4572-B2DD-95E35342BED4',
      '3182F93A-71CF-41CD-915D-4989A8FB4876',
      '10s',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '415344B3-AEF3-442C-86A4-95F75ADBAAFD',
      '1D2FCB0D-8103-4C9A-9DA1-7C36605B4698',
      'Low',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'DA057A99-B389-48F0-8B2E-9638EA7289E1',
      '37C50C86-8E8E-4C07-BF6B-8296A3B1CEC5',
      'Negligible',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '59543A13-BC62-4ACC-92F6-982B2D66DD84',
      '92104271-8505-4189-A43D-23F88E25DBEE',
      'Vector',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'C1824D58-5133-4175-9E15-987D669A12E9',
      'B226B76C-2EE2-4E75-ACF1-398200246C1B',
      'Medium',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'D96089A5-A617-4A25-B83E-9952F082122F',
      '3F1E42D9-3FEB-4717-9A2B-0089B19FBA65',
      'Very low',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '15374CC2-8F09-44EB-BC64-99B74B9E0EE4',
      '982FB2B7-98F1-470D-91D2-7773754423E1',
      'Medium',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      '982FB2B7-98F1-470D-91D2-7773754423E1',
      'Low',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '53412EBA-769F-464E-A956-9C0B0EE7469C',
      '9ACB37C7-3CB3-4789-B13E-84A4E9042DF5',
      'General domestic legislation',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '9119A543-114B-4C8C-BF92-128EC64A80DD',
      'Not commercial',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '1D4E585E-BCB8-486C-8FAD-9DD1A8CB9D03',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Protection of foodstuffs',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'E865A287-B948-46F9-A3E3-A0E331BE3EDA',
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      'Western Europe',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '8F078954-1ADE-44ED-AEAE-A36E5EC4E7D8',
      'D41B31E1-D0C0-464D-B640-3D26DD21546E',
      'Sentinel surveillance',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '2A20BF1A-40C5-42D1-8F17-A420DBCC095E',
      'A9419166-D275-4315-ACBB-BC9B5423B179',
      'Medium',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '7F79664A-3118-431C-9CF0-A42E5DB93CF3',
      'A7AEFC6D-04EC-4147-8F6C-11238385F381',
      'To some extent',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '87D51717-9102-4703-B1C7-A6DBAC191E49',
      '8187878C-68BF-4144-A3F6-B7B6DF8F7956',
      'Negligible',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '587BED9C-6917-4C2A-9951-A78BC7A7D9D3',
      '5E27114E-7F37-4496-B890-231F7E63EBE3',
      'High',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'A2D4889F-A7A3-4CEE-BC02-A942F46BC265',
      'A9419166-D275-4315-ACBB-BC9B5423B179',
      'High',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '0AE4BBC5-726B-4CAC-A645-ABD08A149219',
      'D41B31E1-D0C0-464D-B640-3D26DD21546E',
      'Continuous survey',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '096B882F-C896-40D1-AF42-AC2BD42BA07C',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Vector control',
      9
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'A95CF339-9D8E-46CC-AAB4-AE3DB1B2C280',
      '9ACB37C7-3CB3-4789-B13E-84A4E9042DF5',
      'EU obligations',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      'C9BDCE7D-45FD-4F40-BE03-BB75EE0169C4',
      'Yes',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      'C9BDCE7D-45FD-4F40-BE03-BB75EE0169C4',
      'No',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '629F113D-1E78-4107-97A4-B1FF0F9E3BF1',
      '41DB6774-5F05-4EDE-BC0F-EC3FF112F8B2',
      '>0-2%',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'CAB7B8A2-14C4-411D-8C2C-B4FA7AE7564F',
      '2AE33A23-5954-4166-B4EE-30FB7F9D5FA3',
      'Uncommon',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'D792C4B9-0600-44D1-9B90-B6719D766386',
      '37C50C86-8E8E-4C07-BF6B-8296A3B1CEC5',
      'Low',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'B1AC9446-2779-4559-9A02-B85CE2C1F1BA',
      '9ACB37C7-3CB3-4789-B13E-84A4E9042DF5',
      'Specific domestic legislation',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '39D5AE2D-29C9-4958-8A83-BA9646B6B136',
      'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
      'Movement restrictions (enforced)',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '222E5E51-877E-49F6-92EB-BAEF379FBB66',
      '4F9A74EC-180D-458C-9DC6-6D35B1FFF8BA',
      'Low',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'DE70CCCA-4D28-4B7F-9CB4-BBC9993D9E7E',
      '92104271-8505-4189-A43D-23F88E25DBEE',
      'Ingestion',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '39E1CF1A-CFCC-42A5-92EE-BC7F22F4C701',
      '5E27114E-7F37-4496-B890-231F7E63EBE3',
      'Low',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '99C7F543-99EA-4BE4-A107-BE233EB895B6',
      'BDB87DA4-E26F-4952-A87B-BEE28DADFCD8',
      'Medium',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'C2218193-97D1-4072-9363-BE43DCED970D',
      '647F6550-B665-46F5-8DDC-084E2E8883F3',
      'Days',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '98370339-ACD2-475A-B424-BFB18CC19CF5',
      '8187878C-68BF-4144-A3F6-B7B6DF8F7956',
      'High',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '6F4973E5-2F89-4719-82FA-C0EE5327E1D7',
      '19A8013C-E7D6-4AED-A58F-AA1F775CBA54',
      'Laboratory testing',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '97748F1B-9F7B-4C02-983E-C174300B323E',
      '41DB6774-5F05-4EDE-BC0F-EC3FF112F8B2',
      '>50%',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '22D969B8-784F-40B5-90B0-C18FD59A10B8',
      'BC7F05B7-C105-4CAC-B9AF-92210C0F603F',
      'Yes',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '5AAE3EE9-65BF-42F2-A24C-C23EA9CC596B',
      '9ACB37C7-3CB3-4789-B13E-84A4E9042DF5',
      'Other mandates',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'C8A862D6-FBC3-46CF-8665-C676BB1360FE',
      'D88C3775-DBF6-44C4-8965-961A1A616021',
      'Very low',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '9AC9E6FA-C62F-4528-988A-C7B568C1367F',
      '19A8013C-E7D6-4AED-A58F-AA1F775CBA54',
      'Post-mortem examination',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '7648B40B-7213-4E42-BBFF-CD2CF5F2FF0F',
      'D236E027-A052-4A94-A480-8337E61683FE',
      'None',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '13495FCE-845A-46D4-82D5-CD311F3CDFAD',
      '19A8013C-E7D6-4AED-A58F-AA1F775CBA54',
      'Behavioural changes',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'B55776E4-E26E-4C68-8CDC-CD7C10F37EE9',
      '2AE33A23-5954-4166-B4EE-30FB7F9D5FA3',
      'Very slow / not applicable',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'A04C0746-DB86-4E59-841B-CE4967C300D2',
      '3F19FF76-3D76-458C-9F20-6E6F2AA4B919',
      'Very low',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'D64E8B93-0E00-426C-9445-CEC04E6A9ED0',
      '2AE33A23-5954-4166-B4EE-30FB7F9D5FA3',
      'Rare',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '1DBA2008-F52D-4FB6-B2CC-D079BD722122',
      '948B3612-BEE6-4A07-892A-7861E5FAD085',
      'Eastern Europe',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'BFC48953-4F28-408B-B985-D358831CEA46',
      '3F19FF76-3D76-458C-9F20-6E6F2AA4B919',
      'High',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'A363E67B-0F6C-4CEE-9CE8-D3EB363DBD4F',
      '2EA88BA1-A288-417E-A842-312824A6A544',
      'Very high',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '8FEBAB57-886A-4B87-A282-D4FF5CD5C34B',
      'A60612AB-6358-47B8-9700-794F91BB3198',
      'High',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '6812B254-43C5-4A4A-84B2-D65365723457',
      '3182F93A-71CF-41CD-915D-4989A8FB4876',
      '100s',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'AC585B54-7BD4-4897-976B-D6A3C95FCF32',
      'BDB87DA4-E26F-4952-A87B-BEE28DADFCD8',
      'Reduction',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '7EF7C332-55E9-4259-8F61-D6DEC9B28EA0',
      'A84D86CB-DF9B-427D-A24E-D07C9BA9EA2E',
      'Months',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '36227FC3-5C1E-4E6B-97D1-D87581C084C9',
      '4F9A74EC-180D-458C-9DC6-6D35B1FFF8BA',
      'High',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'F1B4FC65-B9AF-4F21-8059-D89746B2997F',
      '5E87AC66-F00A-4237-B26D-08BF7D55F967',
      'Not applicable',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'B344E953-E842-47DD-ACC1-D8A1023544D1',
      '92104271-8505-4189-A43D-23F88E25DBEE',
      'Long distance aerosol',
      6
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '691D354F-9BDB-4870-A785-D8B350293833',
      'D41B31E1-D0C0-464D-B640-3D26DD21546E',
      'Notification',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'EF3B2C4B-2CDA-4439-B727-D9F7201C5D38',
      '439705E1-E95D-49BA-A858-76CF2CEDE3EE',
      'Medium',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'DF0A980E-93A1-40A0-9DAB-DA062CA12518',
      '2EA88BA1-A288-417E-A842-312824A6A544',
      'Very low',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '03E22E35-1572-452F-9440-DDA0ABDCE62E',
      'A60612AB-6358-47B8-9700-794F91BB3198',
      'Very high',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '3D5DE706-7A29-4496-A9A3-DF2C52649F08',
      'F41B0195-76F7-4B95-9C9C-2C1DCC376821',
      'Low uncertainty',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '4074844A-29D3-46C8-89CF-E05A3EB02EDD',
      '647F6550-B665-46F5-8DDC-084E2E8883F3',
      'Hours',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '72EFD34D-88ED-46B0-B054-E299AE730E19',
      '19A8013C-E7D6-4AED-A58F-AA1F775CBA54',
      'Clinical signs',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '7EF9BDE5-323B-428C-9D19-E3753A9FCD33',
      'DCD7592C-2EDB-42CD-9D42-D0396D1D7918',
      'Not known',
      3
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '6A8DFB7B-BADE-47A4-A8E1-E4040385345C',
      '3F1E42D9-3FEB-4717-9A2B-0089B19FBA65',
      'High',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'E7F4FAE5-2245-445B-A474-EA557F3F2F02',
      '5E87AC66-F00A-4237-B26D-08BF7D55F967',
      'Weeks',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '86D10028-679E-45FD-A57D-EC02DF3E1348',
      'BC7F05B7-C105-4CAC-B9AF-92210C0F603F',
      'Considerable uncertainty',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '9CEED781-7DDF-4D74-BA5C-ED6154423D61',
      '3182F93A-71CF-41CD-915D-4989A8FB4876',
      'Millions',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '982FB2B7-98F1-470D-91D2-7773754423E1',
      'Not commercial',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '9C2B1788-94CA-4721-B9F4-F02BB4234F9B',
      '9119A543-114B-4C8C-BF92-128EC64A80DD',
      'Significant',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '1FFF026A-55A3-4605-94C2-F0DA0934E195',
      'B226B76C-2EE2-4E75-ACF1-398200246C1B',
      'None',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '817AB548-5923-4DC1-8CF9-F24F050C0519',
      '26293ED4-3683-4B4E-80BF-04AF8598BC54',
      '> £5M',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '35F7ADFB-D539-4E72-BB69-F30AA1304764',
      '3F19FF76-3D76-458C-9F20-6E6F2AA4B919',
      'Low',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '13692C1E-83A4-4194-94AD-F313959F655C',
      'D41B31E1-D0C0-464D-B640-3D26DD21546E',
      'Scanning surveillance',
      7
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'D3F9D36E-B7C2-4A25-A134-F3FCB0DA2305',
      'ED182673-29CD-4988-8A80-4B36686D97DF',
      'Medium',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'C5390074-3597-458C-AAF4-F42099F416E8',
      'DCD7592C-2EDB-42CD-9D42-D0396D1D7918',
      'Yes',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '7EBD9BD8-79C6-44B8-A2D7-F5585EAD9B50',
      'D236E027-A052-4A94-A480-8337E61683FE',
      'Some',
      2
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '7D6CA5E2-3A20-4B8B-9271-F56379C75C6F',
      '2AE33A23-5954-4166-B4EE-30FB7F9D5FA3',
      'Occasional',
      4
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'A22F1693-39DE-49AD-A9DD-F67BA7594CD2',
      '92104271-8505-4189-A43D-23F88E25DBEE',
      'Other',
      7
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '21B64335-B38D-4320-9295-F8EFF41F9EE8',
      'CEE054F1-2693-4FD7-A893-D9167E432693',
      'High',
      5
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      'DC28020B-33AA-4F50-9005-F9195A9D3181',
      'A60612AB-6358-47B8-9700-794F91BB3198',
      'Low',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '953B4DCE-61A8-43BF-8AC4-FBF4E77C8B4D',
      '118E00A5-C8FD-4978-86CC-E35F471E9514',
      'Low',
      1
      )
    
      INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '1EFC101E-4DB6-4D74-B424-FD443815C81F',
      '8187878C-68BF-4144-A3F6-B7B6DF8F7956',
      'Low',
      2
      )

INSERT INTO [ReferenceValue]
      (
      [Id],
      [ReferenceTableId],
      [LookupValue],
      [SequenceNumber]
      )
      VALUES
      (
      '9057B373-1D8B-4A42-863A-B62009508278',
      '9acb37c7-3cb3-4789-b13e-84a4e9042df5',
      'None',
      6
      )

      INSERT INTO [PrioritisationRankingRange]
      (
      [Id],
      [LowerBound],
      [UpperBound]
      )
      VALUES
      (
      '66F0136C-5D6E-4C92-9FAE-47DC3726B54B',
      0,
      10
      )
    
   INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'E8177ECD-2028-48D0-9DCB-2C44ACBBEEDC',
      
          NULL
        ,
      'Description',
      'd0086a85-e54b-4ca7-90e0-070915b76c3a',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
       
	INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '2B257288-DEAC-48CA-B137-1B2FA29C1F52',
      
          NULL
        ,
      'Affected Species Comments',
      '602f2ca1-0db9-4e1c-a2b6-9bf708cb7ab0',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
      
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '1DEA58BE-575F-4A3D-9BD7-95E836759791',
      
          NULL
        ,
      'Revision History',
      '625eecf0-273d-410e-a251-d493cfbd54c4',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
      
       INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'C69AA48F-94F0-451A-A733-1F50A4C18CFB',
      
          NULL
        ,
      'Opportunity To Add Value Summary',
      'e15e60a1-639d-4fac-9dfd-ea12e432cbc6',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
      
    INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '8341765E-42DD-4EC8-A977-4C4181450F3D',
      
          NULL
        ,
      'Public And Stakeholder Perception Summary',
      '7cce0546-d9c0-4aae-9ada-a601819036de',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
      
    INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '4376E65C-1319-4A06-987F-DA7A610BF78F',
      
          NULL
        ,
      'FFG Costs Summary',
      'fd6ad7ac-5760-4652-9dde-597caedebd79',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
      
    INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '0FD52ACB-4095-407A-B6F1-E7FD020D0DBB',
      
          NULL
        ,
      'Areas Of Uncertainty Summary',
      '1d6ec9bc-76a9-4c7a-aec8-db3fb85f7dd1',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
      
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'D9D781E1-968F-4589-9BAC-006AB20FB8CF',
      
          'Supporting comments'
        ,
      'Increase Understanding Potential Comments',
      '6DE18354-7BFF-45AE-B632-34F76E1A8A8D',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '6AD5F071-9412-4FDE-8F15-082B5FF5FB02',
      NULL,
      'Current Prevalence In GB',
      '745A30C4-5098-4D02-91B2-55E75F54551F',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '41DB6774-5F05-4EDE-BC0F-EC3FF112F8B2',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '52BE906A-3E8C-4E14-A277-0A556A0D05C5',
      
          'Welfare impact'
        ,
      'Welfare Effect',
      'F76CABF4-12F0-4353-A3E4-3351055C9BF1',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '5E27114E-7F37-4496-B890-231F7E63EBE3',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '39C11421-1494-4A29-98F1-0CF7FD363B37',
      
          'Compromised welfare?'
        ,
      'Welfare Issue Indicator',
      '0DDC56EA-EB54-416C-9947-F113E4B8AB23',
      1,
      'B1A35FAB-D4CF-4797-8F81-474892DA5251',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '57F81031-D5DE-443A-838B-0DC7AB9D4454',
      NULL,
      'Potential For Regionalisation',
      'A9AE1563-C6AA-47CC-9562-B62643DF1E48',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'D236E027-A052-4A94-A480-8337E61683FE',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '54860BEA-23A5-4631-9B2F-1222AFF78271',
      
          'Supporting comments'
        ,
      'Freedom From Fear And Distress Comments',
      '9D9F02FE-2028-4CF9-912B-F2153293828D',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '1156C38B-42C6-464A-BD06-131BAE2BC51F',
      NULL,
      'Maximum Severity Of Human Disease',
      '957DBA98-8C70-478A-84FB-97B1BA35E53F',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'A60612AB-6358-47B8-9700-794F91BB3198',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '114C5FD3-10FF-41C8-9B09-13377D45DFF6',
      
          'Efficacy and practicality'
        ,
      'Controls At The Holding Level',
      'D7588CC0-F429-4F3C-8F99-E1C2190B4840',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '118E00A5-C8FD-4978-86CC-E35F471E9514',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '9B5BDC1A-57F7-416F-81D6-1706F254B26F',
      
          'Impact'
        ,
      'Freedom From Pain Or Injury',
      '61E59EA4-AA92-484B-8151-0BBE0BA1BD7C',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '1D110CBE-4E1D-4F18-9E4C-54AED253A783',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '054AC640-9C3E-4400-BEB3-18720172BF44',
      
          'Surveillance mechanism'
        ,
      'Mechanism',
      '1B1FD167-E16B-4297-9BEA-B34C434A998C',
      2,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'D41B31E1-D0C0-464D-B640-3D26DD21546E',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'DDDD01DE-AD39-45F8-B691-1A0E02EEB97B',
      NULL,
      'Reestablishment Of Trading Status',
      'DAAC3F4D-106E-4417-ACC7-92D8309C945F',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '118E00A5-C8FD-4978-86CC-E35F471E9514',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '56AD0DE1-257C-46FE-8F8A-1D9618C6BB5D',
      NULL,
      'Confirmed Case Definition',
      'E3B69F62-BCAF-41F6-A68F-0AA6AD1DEB5E',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '84C095A3-EBC8-41A4-BA46-20E7109A0F41',
      
          'Supporting comments'
        ,
      'Current Prevalence In GB Comments',
      '745A30C4-5098-4D02-91B2-55E75F54551F',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '78E0AB9A-1E05-41E5-A40A-214F11458491',
      
          'Supporting comments'
        ,
      'Potential To Reduce Risk Comments',
      '8E8EB69C-0450-4C65-89AA-3B7B223F1B08',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '17369492-0391-4115-8973-2470DF2E6FA3',
      NULL,
      'Total Surveillance Costs',
      'C61B45B4-DC41-4572-A264-4AF007BB4A89',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '26293ED4-3683-4B4E-80BF-04AF8598BC54',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'CF83A24C-6885-4329-8FCA-248BFE4B7509',
      NULL,
      'Range Of Commodities Compromised',
      '4D00439E-740C-4037-8D30-2E26046AE558',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'ED182673-29CD-4988-8A80-4B36686D97DF',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'E6C08E8A-9258-4DB0-9D91-24AF8B32B172',
      
          'Interaction/exposure?'
        ,
      'Level Of Human Exposure To Animal Or Products',
      '418F7B77-78E8-455D-A307-05DA702B16A4',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '3F1E42D9-3FEB-4717-9A2B-0089B19FBA65',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '8AC735B8-8262-4A0C-9ED7-2B591A94C599',
      
          'Vaccines availability?'
        ,
      'Vaccines Available Indicator',
      'E0AF3E4E-55DC-425C-80A7-E48C68841E0E',
      1,
      'B1A35FAB-D4CF-4797-8F81-474892DA5251',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '17704EAA-A505-4F9F-8E8F-2C570EAB29E5',
      
          'Fatality rate'
        ,
      'Mortality Indicator',
      'E2FEC6A1-8242-4121-AD75-372D04A000D2',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '2EA88BA1-A288-417E-A842-312824A6A544',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'D93AD6B7-C191-4BC1-B7B3-2CDB85DC5E83',
      NULL,
      'Summary Of Surveillance Activities',
      'F03E03A8-2BB8-4B05-87C5-C10B81BB960A',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'BC525D73-9223-40F3-A4B8-2D2472A11E84',
      NULL,
      'Global Geographic Distribution',
      '15371B7D-9630-44B1-BCFC-31B7850FCDB6',
      1,
      '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
      1,
      
          '948B3612-BEE6-4A07-892A-7861E5FAD085',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '8B5240E4-59F3-429A-9C62-2EF561201BB8',
      
          'Export market value'
        ,
      'Export Market Value',
      '7D177709-095F-4220-9C2D-B9FC9164C141',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '982FB2B7-98F1-470D-91D2-7773754423E1',
        1
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '78CEE922-DDFC-469F-8614-2F01ABF79F9A',
      
          'Commercial trade?'
        ,
      'Commercial Trade',
      '47AB0C86-44CD-45DE-8A3A-5073A44EA73F',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'C9BDCE7D-45FD-4F40-BE03-BB75EE0169C4',
        1
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '5845EAA6-4DEC-4BEB-850D-2F9CF7B3F2DA',
      
          'Supporting comments'
        ,
      'Reestablishment Of Trading Status Comments',
      'DAAC3F4D-106E-4417-ACC7-92D8309C945F',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '48517386-C2B5-48EE-A11E-30694E6A313C',
      NULL,
      'Suspect Case Definition',
      'EC01BBC4-DDCB-4F80-9B8E-D7A148A7B4B0',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'EC477782-2328-4A7F-8EF8-30AFB67F3929',
      NULL,
      'Human Transmission Mechanism',
      'D298E014-DF8D-4680-B93E-CB62CB2DE2C8',
      1,
      '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
      1,
      
          'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '9A429CF0-7435-470D-9C22-319708F1E721',
      
          'Annual level'
        ,
      'Impact On Third Country Flows',
      '4F14D5E9-E6FD-40F5-BE80-4DF7BDFE062E',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '982FB2B7-98F1-470D-91D2-7773754423E1',
        1
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '7FC60B51-D99F-48B9-8A3B-3474899E5984',
      NULL,
      'Summary Impact On Animal Welfare',
      'D2174FEE-AA09-4CB9-B66C-266E7AC6F463',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '7DE49BBF-80AB-40CD-ABA3-354DE57BEDA3',
      
          'Supporting comments'
        ,
      'Detection Method Type Comments',
      'FA11A678-E6F1-4799-B099-A17CC02EE78A',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'A5C23820-4CD3-4F32-95FA-3864820EB0B0',
      
          'Supporting comments'
        ,
      'Statutory Obligation To Control Comments',
      '0FEA51E7-D610-4C8F-B344-9A680EDD3B81',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      0,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '9EA1E638-AD87-4936-96D4-38B967D40E58',
      
          'Supporting comments'
        ,
      'Potential To Reduce Human Exposure Comments',
      '53A4A7F1-8300-4E9A-8F5B-726D46F7B4D1',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'E6415E2D-689B-45AD-B5B6-398FD24845C4',
      
          'Compensation applicable'
        ,
      'Compensation',
      '1B134289-B3A6-4FF1-BC6A-CE45F9E7BD10',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'D2B27B8D-13D1-44E3-AC49-3AF1E32D78C2',
      NULL,
      'Notifiable Disease Indicator',
      '47F994AA-F7F3-4F06-A24E-CE6473062C90',
      1,
      'B1A35FAB-D4CF-4797-8F81-474892DA5251',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '2DC5E75D-80CE-4601-82AE-3F23635BF96F',
      
          'Primary detection method'
        ,
      'Primary Detection Methods',
      'FA11A678-E6F1-4799-B099-A17CC02EE78A',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '19A8013C-E7D6-4AED-A58F-AA1F775CBA54',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'A0CF81AF-C6D1-4B62-A0C4-4228ECCA4D7A',
      NULL,
      'Local Environment',
      '57C1057F-BDB0-4E86-B5E1-1D31A2F3B8C3',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '37C50C86-8E8E-4C07-BF6B-8296A3B1CEC5',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '830906FA-0860-496C-816C-45FF963BAF50',
      
          'Impact'
        ,
      'Freedom From Hunger And Thirst',
      'CA2A4681-77BE-4056-8AE5-F09D64D95E60',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '1D110CBE-4E1D-4F18-9E4C-54AED253A783',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'C51B7AFA-98FF-497C-AD7B-4634FADDB224',
      NULL,
      'Confirmation Of Diagnosis',
      '49C62B0D-93F4-4880-A6A0-072A804217A6',
      1,
      '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
      1,
      
          '19A8013C-E7D6-4AED-A58F-AA1F775CBA54',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'E1E5B2D3-5AE7-4BD7-A3A1-4B1A4F6726DB',
      
          'Supporting comments'
        ,
      'Welfare Issue Indicator Comments',
      '0DDC56EA-EB54-416C-9947-F113E4B8AB23',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'B658405A-DBC2-47DF-943F-4B889453DCED',
      NULL,
      'Modal Severity Of Human Disease',
      'B6BECBDB-CDFE-4695-BD5C-0BB72344C78A',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '439705E1-E95D-49BA-A858-76CF2CEDE3EE',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '17890192-61FC-4767-881D-4D94D4452ADD',
      NULL,
      'Symptoms Of Human Disease',
      'CB1DE3F4-FD98-46A2-BC82-12FC88D76EED',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '5DDE04BE-201E-4F64-8916-506207290572',
      NULL,
      'Indirect Economic Cost Of Human Illness',
      'D317E180-917A-413B-8606-D0BD4CBC175A',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '1D2FCB0D-8103-4C9A-9DA1-7C36605B4698',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'B97082F0-091A-40BB-A028-531B5D024589',
      
          'Supporting comments'
        ,
      'GB Presence Indicator Comments',
      '93B12402-F412-4227-9E86-B929F5C42171',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      0,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'ED529657-AD83-4A9A-8D93-534AC8B7DC11',
      
          'Current approaches'
        ,
      'Current Control Mechanisms',
      '33BC3269-F975-47E3-AEE0-527C15D55660',
      1,
      '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
      1,
      
          'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'A1D674CA-984D-47E8-A6CB-54B1940599D8',
      
          'Supporting comments'
        ,
      'Rate Of Spread On Premises Comments',
      'F38BE7D1-A91F-464B-AEB2-273C70BF850F',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '349F1DE4-38EC-4D1F-9B7F-54DC4AF1B30A',
      NULL,
      'Controls Above The Holding Level',
      '7CA791E4-2CF3-4CDA-B746-FD0D08FE3431',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '118E00A5-C8FD-4978-86CC-E35F471E9514',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '87DA7961-C443-4E8E-B8CD-559CB2C2B0C6',
      
          'Potential for risk change'
        ,
      'Potential For Risk Change',
      '5790EEAA-1496-4357-A4ED-98B2B991D090',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'BDB87DA4-E26F-4952-A87B-BEE28DADFCD8',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '12FF0BBD-B7A2-4401-82B3-55A2E020FD8C',
      
          'Maximum incubation period (in days)'
        ,
      'Incubation Period Maximum',
      'BB3453D6-4B2F-4790-A63B-E2BF7B10FE9F',
      4,
      'C7698CDD-BA52-4635-9C1D-8D69609E5716',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'FC92A38A-5516-4A58-98B6-56CF96C155D7',
      
          'Supporting comments'
        ,
      'Spread Mechanism Comments',
      'D62C2D6C-D824-4E37-B744-072A7274D062',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'C975A050-5BED-40A9-90F2-57E0C0FC80A9',
      
          'Supporting comments'
        ,
      'Mortality Indicator Comments',
      'E2FEC6A1-8242-4121-AD75-372D04A000D2',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'C9151EB7-B0A5-4D05-8881-58D727F3DFBA',
      NULL,
      'Probable Case Definition',
      '03005543-E9F3-46C8-B931-2AD4C6BEC38B',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'F44C465F-99EE-4780-AC14-6040880856E9',
      NULL,
      'Average Cost Per Case',
      '6626AA73-8321-4128-961C-88CD5DE73D8D',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '1D2FCB0D-8103-4C9A-9DA1-7C36605B4698',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '2D0FF667-E077-4ABF-8551-622A04FB6A8C',
      
          'Level?'
        ,
      'Level Of National Preparedness',
      '9204DCE4-C357-4BF0-833D-6D371F771078',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '118E00A5-C8FD-4978-86CC-E35F471E9514',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '329196F6-D3D8-40B9-A839-63CCBB825D14',
      
          'Supporting comments'
        ,
      'Controls At The Holding Level Comments',
      'D7588CC0-F429-4F3C-8F99-E1C2190B4840',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '27848441-EE33-452F-B71E-658172CB0F37',
      
          'Scenarios'
        ,
      'Risk Scenarios',
      '504166F3-FE15-4E0C-B902-B5C3E9A19453',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '11A970F7-A1C2-401E-B046-66DAFF92D942',
      
          'Supporting comments'
        ,
      'Proportion Of Animals Affected Suffering Severely Comments',
      '56A3F23B-B097-4203-8295-3DE62F1725ED',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'E09D143B-4BC6-4C21-8E71-676BDF46F584',
      
          'Supporting comments'
        ,
      'Wildlife Reservoir Indicator Comments',
      '9F8B60E7-C1DF-486D-97F4-7B34D228DDE2',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '34A3D221-92EE-4DD1-B59C-67D814CA7FE7',
      
          'Potential level of imports'
        ,
      'Impact On Level Of Imports',
      '354A1B85-99A6-48D6-ADA7-B2E9C2D7E728',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '9119A543-114B-4C8C-BF92-128EC64A80DD',
        1
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'C8348A4B-14DF-4665-B453-68AF2AE6226F',
      
          'Supporting comments'
        ,
      'Applicable Legislation And Mandates Comments',
      '182824DB-4314-4300-BE77-D4FCED18EC7A',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'A660ED3C-B6FD-4999-B4AB-6C55886F50C7',
      
          'Supporting comments'
        ,
      'Global Geographic Distribution Comments',
      '15371B7D-9630-44B1-BCFC-31B7850FCDB6',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '59E4F04F-71ED-4EB0-9C1B-6F0176B5E6BC',
      
          'Pathological features'
        ,
      'Pathological Features',
      '9FBE8E95-D897-46BC-8E32-0689E4490358',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '4F45216C-A650-4915-BF4F-6F2665CEA2BF',
      
          'Supporting comments'
        ,
      'Freedom From Discomfort Comments',
      '189E764F-21FB-4EBE-8E50-5262152BCFBF',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'D91E8E19-8CE8-4FBB-859E-71590DAE54ED',
      NULL,
      'Applicable Legislation And Mandates',
      '182824DB-4314-4300-BE77-D4FCED18EC7A',
      1,
      '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
      1,
      
          '9ACB37C7-3CB3-4789-B13E-84A4E9042DF5',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '239C26CF-1759-45B4-B7AA-722195D70DB2',
      
          'Welfare impact'
        ,
      'Duration Of Disease',
      '2321B085-9F3A-45AE-9022-E4C32B74D78D',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '5E87AC66-F00A-4237-B26D-08BF7D55F967',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '5B5D5F1B-A0CA-4D2A-A75C-724731A7D3BA',
      
          'Supporting comments'
        ,
      'Potential Unplanned Cost To Exchequer Comments',
      'C3EFE5F2-E103-4667-9C14-431D5D98D3BA',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '10CFFCD6-9393-4973-ABDE-72835C323F62',
      
          'Potential?'
        ,
      'Increase Understanding Potential',
      '6DE18354-7BFF-45AE-B632-34F76E1A8A8D',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '118E00A5-C8FD-4978-86CC-E35F471E9514',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'D916E329-C080-4FFA-AE5E-729D36DDBAE6',
      
          'Supporting comments'
        ,
      'Persistence In Environment Indicator Comments',
      '7BB0F2FA-6B33-4C9F-B49A-513B221A83CA',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'A3E6098E-71C8-4A7A-8D30-74358EF3B5FA',
      
          'Supporting comments'
        ,
      'Importance Of Export Trade Comments',
      'EDD8D3A8-C7A1-4B60-A025-5D5BFF2A6CD7',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,1
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '55C4B147-FFFE-438F-9000-74E51E2DE48E',
      
          'Typical incubation period range (lower value)'
        ,
      'Incubation Period Typical Lower',
      'BB3453D6-4B2F-4790-A63B-E2BF7B10FE9F',
      1,
      'C7698CDD-BA52-4635-9C1D-8D69609E5716',
      1,
      NULL,0
      )

      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'D0B7A0FA-4A8F-4B3A-8658-77CC09A94B24',
      
          'Typical incubation period range (upper value)'
        ,
      'Incubation Period Typical Upper',
      'BB3453D6-4B2F-4790-A63B-E2BF7B10FE9F',
      2,
      'C7698CDD-BA52-4635-9C1D-8D69609E5716',
      1,
      NULL,0
      )
      
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '8950DAE5-47ED-4D45-B2BE-776A4ECD29B0',
      
          'Supporting comments'
        ,
      'Global Environment Comments',
      '0D17356A-3A96-4812-85C1-35EFAF3A3CDD',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '371A7645-068B-4195-8092-798ED57416EC',
      
          'Potential?'
        ,
      'Potential To Reduce Welfare Implications',
      '13B0550B-7F49-4998-98B0-AC4950DA6743',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '118E00A5-C8FD-4978-86CC-E35F471E9514',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '57FF2726-E245-44E8-A5A9-7BD018DDE252',
      
          'Supporting comments'
        ,
      'Freedom To Express Normal Behaviour Comments',
      '3729B39A-9546-4EC9-BFF4-263F0A074820',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'F60FCE3D-097F-4343-9A6B-7CE990288B5B',
      
          'Supporting comments'
        ,
      'Vaccines Available Indicator Comments',
      'E0AF3E4E-55DC-425C-80A7-E48C68841E0E',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '2F890ED6-3479-40F6-B390-7DA2F5A4BF11',
      
          'Supporting comments'
        ,
      'Potential For Regionalisation Comments',
      'A9AE1563-C6AA-47CC-9562-B62643DF1E48',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '4C4CD781-FED9-4CAC-A3F0-7E67BE82A7A7',
      NULL,
      'Wider Rural Community',
      '96318DC8-1FC5-4E15-B0F8-A2EC86752B48',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '2EA88BA1-A288-417E-A842-312824A6A544',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '23BC5C60-C7D8-44F1-ADBC-803A7BAF04A9',
      
          'Potential?'
        ,
      'Potential To Reduce Risk',
      '8E8EB69C-0450-4C65-89AA-3B7B223F1B08',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '118E00A5-C8FD-4978-86CC-E35F471E9514',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '729D6BAF-1F5E-4E58-A854-81AA36A6CB31',
      NULL,
      'Persistence In Environment Indicator',
      '7BB0F2FA-6B33-4C9F-B49A-513B221A83CA',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'A84D86CB-DF9B-427D-A24E-D07C9BA9EA2E',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'ECF5E96A-CD7B-479F-84C6-8272AF79C88A',
      
          'Rate of spread'
        ,
      'Rate Of Spread On Premises',
      'F38BE7D1-A91F-464B-AEB2-273C70BF850F',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'B226B76C-2EE2-4E75-ACF1-398200246C1B',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '70B0E8C9-FB22-41C9-A78E-829863473BED',
      
          'Supporting comments'
        ,
      'Maximum Severity Of Human Disease Comments',
      '957DBA98-8C70-478A-84FB-97B1BA35E53F',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'AD30941B-186A-4080-A4EC-845287A24DAF',
      
          'Supporting comments'
        ,
      'Current Control Mechanisms Comments',
      '33BC3269-F975-47E3-AEE0-527C15D55660',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '73854A00-7B2C-4452-87A4-846CF4BDCEA9',
      NULL,
      'Global Environment',
      '0D17356A-3A96-4812-85C1-35EFAF3A3CDD',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'D88C3775-DBF6-44C4-8965-961A1A616021',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '466971E6-DA7D-4784-BBC3-84F49BD1C2DB',
      
          'Supporting comments'
        ,
      'Welfare Effect Comments',
      'F76CABF4-12F0-4353-A3E4-3351055C9BF1',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'DDE32F7E-D15D-4791-BE95-8AC56EA7584D',
      
          'Minimum incubation period (in days)'
        ,
      'Incubation Period Minimum',
      'BB3453D6-4B2F-4790-A63B-E2BF7B10FE9F',
      3,
      'C7698CDD-BA52-4635-9C1D-8D69609E5716',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'F2801477-78C8-4A34-A35B-8B64CDFEB471',
      
          'Annual level'
        ,
      'Impact On Intra Community Flows',
      '4F6FD1E5-F8D8-4169-B3BE-48229F07CAFF',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '982FB2B7-98F1-470D-91D2-7773754423E1',
        1
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'DEA928F9-87AF-49A9-9EC1-8D7599347FE1',
      
          'Other options'
        ,
      'Other Control Mechanisms',
      '55940F19-9CE3-4118-A6B1-2311F41FC285',
      1,
      '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
      1,
      
          'D9889426-96A2-4C69-A3DB-C26F256C5FC1',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '71D4A481-AB15-4E18-A252-8E82F4CB7C6E',
      
          'Supporting comments'
        ,
      'Local Environment Comments',
      '57C1057F-BDB0-4E86-B5E1-1D31A2F3B8C3',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'D1F80CBF-4C2F-4053-844B-8F63115D0406',
      
          'Supporting comments'
        ,
      'Controls Above The Holding Level Comments',
      '7CA791E4-2CF3-4CDA-B746-FD0D08FE3431',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '1F645806-4062-4270-800E-8FD90303F36A',
      
          'Supporting comments'
        ,
      'Risk Of Introduction To GB Comments',
      '55C96DCC-03E8-4650-A055-C97CAAD5BE01',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'A9C16BC9-374D-4790-AB0B-907C3496D9CC',
      
          'Supporting comments'
        ,
      'Uptake At Holding Level Comments',
      'B8D2BDB4-EB9C-4570-8F0E-CFA3C887C835',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'E843BF5F-9482-4AAD-BAD0-9113B96E7FE1',
      
          'Number of cases per year in Great Britain'
        ,
      'Number Of Cases Per Year In GB',
      '3756BE7D-AB87-46ED-841A-AF6FF3CDB325',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '3182F93A-71CF-41CD-915D-4989A8FB4876',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '9ED6C609-9287-4CB6-81EB-9399124F955C',
      
          'Supporting comments'
        ,
      'Modal Severity Of Human Disease Comments',
      'B6BECBDB-CDFE-4695-BD5C-0BB72344C78A',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '5F1B9EE9-D594-4C4B-83A3-95B85E42C0FE',
      NULL,
      'Date Of Most Recent Occurrence In GB',
      'FBF10EF6-3DFE-4409-BC6F-E9D0A7316368',
      1,
      '18D206DE-4C28-4736-97DE-9054FF8A081E',
      0,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'EDDC2E84-8AAD-4234-B765-969BC897915C',
      
          'Supporting comments'
        ,
      'Local Agricultural Economy Comments',
      '210B87C7-E283-4B99-A7EB-6BCD315714EB',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'EFD26011-D9EB-4142-B2DE-98F04D9A7BB6',
      
          'Transmission mechanism(s)'
        ,
      'Transmission Mechanism',
      'C7BEF5CF-0A53-43B3-A6C4-03C86014E766',
      1,
      '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
      1,
      
          'BFC9F1C2-77EA-4704-B586-301BDD03B7B7',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'D001D1B4-2653-41B1-871F-9C6DBE724237',
      NULL,
      'Reportable Causative Organism Indicator',
      'AB87554C-98D0-4FF4-9C93-B3AC33720669',
      1,
      'B1A35FAB-D4CF-4797-8F81-474892DA5251',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'A6A7E809-16E7-4CD1-A999-9C9CB6B882CE',
      NULL,
      'Spread Mechanism',
      'D62C2D6C-D824-4E37-B744-072A7274D062',
      1,
      '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
      1,
      
          '92104271-8505-4189-A43D-23F88E25DBEE',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '383289E8-44D0-464D-AD77-9F4C1BD7D658',
      NULL,
      'Zoonotic Indicator',
      'A025E3EE-5A2A-47CC-99DC-63ACF3D98F59',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'DCD7592C-2EDB-42CD-9D42-D0396D1D7918',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'E26D172C-9FF7-4AB1-ACBE-9FC14B22BAB9',
      NULL,
      'Legislation Overview',
      '581D943B-3B52-49D8-99C7-E654BF1BDA96',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '2147EC1F-08CC-4689-B6D2-A0AF867649A7',
      
          'Supporting comments'
        ,
      'Freedom From Hunger And Thirst Comments',
      'CA2A4681-77BE-4056-8AE5-F09D64D95E60',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'B5F80128-2031-4414-9BA7-A18EB64939BB',
      
          'Supporting comments'
        ,
      'Range Of Commodities Compromised Comments',
      '4D00439E-740C-4037-8D30-2E26046AE558',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'FEC172AA-CEAE-476C-B23C-A8BE1FFD763D',
      
          'Surveillance project name'
        ,
      'Reference',
      '1B1FD167-E16B-4297-9BEA-B34C434A998C',
      1,
      'EC6D59BF-5BFA-4BFC-94CD-C929E2E313C0',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '09C1523C-F382-4E46-8468-A94EBEFE0589',
      NULL,
      'Therapeutic Agent Susceptibility',
      '14E5D526-B35A-47AB-AAAD-4A9C2E173099',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'CACA25D5-8E19-468D-812C-A95193ED47D1',
      NULL,
      'Uncertainty',
      '50F4BC33-0011-48E0-9567-B8AE9F891261',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'F41B0195-76F7-4B95-9C9C-2C1DCC376821',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'B7832630-0B66-45C5-8120-A9B34B981097',
      
          'Supporting comments'
        ,
      'Other Control Mechanisms Comments',
      '55940F19-9CE3-4118-A6B1-2311F41FC285',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'C78339DE-D2AD-4C92-B9DE-AB1CD34A0CC1',
      
          'Supporting comments'
        ,
      'Indirect Economic Cost Of Human Illness Comments',
      'D317E180-917A-413B-8606-D0BD4CBC175A',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'D770C9AF-BB81-431C-A3FC-AB263D0D02D6',
      
          'Supporting comments'
        ,
      'Attributable Fraction Comments',
      'F868A520-F31A-43E7-9B93-87E4508073B1',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'D65FCE8E-C0EA-449E-B83D-AC8A8500F838',
      NULL,
      'Risk Of Introduction To GB',
      '55C96DCC-03E8-4650-A055-C97CAAD5BE01',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'CEE054F1-2693-4FD7-A893-D9167E432693',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '69433B2E-38DB-4666-A5C3-AD7B8D4AF4C5',
      
          'Supporting comments'
        ,
      'Date Of Most Recent Occurrence In GB Comments',
      'FBF10EF6-3DFE-4409-BC6F-E9D0A7316368',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      0,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'DE949D70-B6EC-44B5-A82E-AD87AB47F261',
      
          'Supporting comments'
        ,
      'Export Market Value Comments',
      '7D177709-095F-4220-9C2D-B9FC9164C141',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,1
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '2047540D-11FA-4E65-9800-AFE7703F429C',
      
          'Supporting comments'
        ,
      'Wider Rural Community Comments',
      '96318DC8-1FC5-4E15-B0F8-A2EC86752B48',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '7EFBBAD7-12CC-4F94-BBCF-AFF8FF44B8CE',
      
          'Differential diagnoses'
        ,
      'Differential Diagnoses',
      '67F93ED4-CB22-4E0E-8D36-0A06E76D0985',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'AAB9CC41-31C3-4881-A392-B4D65E6D036B',
      
          'Supporting comments'
        ,
      'Average Cost Per Case Comments',
      '6626AA73-8321-4128-961C-88CD5DE73D8D',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'F2A753F4-AE41-4CDD-9163-B77DF3B03806',
      NULL,
      'Impact On Society Summary',
      '48FEE308-AF80-491B-8932-C6F340C24363',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'F2802D49-C0D4-4A7F-BED0-B8A8970EA531',
      
          'Supporting comments'
        ,
      'Geographic Distribution Of Human Disease Comments',
      '585637C0-257C-4366-8819-AAAF8D85A23B',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '14B22362-4A5E-4823-B405-B966F9650613',
      
          'Impact'
        ,
      'Freedom From Fear And Distress',
      '9D9F02FE-2028-4CF9-912B-F2153293828D',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '1D110CBE-4E1D-4F18-9E4C-54AED253A783',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'B38F1F59-EE1D-4764-994A-B96F043ACEFE',
      
          'Supporting comments'
        ,
      'Zoonotic Indicator Comments',
      'A025E3EE-5A2A-47CC-99DC-63ACF3D98F59',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '2AA7A601-6560-4384-AEAD-B9A74018514D',
      NULL,
      'Potential Unplanned Cost To Exchequer',
      'C3EFE5F2-E103-4667-9C14-431D5D98D3BA',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '8187878C-68BF-4144-A3F6-B7B6DF8F7956',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '367EF28D-31A3-46D0-B2A4-BEB38272ED5A',
      NULL,
      'GB Presence Indicator',
      '93B12402-F412-4227-9E86-B929F5C42171',
      1,
      'B1A35FAB-D4CF-4797-8F81-474892DA5251',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '756554D0-8CE0-4244-A3B3-BF9C16C1CC22',
      
          'Supporting comments'
        ,
      'Freedom From Pain Or Injury Comments',
      '61E59EA4-AA92-484B-8151-0BBE0BA1BD7C',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'DC7F7B14-E4D0-48B0-802E-C4353062FA9A',
      
          'Supporting comments'
        ,
      'Level Of National Preparedness Comments',
      '9204DCE4-C357-4BF0-833D-6D371F771078',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '106E6232-7BBB-4945-987B-C5ABCE8040BD',
      
          'Supporting comments'
        ,
      'Impact On Third Country Flows Comments',
      '4F14D5E9-E6FD-40F5-BE80-4DF7BDFE062E',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,1
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '652D2259-FA6F-45A2-BB35-C7745E5056D4',
      
          'Reservoir species or vector?'
        ,
      'Wildlife Reservoir Indicator',
      '9F8B60E7-C1DF-486D-97F4-7B34D228DDE2',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'BC7F05B7-C105-4CAC-B9AF-92210C0F603F',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '46C000D8-96DE-4A15-A232-C785234E8B96',
      
          'Supporting comments'
        ,
      'Total Surveillance Costs Comments',
      'C61B45B4-DC41-4572-A264-4AF007BB4A89',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '8EA70BCB-19B7-4890-A51C-C7AC2525C275',
      
          'Potential?'
        ,
      'Potential To Reduce Human Exposure',
      '53A4A7F1-8300-4E9A-8F5B-726D46F7B4D1',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '4F9A74EC-180D-458C-9DC6-6D35B1FFF8BA',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'FE334744-D887-4547-B1CA-C8751E1F16EB',
      NULL,
      'Annual Number Of Human Cases In GB',
      '79F66ED7-4939-4FF8-9195-6F4AEA723FB2',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '3F19FF76-3D76-458C-9F20-6E6F2AA4B919',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '68BE0CF9-4AE3-4CB4-A030-C8DDBBA62F90',
      
          'Purpose and detail'
        ,
      'Purpose And Detail',
      '1B1FD167-E16B-4297-9BEA-B34C434A998C',
      3,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'F0DA03A4-1841-4D42-BAEE-C97EAD0F8693',
      
          'Supporting comments'
        ,
      'Potential For Risk Change Comments',
      '5790EEAA-1496-4357-A4ED-98B2B991D090',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '50949328-C9FE-41C1-BC96-CE08A772F926',
      
          'Supporting comments'
        ,
      'Level Of Human Exposure To Animal Or Products Comments',
      '418F7B77-78E8-455D-A307-05DA702B16A4',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'B67553CC-F12B-420C-912A-D1C633F83A26',
      
          'Supporting comments'
        ,
      'Commercial Trade Comments',
      '47AB0C86-44CD-45DE-8A3A-5073A44EA73F',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      0,
      NULL,1
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'A989643B-5622-4C36-B432-D2C3899B3BF4',
      NULL,
      'Statutory Obligation To Control',
      '0FEA51E7-D610-4C8F-B344-9A680EDD3B81',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'A7AEFC6D-04EC-4147-8F6C-11238385F381',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '75D1A6F2-554F-41E9-AA6B-D334794E3774',
      
          'Proportion?'
        ,
      'Attributable Fraction',
      'F868A520-F31A-43E7-9B93-87E4508073B1',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          'A9419166-D275-4315-ACBB-BC9B5423B179',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '13955418-8899-44D9-A48B-D6D3DBB838D4',
      
          'Impact?'
        ,
      'Local Agricultural Economy',
      '210B87C7-E283-4B99-A7EB-6BCD315714EB',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '2EA88BA1-A288-417E-A842-312824A6A544',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '1DE4E306-AAEF-4131-8C78-D787DCE79B98',
      NULL,
      'Transmissibility Indicator',
      'B35E3C7F-0651-42FC-B427-6D6D1926F3D1',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '2AE33A23-5954-4166-B4EE-30FB7F9D5FA3',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '7667FC38-62DE-4294-A505-DED03D1817E8',
      
          'Supporting comments'
        ,
      'Human Transmission Mechanism Comments',
      'D298E014-DF8D-4680-B93E-CB62CB2DE2C8',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      0,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'FE7B93AA-DB56-4785-A7E4-DFE1BCA26EF0',
      
          'Supporting comments'
        ,
      'Annual Number Of Human Cases In GB Comments',
      '79F66ED7-4939-4FF8-9195-6F4AEA723FB2',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '8CED4EAB-5458-4519-9DD6-E1062212061A',
      
          'Impact'
        ,
      'Freedom From Discomfort',
      '189E764F-21FB-4EBE-8E50-5262152BCFBF',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '1D110CBE-4E1D-4F18-9E4C-54AED253A783',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'C04698DF-734C-48F3-AD1B-E2097AF20280',
      
          'Supporting comments'
        ,
      'Potential To Reduce Welfare Implications Comments',
      '13B0550B-7F49-4998-98B0-AC4950DA6743',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '1D6286B7-A66D-4172-823D-E3F1D810E396',
      NULL,
      'Impact On Human Health',
      'F9AF0D5F-CE13-4FD9-A1AC-0DD894D6C56A',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'CFD4A65F-A2ED-4C45-9FFF-E41DDCB9E38E',
      
          'Relative importance'
        ,
      'Importance Of Export Trade',
      'EDD8D3A8-C7A1-4B60-A025-5D5BFF2A6CD7',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '982FB2B7-98F1-470D-91D2-7773754423E1',
        1
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '0F34CB48-B774-4EDC-B6E1-E52BD813455F',
      
          'Supporting comments'
        ,
      'Transmission Mechanism Comments',
      'C7BEF5CF-0A53-43B3-A6C4-03C86014E766',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '3EC9ED6A-D7F0-4780-9954-E603479C8B17',
      NULL,
      'Agent Description',
      '01889E3F-2F76-4C4A-8870-B291B3800587',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'EDBC2927-72B1-45FD-B148-E70F601491A3',
      
          'Supporting comments'
        ,
      'Diagnosis Mechanism Comments',
      '49C62B0D-93F4-4880-A6A0-072A804217A6',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '8B73DA0E-5DD6-43BF-837A-E7CBFD1A604D',
      
          'Proportion?'
        ,
      'Proportion Of Animals Affected Suffering Severely',
      '56A3F23B-B097-4203-8295-3DE62F1725ED',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '5E27114E-7F37-4496-B890-231F7E63EBE3',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '68535B51-DACC-41F7-824E-E9627934199D',
      
          'Supporting comments'
        ,
      'Duration Of Disease Comments',
      '2321B085-9F3A-45AE-9022-E4C32B74D78D',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '72BEA5CE-DAA6-4AAF-A75E-EB415880E244',
      
          'Impact'
        ,
      'Freedom To Express Normal Behaviour',
      '3729B39A-9546-4EC9-BFF4-263F0A074820',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '1D110CBE-4E1D-4F18-9E4C-54AED253A783',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '40FDC18B-B3E3-4296-9E9C-EC63537AD15D',
      NULL,
      'Impact On International Trade',
      'A9AE8EF9-FD50-463B-A5A1-64C05B16C176',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'E9FBFAC3-0A69-44BB-A077-EDF86E29946C',
      
          'Uptake at holding level'
        ,
      'Uptake At Holding Level',
      'B8D2BDB4-EB9C-4570-8F0E-CFA3C887C835',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '118E00A5-C8FD-4978-86CC-E35F471E9514',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '74D538E3-342D-4622-89E7-EE0A3752B078',
      
          'Supporting comments'
        ,
      'Impact On Intra Community Flows Comments',
      '4F6FD1E5-F8D8-4169-B3BE-48229F07CAFF',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,1
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '8EACB34C-8058-4947-BA4A-EE376FAAEDDE',
      
          'Supporting comments'
        ,
      'Transmissibility Indicator Comments',
      'B35E3C7F-0651-42FC-B427-6D6D1926F3D1',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'FA9F1405-5D3D-4AC4-9C76-F072C9B6AB02',
      
          'Clinical signs'
        ,
      'Clinical Signs',
      '739B5116-5E5C-4A24-B38B-F4811F32C22B',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '25E9EC19-D3FC-4FC2-A9E0-F2301FF2222A',
      
          'Supporting comments'
        ,
      'Impact On Level Of Imports Comments',
      '354A1B85-99A6-48D6-ADA7-B2E9C2D7E728',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,1
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '5F42D557-73EA-4682-B5DE-F26CD8517174',
      
          'Supporting comments'
        ,
      'Number Of Cases Per Year In GB Comments',
      '3756BE7D-AB87-46ED-841A-AF6FF3CDB325',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '0A8E869F-639C-4FF6-BFC4-F2CE77DDFD4E',
      NULL,
      'Geographic Distribution Of Human Disease',
      '585637C0-257C-4366-8819-AAAF8D85A23B',
      1,
      '1B2BBBC3-1A25-4D20-8F8B-A19167F21C89',
      1,
      
          '948B3612-BEE6-4A07-892A-7861E5FAD085',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'D26DF689-8FA1-4D10-9CA5-F8F325A1AEBF',
      
          'Supporting comments'
        ,
      'Uncertainty Comments',
      '50F4BC33-0011-48E0-9567-B8AE9F891261',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      '95874F6E-CFA3-4DAE-932D-FA908CFAD58C',
      
          'Potential for silent spread'
        ,
      'Potential For Silent Spread',
      '897D6E20-C1D2-4C46-BEEA-5766C9B32DF5',
      1,
      'A6C09C6C-AF89-4DBE-9AF3-5E224B6117F9',
      1,
      
          '118E00A5-C8FD-4978-86CC-E35F471E9514',
        0
      )
    
      INSERT INTO [ProfileField]
      (
      [Id],
      [Name],
      [ShortName],
      [ProfileQuestionId],
      [FieldNumber],
      [DataFieldTypeId],
      [IsMandatory],
      [ReferenceTableId],
      [IsReadOnly]
      )
      VALUES
      (
      'B217F9B9-A18E-4CF3-82ED-FD80C86D9457',
      
          'Supporting comments'
        ,
      'Potential For Silent Spread Comments',
      '897D6E20-C1D2-4C46-BEEA-5766C9B32DF5',
      2,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '383289E8-44D0-464D-AD77-9F4C1BD7D658'
        
          , [IrrelevanceValueId] = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB'
        
        WHERE
        [Id] = '418F7B77-78E8-455D-A307-05DA702B16A4'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '383289E8-44D0-464D-AD77-9F4C1BD7D658'
        
          , [IrrelevanceValueId] = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB'
        
        WHERE
        [Id] = 'B6BECBDB-CDFE-4695-BD5C-0BB72344C78A'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '39C11421-1494-4A29-98F1-0CF7FD363B37'
        
          , [IrrelevanceFlag] = 0
        WHERE
        [Id] = '61E59EA4-AA92-484B-8151-0BBE0BA1BD7C'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '383289E8-44D0-464D-AD77-9F4C1BD7D658'
        
          , [IrrelevanceValueId] = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB'
        
        WHERE
        [Id] = 'CB1DE3F4-FD98-46A2-BC82-12FC88D76EED'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '39C11421-1494-4A29-98F1-0CF7FD363B37'
        
          , [IrrelevanceFlag] = 0
        WHERE
        [Id] = '3729B39A-9546-4EC9-BFF4-263F0A074820'
            
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '39C11421-1494-4A29-98F1-0CF7FD363B37'
        
          , [IrrelevanceFlag] = 0
        WHERE
        [Id] = '56A3F23B-B097-4203-8295-3DE62F1725ED'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '39C11421-1494-4A29-98F1-0CF7FD363B37'
        
          , [IrrelevanceFlag] = 0
        WHERE
        [Id] = '189E764F-21FB-4EBE-8E50-5262152BCFBF'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '367EF28D-31A3-46D0-B2A4-BEB38272ED5A'
        
          , [IrrelevanceFlag] = 0
        WHERE
        [Id] = '745A30C4-5098-4D02-91B2-55E75F54551F'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '383289E8-44D0-464D-AD77-9F4C1BD7D658'
        
          , [IrrelevanceValueId] = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB'
        
        WHERE
        [Id] = 'B35E3C7F-0651-42FC-B427-6D6D1926F3D1'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '383289E8-44D0-464D-AD77-9F4C1BD7D658'
        
          , [IrrelevanceValueId] = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB'
        
        WHERE
        [Id] = '79F66ED7-4939-4FF8-9195-6F4AEA723FB2'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '383289E8-44D0-464D-AD77-9F4C1BD7D658'
        
          , [IrrelevanceValueId] = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB'
        
        WHERE
        [Id] = 'F868A520-F31A-43E7-9B93-87E4508073B1'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '383289E8-44D0-464D-AD77-9F4C1BD7D658'
        
          , [IrrelevanceValueId] = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB'
        
        WHERE
        [Id] = '6626AA73-8321-4128-961C-88CD5DE73D8D'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '383289E8-44D0-464D-AD77-9F4C1BD7D658'
        
          , [IrrelevanceValueId] = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB'
        
        WHERE
        [Id] = '957DBA98-8C70-478A-84FB-97B1BA35E53F'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '383289E8-44D0-464D-AD77-9F4C1BD7D658'
        
          , [IrrelevanceValueId] = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB'
        
        WHERE
        [Id] = '585637C0-257C-4366-8819-AAAF8D85A23B'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '39C11421-1494-4A29-98F1-0CF7FD363B37'
        
          , [IrrelevanceFlag] = 0
        WHERE
        [Id] = '13B0550B-7F49-4998-98B0-AC4950DA6743'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '383289E8-44D0-464D-AD77-9F4C1BD7D658'
        
          , [IrrelevanceValueId] = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB'
        
        WHERE
        [Id] = '50F4BC33-0011-48E0-9567-B8AE9F891261'
    
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '367EF28D-31A3-46D0-B2A4-BEB38272ED5A'
        
          , [IrrelevanceFlag] = 1
        WHERE
        [Id] = '55C96DCC-03E8-4650-A055-C97CAAD5BE01'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '383289E8-44D0-464D-AD77-9F4C1BD7D658'
        
          , [IrrelevanceValueId] = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB'
        
        WHERE
        [Id] = 'D298E014-DF8D-4680-B93E-CB62CB2DE2C8'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '383289E8-44D0-464D-AD77-9F4C1BD7D658'
        
          , [IrrelevanceValueId] = 'CBB4614A-4964-4CD1-8859-829D08CA3DFB'
        
        WHERE
        [Id] = 'D317E180-917A-413B-8606-D0BD4CBC175A'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '367EF28D-31A3-46D0-B2A4-BEB38272ED5A'
        
          , [IrrelevanceFlag] = 1
        WHERE
        [Id] = 'FBF10EF6-3DFE-4409-BC6F-E9D0A7316368'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '39C11421-1494-4A29-98F1-0CF7FD363B37'
        
          , [IrrelevanceFlag] = 0
        WHERE
        [Id] = 'CA2A4681-77BE-4056-8AE5-F09D64D95E60'
      
        UPDATE
        [ProfileQuestion]
        SET
          [IrrelevanceFieldId] = '39C11421-1494-4A29-98F1-0CF7FD363B37'
        
          , [IrrelevanceFlag] = 0
        WHERE
        [Id] = '9D9F02FE-2028-4CF9-912B-F2153293828D'
      
      INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
      [DataFieldTypeId],
      [IsMandatory]
      )
      VALUES
      (
      'E48AA9CA-4A0A-4C4C-B097-150333240874',
      
          'Relative importance of export trade to the industry sector'
        ,
      'Importance Of Export Trade',
      5,
      
          '982FB2B7-98F1-470D-91D2-7773754423E1',
          'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
          1        
      )
    
      INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
      [DataFieldTypeId],
      [IsMandatory]
      )
      VALUES
      (
      '33E63913-09D4-484E-8818-3485D2897FEF',
      
          'Export market value for this species/group'
        ,
      'Export Market Value',
      13,
      
          '982FB2B7-98F1-470D-91D2-7773754423E1',
          'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
          1        
        
      )
    
      INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
      [DataFieldTypeId],
      [IsMandatory]
      )
      VALUES
      (
      '3A5910E4-6E48-4EDB-A916-40AAAD39F122',
      
          'Annual level of export consignments containing animals/commodities in this species/group sent into intracommunity trade'
        ,
      'Impact On Intra Community Flows',
      9,
      
          '982FB2B7-98F1-470D-91D2-7773754423E1',
          'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
          1        
        
      )
    
      INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
      [DataFieldTypeId],
      [IsMandatory]
      )
      VALUES
      (
      '2B3E6845-4D43-4F03-9ACE-5EF35D4DFE1B',
      
          'Potential level of imports for this species/group'
        ,
      'Impact On Level Of Imports',
      7,
      
          '9119A543-114B-4C8C-BF92-128EC64A80DD',
          'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
          1        
        
      )
    
      INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
      [DataFieldTypeId],
      [IsMandatory]
      )
      VALUES
      (
      'D8508D02-644C-4DB7-AFE0-84F66DA95F91',
      
          'Is there substantial commercial trade in this species/group'
        ,
      'Commercial Trade',
      3,
      
          'C9BDCE7D-45FD-4F40-BE03-BB75EE0169C4',
          'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
          1        
        
      )
    
      INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
      [DataFieldTypeId],
      [IsMandatory]
      )
      VALUES
      (
      '3BC53920-3AAF-43DA-9753-A4FECCF3FDE4',
      
          'Name'
        ,
      'Description',
      1,
      NULL,
      'ec6d59bf-5bfa-4bfc-94cd-c929e2e313c0',
      1
      )
    
      INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
      [DataFieldTypeId],
      [IsMandatory]
      )
      VALUES
      (
      'FF59C6DB-10EE-43D2-AC57-ABD20CBD802F',
      
          'Annual level of export consignments containing animals commodities of this species/group sent into third country trade'
        ,
      'Impact On Third Country Flows',
      11,
      
          '982FB2B7-98F1-470D-91D2-7773754423E1',
          'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
          1        
        
      )
    
      INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
      [DataFieldTypeId],
      [IsMandatory]
      )
      VALUES
      (
      'D6AB8580-E240-412B-9915-F506DB19F40D',
      
          'Parent'
        ,
      'Parent Id',
      2,
      NULL,
          'a6c09c6c-af89-4dbe-9af3-5e224b6117f9',
          0        
      )
    
 INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
      [DataFieldTypeId],
      [IsMandatory]
      )
      VALUES
      (
      '7641f411-ee1a-4135-a502-007ab080b41a',
      
          'Annual level of export consignments containing animals commodities of this species/group sent into third country trade: Supporting comments'
        ,
      'Impact On Third Country Flows Comments',
      12,
      NULL,
          'd297f63b-638a-4574-b042-97c248338a26',
          1        
      )

INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
      [DataFieldTypeId],
      [IsMandatory]
      )
      VALUES
      (
      '08c76c6d-48f6-477c-b123-6820707b09ec',
      
          'Is there substantial commercial trade in this species/group: Supporting comments'
        ,
      'Commercial Trade Comments',
      4,
      NULL,
          'd297f63b-638a-4574-b042-97c248338a26',
          0        
      )

INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
      [DataFieldTypeId],
      [IsMandatory]
      )
      VALUES
      (
      '03477d37-30cc-4878-826a-9414dd288d63',
      
          'Export market value for this species/group: Supporting comments'
        ,
      'Export Market Value Comments',
      14,
      NULL,
          'd297f63b-638a-4574-b042-97c248338a26',
          1        
      )
      
INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
      [DataFieldTypeId],
      [IsMandatory]
      )
      VALUES
      (
      '34119d63-c218-43e2-bebb-b2d91d57927d',
      
          'Potential level of imports for this species/group: Supporting comments'
        ,
      'Impact On Level Of Imports Comments',
      8,
      NULL,
          'd297f63b-638a-4574-b042-97c248338a26',
          1        
      )
      
INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
      [DataFieldTypeId],
      [IsMandatory]
      )
      VALUES
      (
      'fe30e671-91eb-4f12-ab47-deb08473dfe7',
      
          'Relative importance of export trade to the industry sector: Supporting comments'
        ,
      'Importance Of Export Trade Comments',
      6,
      NULL,
          'd297f63b-638a-4574-b042-97c248338a26',
          1        
      )
      
      INSERT INTO [SpeciesField]
      (
      [Id],
      [Name],
      [ShortName],
      [FieldNumber],
      [ReferenceTableId],
      [DataFieldTypeId],
      [IsMandatory]
      )
      VALUES
      (
      '615589a7-8fe3-4070-82db-ea4161c346e0',
      
          'Annual level of export consignments containing animals/commodities in this species/group sent into intracommunity trade: Supporting comments'
        ,
      'Impact On Intra Community Flows Comments',
      10,
      NULL,
          'd297f63b-638a-4574-b042-97c248338a26',
          1        
      )
      
    ALTER TABLE [dbo].[Species] DROP CONSTRAINT [FK_Species_Species]

    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '9BE9134E-785D-43C7-B4B5-02D60FCF2B12',
      
          '1D7517F6-5CBF-49E7-84A8-A351643B3A10'
        ,
      'Lizards',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '2',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '3C9D7C93-F2CC-4135-9066-040F8CFB74A9',
      
          '1D7517F6-5CBF-49E7-84A8-A351643B3A10'
        ,
      'Snakes',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '1',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '7E0991C4-16E5-46DC-9B51-08BF5C615340',
      
          'D5B745EB-58F3-4D1C-9261-70F91CFC6F2D'
        ,
      'Red squirrel',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '15A88419-33D3-466F-9825-0B1C92579924',
      
          '0DDE39FB-E094-40DB-8766-C60712A12DA7'
        ,
      'Farmed deer',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      '44EA0EF7-C369-41E1-B6A7-65D49AA6D90E',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '8D3FB77E-6192-4228-8A10-112CC0AED844',
      
          '06374DBD-9810-4369-85D0-D9C02F45BEF7'
        ,
      'Domestic donkeys',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '1FC793BF-E645-468C-9C0B-123DC694C756',
      
          'EBCFBA5E-9DCA-4625-9972-AE189269E937'
        ,
      'Wild rodent species',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'D3CEB37C-5499-4A57-B65A-148D6F90DF8F',
      
          '7B5DD930-C400-4A99-8933-5D08DA352AD1'
        ,
      'Wild feline species',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '676E94F4-DCCE-48E8-9719-1831E6D131AF',
      
          'B5A4B5B6-FBD1-4D1B-B006-572A76E175D8'
        ,
      'Stringiformes (owls)',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '35D06A19-8714-4C5A-9676-187BB00E1416',
      
          '7B5DD930-C400-4A99-8933-5D08DA352AD1'
        ,
      'Domestic dogs',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'CB02A6CA-82E0-401F-B7EB-18A2C8B525D2',
      
          '1FC793BF-E645-468C-9C0B-123DC694C756'
        ,
      'Rats and mice',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'D08346FB-7E5F-4FDF-9FCE-1956BE13695E',
      
          'A3ABA3AF-EA38-4B44-B30E-36EABB95C365'
        ,
      'Chickens',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      '59ef471a-ca72-479e-8717-93ff37f85f7c',
      '9C2B1788-94CA-4721-B9F4-F02BB4234F9B',
      '59EF471A-CA72-479E-8717-93FF37F85F7C',
      '59EF471A-CA72-479E-8717-93FF37F85F7C',
      '15374cc2-8f09-44eb-bc64-99b74b9e0ee4',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '69D4B711-DE5F-490A-A791-1CC62B12EB33',
      
          'F0E307F3-42AA-4836-9786-FB804091BD15'
        ,
      'Native and introduced captive birds',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '6',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '3A34278F-8ADF-48A7-A096-1DC849B6EB97',
      
          '1FC793BF-E645-468C-9C0B-123DC694C756'
        ,
      'Voles',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'EEEC830E-4E1D-4DAA-8048-2894CEF9DD8E',
      
          '59103E04-BE61-4485-8AA6-50ACE86928AD'
        ,
      'Frogs and toads',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '2A60CEDD-8496-4AF4-8B19-2BCA3BFBF4D3',
      
          'BBF13765-852C-47E1-A8CB-6726F9EA3F13'
        ,
      'Wild suids',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '6CF1B8DE-E659-4FA8-90E3-2E874546D5EB',
      
          'EBCFBA5E-9DCA-4625-9972-AE189269E937'
        ,
      'Exotic rodents',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '961A0298-5BC7-4BF5-9BCF-2F689035313A',
      
          '590813B3-C263-4604-99E6-E1094682DF79'
        ,
      'Lagomorphs',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '6',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'C852BF70-7384-40E7-8250-2F74953A43A8',
      
          '7B5DD930-C400-4A99-8933-5D08DA352AD1'
        ,
      'Domestic ferrets',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '80731488-C0F3-4657-A270-31A8CA10F034',
      
          '7B5DD930-C400-4A99-8933-5D08DA352AD1'
        ,
      'Other exotic carnivores',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'C703B3A5-2DB0-44B5-A480-35F96F6D68AE',
      
          '9B8541E5-5318-4949-A587-F86271F4CDFB'
        ,
      'Domestic pigs',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      '59ef471a-ca72-479e-8717-93ff37f85f7c',
      'C6019511-6CAA-4FF5-9DB6-73F6E18071DF',
      '15374CC2-8F09-44EB-BC64-99B74B9E0EE4',
      '59EF471A-CA72-479E-8717-93FF37F85F7C',
      '15374cc2-8f09-44eb-bc64-99b74b9e0ee4',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '3F6F385C-F84F-4BE7-99F9-3652525D13C2',
      
          '9B8541E5-5318-4949-A587-F86271F4CDFB'
        ,
      'Farmed wild boar',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'CC9E82B5-B95F-456E-A39D-36D2DED5D689',
      
          'F0E307F3-42AA-4836-9786-FB804091BD15'
        ,
      'Farmed ratites (excluding zoo kept)',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      '44EA0EF7-C369-41E1-B6A7-65D49AA6D90E',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      
          '3',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'A3ABA3AF-EA38-4B44-B30E-36EABB95C365',
      
          'F0E307F3-42AA-4836-9786-FB804091BD15'
        ,
      'Domestic poultry (commercial and domestic)',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '1',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '5BF8FAC5-D6F9-4CE5-8111-37D6B3E7AD2D',
      
          'A3ABA3AF-EA38-4B44-B30E-36EABB95C365'
        ,
      'Geese',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      '44EA0EF7-C369-41E1-B6A7-65D49AA6D90E',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '601829A3-B35B-4201-A5C7-3B4B7AD2E331',
      
          '06374DBD-9810-4369-85D0-D9C02F45BEF7'
        ,
      'Exotic equids',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '0F8ECF35-7152-461C-A019-3E0CCFBFC1DD',
      
          '0DDE39FB-E094-40DB-8766-C60712A12DA7'
        ,
      'Exotic deer',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'DD4E2BC0-BFC0-4BAA-9FA2-40236C51A076',
      
          '961A0298-5BC7-4BF5-9BCF-2F689035313A'
        ,
      'Domestic rabbits',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '4E338318-FB5C-43E4-8CBA-45644B0AD02A',
      
          '7B5DD930-C400-4A99-8933-5D08DA352AD1'
        ,
      'Wild canid species',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '58C5C147-160F-4570-AE9F-482CBAD26022',
      
          'B5A4B5B6-FBD1-4D1B-B006-572A76E175D8'
        ,
      'Ciconiiformes (herons, egrets, bittern, storks)',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '51637B4F-9EC2-4012-B23D-4A22DF4EE5A9',
      
          '06374DBD-9810-4369-85D0-D9C02F45BEF7'
        ,
      'Domestic horses',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      '15374cc2-8f09-44eb-bc64-99b74b9e0ee4',
      '9C2B1788-94CA-4721-B9F4-F02BB4234F9B',
      '59EF471A-CA72-479E-8717-93FF37F85F7C',
      '59EF471A-CA72-479E-8717-93FF37F85F7C',
      '59ef471a-ca72-479e-8717-93ff37f85f7c',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'DC550788-916F-4779-9F3E-4F5833E1E99E',
      
          '59103E04-BE61-4485-8AA6-50ACE86928AD'
        ,
      'Other amphibians',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '718AE92E-BB38-4CB0-A045-4F8F61A7BD38',
      
          '0DDE39FB-E094-40DB-8766-C60712A12DA7'
        ,
      'Wild deer',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '59103E04-BE61-4485-8AA6-50ACE86928AD',
      
          '1D7517F6-5CBF-49E7-84A8-A351643B3A10'
        ,
      'Amphibians',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '5',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'D437412A-5DEB-4D6C-9780-54248CAFC8FC',
      
          '975073EE-272C-4B27-81E8-641B429EA68D'
        ,
      'Badger',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'B5A4B5B6-FBD1-4D1B-B006-572A76E175D8',
      
          'F0E307F3-42AA-4836-9786-FB804091BD15'
        ,
      'Native and introduced free ranging birds',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '7',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'DB7CB716-7D64-493F-BC17-5A1582B1562D',
      
          'D3CEB37C-5499-4A57-B65A-148D6F90DF8F'
        ,
      'Exotic felids',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'E8F74058-F944-4BEA-B9C5-5AA449641CEF',
      
          'B5A4B5B6-FBD1-4D1B-B006-572A76E175D8'
        ,
      'Passerines (song and perching birds)',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '7B5DD930-C400-4A99-8933-5D08DA352AD1',
      
          '590813B3-C263-4604-99E6-E1094682DF79'
        ,
      'Carnivores',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '5',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '71AED3DD-8140-4CAB-B265-5FC169F3DA45',
      
          'D5B745EB-58F3-4D1C-9261-70F91CFC6F2D'
        ,
      'Grey squirrel',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'D3C25124-B6E9-45E3-B77E-62BC48DDBC16',
      
          '961A0298-5BC7-4BF5-9BCF-2F689035313A'
        ,
      'Hares',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '9DFEBA6E-70B4-4CF9-8709-634A0F049577',
      
          'B5A4B5B6-FBD1-4D1B-B006-572A76E175D8'
        ,
      'Podicipediformes (grebes and divers)',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '4CFC4C6C-C921-4DDD-9C0E-640815174D35',
      
          '961A0298-5BC7-4BF5-9BCF-2F689035313A'
        ,
      'Wild rabbits',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '975073EE-272C-4B27-81E8-641B429EA68D',
      
          '7B5DD930-C400-4A99-8933-5D08DA352AD1'
        ,
      'Wild mustelid species',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '44A23A89-4E58-4EC4-B798-64A4872D0099',
      
          '59103E04-BE61-4485-8AA6-50ACE86928AD'
        ,
      'Newts',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '0C3E42BB-DD6F-48C2-8114-65554DA4D588',
      
          'B5A4B5B6-FBD1-4D1B-B006-572A76E175D8'
        ,
      'Procellariiformes (fulmars, shearwaters, petrels)',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '2AD9B6C1-CD31-4706-990A-669E0D3851A0',
      
          'A3ABA3AF-EA38-4B44-B30E-36EABB95C365'
        ,
      'Ducks',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'C6019511-6CAA-4FF5-9DB6-73F6E18071DF',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'BBF13765-852C-47E1-A8CB-6726F9EA3F13',
      
          '590813B3-C263-4604-99E6-E1094682DF79'
        ,
      'Suids',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '2',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'DC7AA1EB-C445-4A40-8A67-677D6BB0DDEB',
      
          'F0E307F3-42AA-4836-9786-FB804091BD15'
        ,
      'Racing pigeons',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      '44EA0EF7-C369-41E1-B6A7-65D49AA6D90E',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      
          '5',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'C4CB5B4E-D751-4E44-B802-67C9EAC79E7D',
      
          'B5A4B5B6-FBD1-4D1B-B006-572A76E175D8'
        ,
      'Charadriiformes (gulls, terns, waders)',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '7EBE7594-AD82-4EBF-9F7D-6D0FC69C7955',
      
          '590813B3-C263-4604-99E6-E1094682DF79'
        ,
      'Ruminants',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '1',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'D5B745EB-58F3-4D1C-9261-70F91CFC6F2D',
      
          '1FC793BF-E645-468C-9C0B-123DC694C756'
        ,
      'Squirrel',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '651F0337-3FBC-4528-BAEF-74D113BF16DA',
      
          'EBCFBA5E-9DCA-4625-9972-AE189269E937'
        ,
      'Domestic pet rodents',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '3156B15C-D974-4F4F-8111-79A315A38E90',
      
          '7EBE7594-AD82-4EBF-9F7D-6D0FC69C7955'
        ,
      'Domestic goats',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'C6019511-6CAA-4FF5-9DB6-73F6E18071DF',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'C7D3F231-2051-489E-B228-7AD71DA8BBC1',
      
          'C723CEEA-DFA9-4CEA-86A0-BC253D07E93B'
        ,
      'Quail',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'C6019511-6CAA-4FF5-9DB6-73F6E18071DF',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'ED3CD067-FB44-4A1A-8BDE-7F867FB12271',
      
          '4E338318-FB5C-43E4-8CBA-45644B0AD02A'
        ,
      'Exotic canids',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '7C62C987-653F-4939-AAC1-8A040496AE7B',
      
          'A3ABA3AF-EA38-4B44-B30E-36EABB95C365'
        ,
      'Turkeys',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'C6019511-6CAA-4FF5-9DB6-73F6E18071DF',
      '15374CC2-8F09-44EB-BC64-99B74B9E0EE4',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '742C504F-7B1B-4658-9EEF-91C6D72EEDB1',
      
          'C723CEEA-DFA9-4CEA-86A0-BC253D07E93B'
        ,
      'Grouse',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '4238A47A-027E-4C03-B712-933A6A63A15F',
      
          'FFDA231F-3AB2-4E80-897A-A03FF3D95A39'
        ,
      'New world camelids',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      '44EA0EF7-C369-41E1-B6A7-65D49AA6D90E',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'A455887A-EC1E-4A0D-89B9-9C5B1897ADB6',
      
          '4E338318-FB5C-43E4-8CBA-45644B0AD02A'
        ,
      'Red fox',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'FFDA231F-3AB2-4E80-897A-A03FF3D95A39',
      
          '590813B3-C263-4604-99E6-E1094682DF79'
        ,
      'Camelids',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '4',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '31A23AF5-3293-4408-8CA6-A0CA1EE8A079',
      
          'FFDA231F-3AB2-4E80-897A-A03FF3D95A39'
        ,
      'Old world camelids',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '1D7517F6-5CBF-49E7-84A8-A351643B3A10',
      NULL,
      'Reptiles',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '3',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '2F91BE0B-A0CE-44CD-B680-A620DCFC2D2A',
      
          '7EBE7594-AD82-4EBF-9F7D-6D0FC69C7955'
        ,
      'Domestic cattle',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      '15374cc2-8f09-44eb-bc64-99b74b9e0ee4',
      'C6019511-6CAA-4FF5-9DB6-73F6E18071DF',
      '59EF471A-CA72-479E-8717-93FF37F85F7C',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'ef0b0c60-529f-4970-b19b-9afa0178c4e5',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '25B64B65-FF7A-4994-B936-A8C5AEBDC0CA',
      
          'F0E307F3-42AA-4836-9786-FB804091BD15'
        ,
      'Farmed columbiforms (pigeons and doves)',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      '44EA0EF7-C369-41E1-B6A7-65D49AA6D90E',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      
          '4',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '46DE32FA-D219-4C5D-B13F-A9AC0061FD9B',
      
          'D3CEB37C-5499-4A57-B65A-148D6F90DF8F'
        ,
      'Scottish wild cat',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'EBCFBA5E-9DCA-4625-9972-AE189269E937',
      
          '590813B3-C263-4604-99E6-E1094682DF79'
        ,
      'Rodents',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '7',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'F08B2511-0017-44B9-80AC-B1416E3BFFE7',
      
          'B5A4B5B6-FBD1-4D1B-B006-572A76E175D8'
        ,
      'Falconiformes',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '11B51AC3-FD60-4B72-B044-B41C94E45FC6',
      
          'B5A4B5B6-FBD1-4D1B-B006-572A76E175D8'
        ,
      'Columbiforms (pigeons and doves)',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '0FE31D38-3895-4213-9858-B7298ADD4B6F',
      
          'B5A4B5B6-FBD1-4D1B-B006-572A76E175D8'
        ,
      'Pelicaniforms (gannet, cormorant, shag)',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'CE2CB8E1-A22F-42AF-AB4B-B94EFBAF39BE',
      
          '7EBE7594-AD82-4EBF-9F7D-6D0FC69C7955'
        ,
      'Domestic sheep',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      '59EF471A-CA72-479E-8717-93FF37F85F7C',
      'C6019511-6CAA-4FF5-9DB6-73F6E18071DF',
      '15374cc2-8f09-44eb-bc64-99b74b9e0ee4',
      'ef0b0c60-529f-4970-b19b-9afa0178c4e5',
      '59EF471A-CA72-479E-8717-93FF37F85F7C',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '4B59C50D-08F3-4BC3-8DEB-BB0C2349C025',
      
          '7EBE7594-AD82-4EBF-9F7D-6D0FC69C7955'
        ,
      'Exotic bovids',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '6A3F903C-97E5-4233-AAF0-BC188058B947',
      
          'C723CEEA-DFA9-4CEA-86A0-BC253D07E93B'
        ,
      'Partridge',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      'C6019511-6CAA-4FF5-9DB6-73F6E18071DF',
      '15374CC2-8F09-44EB-BC64-99B74B9E0EE4',
      '15374CC2-8F09-44EB-BC64-99B74B9E0EE4',
      'EF0B0C60-529F-4970-B19B-9AFA0178C4E5',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'C723CEEA-DFA9-4CEA-86A0-BC253D07E93B',
      
          'F0E307F3-42AA-4836-9786-FB804091BD15'
        ,
      'Gamebirds (excluding zoo kept)',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '2',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '00BF9610-97D7-4E8B-B0C6-C259046AB3EC',
      
          '1D7517F6-5CBF-49E7-84A8-A351643B3A10'
        ,
      'Chelonia',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '3',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '0DDE39FB-E094-40DB-8766-C60712A12DA7',
      
          '7EBE7594-AD82-4EBF-9F7D-6D0FC69C7955'
        ,
      'Deer',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'BE6598D7-1C17-488B-BB2E-C89D9A8265C0',
      
          '590813B3-C263-4604-99E6-E1094682DF79'
        ,
      'Other mammals',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '8',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '8395B4B4-FBA3-45AC-83EE-CBFF762CBCCC',
      
          '7B5DD930-C400-4A99-8933-5D08DA352AD1'
        ,
      'Domestic cats',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '833C0E8C-E456-4E7D-B042-D0061B1CC3C7',
      
          '69D4B711-DE5F-490A-A791-1CC62B12EB33'
        ,
      'Captive birds-kept by zoos etc',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'FFA5167D-C3E8-4553-A54D-D274B4E3C2C5',
      
          '06374DBD-9810-4369-85D0-D9C02F45BEF7'
        ,
      'Zoo species perisodactyla',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'B6D73037-82A6-4487-81E3-D3A4DBCE9B71',
      
          'B5A4B5B6-FBD1-4D1B-B006-572A76E175D8'
        ,
      'Anseriformes',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '06374DBD-9810-4369-85D0-D9C02F45BEF7',
      
          '590813B3-C263-4604-99E6-E1094682DF79'
        ,
      'Perisodactyla',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '3',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '98F8FD4E-AF76-437E-8FD3-DADD6E1A6D40',
      
          '69D4B711-DE5F-490A-A791-1CC62B12EB33'
        ,
      'Captive birds-kept as indoor or aviary pets',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'B5DCB560-B8DA-4C37-B02A-DC205CF71311',
      
          'B5A4B5B6-FBD1-4D1B-B006-572A76E175D8'
        ,
      'Gruiformes (coots, rails and crakes)',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '6BA6C4F7-BD7B-49C4-A42C-DC67864742C3',
      
          'C723CEEA-DFA9-4CEA-86A0-BC253D07E93B'
        ,
      'Pheasants',
      '656DCD50-BDF7-46D0-8AA8-B0BBD687039C',
      '15374cc2-8f09-44eb-bc64-99b74b9e0ee4',
      '9C2B1788-94CA-4721-B9F4-F02BB4234F9B',
      '15374CC2-8F09-44EB-BC64-99B74B9E0EE4',
      '15374CC2-8F09-44EB-BC64-99B74B9E0EE4',
      'ef0b0c60-529f-4970-b19b-9afa0178c4e5',
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '590813B3-C263-4604-99E6-E1094682DF79',
      NULL,
      'Mammals',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '1',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '966FCC96-C76C-4B33-907D-EF03D5367580',
      
          '975073EE-272C-4B27-81E8-641B429EA68D'
        ,
      'Other mustelids',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '06104599-EB2E-411A-B726-F2D97089AE47',
      
          '1D7517F6-5CBF-49E7-84A8-A351643B3A10'
        ,
      'Crocodilians',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '4',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'F7281D48-80F8-4EDF-93A8-F2F467398BEC',
      
          'B5A4B5B6-FBD1-4D1B-B006-572A76E175D8'
        ,
      'Psittacines (parrots, macaws, lories)',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      '9B8541E5-5318-4949-A587-F86271F4CDFB',
      
          'BBF13765-852C-47E1-A8CB-6726F9EA3F13'
        ,
      'Domestic swine',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      NULL,
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
      )
    
      INSERT INTO [Species]
      (
      [Id],
      [ParentId],
      [Name],
      [CommercialTrade],
      [ImportanceOfExportTrade],
      [ImpactOnLevelOfImports],
      [ImpactOnIntraCommunityFlows],
      [ImpactOnThirdCountryFlows],
      [ExportMarketValue],
      [SequenceNumber],
      [CommercialTradeComments],
      [ImportanceOfExportTradeComments],
      [ImpactOnLevelOfImportsComments],
      [ImpactOnIntraCommunityFlowsComments],
      [ImpactOnThirdCountryFlowsComments],
      [ExportMarketValueComments]
      )
      VALUES
      (
      'F0E307F3-42AA-4836-9786-FB804091BD15',
      NULL,
      'Birds',
      '5D3B5094-2432-47C5-B3B0-B15E317FB5D6',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '8B2A0A96-3C6E-4231-83C7-9CB693BAB3DC',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      '1F2F83C0-E0B7-4338-9ACF-EDC53F0C7DD7',
      
          '2',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded',
          'Not commercially traded'       
        
      )
    

    ALTER TABLE [dbo].[Species]  WITH CHECK ADD  CONSTRAINT [FK_Species_Species] FOREIGN KEY([ParentId])
    REFERENCES [dbo].[Species] ([Id])

    
      INSERT INTO [PrioritisationCategory]
      (
      [Id],
      [Name],
      [IrrelevanceFieldId],
      [IrrelevanceValueId],
      [IrrelevanceFlag]
      )
      VALUES
      (
      'A1EA4C86-D087-4A54-B3A0-5CA33288A346',
      'International trade',
      
          '78CEE922-DDFC-469F-8614-2F01ABF79F9A'
        ,
      
          '5D3B5094-2432-47C5-B3B0-B15E317FB5D6'
        ,
      NULL
      )
    
      INSERT INTO [PrioritisationCategory]
      (
      [Id],
      [Name],
      [IrrelevanceFieldId],
      [IrrelevanceValueId],
      [IrrelevanceFlag]
      )
      VALUES
      (
      '0BE9F729-8669-4CCA-9426-7737F75397D9',
      'Public health',
      
          '383289E8-44D0-464D-AD77-9F4C1BD7D658'
        ,
      
          'CBB4614A-4964-4CD1-8859-829D08CA3DFB'
        ,
      NULL
      )
    
      INSERT INTO [PrioritisationCategory]
      (
      [Id],
      [Name],
      [IrrelevanceFieldId],
      [IrrelevanceValueId],
      [IrrelevanceFlag]
      )
      VALUES
      (
      'CC99BFDF-6621-4390-84D6-91218A40DF1D',
      'Risk and epidemiology',
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [PrioritisationCategory]
      (
      [Id],
      [Name],
      [IrrelevanceFieldId],
      [IrrelevanceValueId],
      [IrrelevanceFlag]
      )
      VALUES
      (
      'A873901C-DEA8-4C0F-855F-A5AEFAA2F704',
      'Welfare',
      
          '39C11421-1494-4A29-98F1-0CF7FD363B37'
        ,
      NULL,
      0
      )
    
      INSERT INTO [PrioritisationCategory]
      (
      [Id],
      [Name],
      [IrrelevanceFieldId],
      [IrrelevanceValueId],
      [IrrelevanceFlag]
      )
      VALUES
      (
      '78A69A3D-9482-4025-BE0B-AEB6BAADDABB',
      'Wider society',
      NULL,
      NULL,
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'B88F4BF0-3C2A-48AC-822C-0189C87B9C5B',
      'CC99BFDF-6621-4390-84D6-91218A40DF1D',
      'RE11',
      'Uptake of control measures applied at the holding level',
      50,
      NULL,
      'E9FBFAC3-0A69-44BB-A077-EDF86E29946C',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '198722DD-F904-4DA7-9CA2-0620B5EA82C2',
      '0BE9F729-8669-4CCA-9426-7737F75397D9',
      'PH10',
      'Maximum severity of disease in people',
      1,
      NULL,
      '1156C38B-42C6-464A-BD06-131BAE2BC51F',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '4A685626-A7D4-4F81-BBC3-08F6E6C32003',
      'A873901C-DEA8-4C0F-855F-A5AEFAA2F704',
      'WE01',
      'Number of cases, at the modal severity, per year in Great Britain',
      21,
      NULL,
      'E843BF5F-9482-4AAD-BAD0-9113B96E7FE1',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'CE0A361A-B998-41E7-B424-0B9AF591D8E8',
      'A1EA4C86-D087-4A54-B3A0-5CA33288A346',
      'IT06',
      'Is there an obligation to control this disease under EU law',
      66,
      NULL,
      'A989643B-5622-4C36-B432-D2C3899B3BF4',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'AD720108-03B7-44FA-9F74-1B5C2B0F0D8E',
      '0BE9F729-8669-4CCA-9426-7737F75397D9',
      'PH11',
      'Human-animal (or products) Interaction and exposure',
      40,
      NULL,
      'E6C08E8A-9258-4DB0-9D91-24AF8B32B172',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '93FE637F-B831-4132-8A6B-1F71B803748A',
      'CC99BFDF-6621-4390-84D6-91218A40DF1D',
      'RE02',
      'Transmissibility',
      1,
      NULL,
      'ECF5E96A-CD7B-479F-84C6-8272AF79C88A',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'DBA652AB-BB4F-457E-8FBE-2C9109DD7E93',
      'A873901C-DEA8-4C0F-855F-A5AEFAA2F704',
      'WE10',
      'Impact on freedom to express normal behaviour',
      1,
      NULL,
      '72BEA5CE-DAA6-4AAF-A75E-EB415880E244',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '0202D258-B3E4-4C8C-9777-3856CEDAFEA9',
      '0BE9F729-8669-4CCA-9426-7737F75397D9',
      'PH09',
      'Uncertainty',
      55,
      NULL,
      'CACA25D5-8E19-468D-812C-A95193ED47D1',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'BA7F975A-684A-4148-8B2D-3A76DEDA3524',
      'CC99BFDF-6621-4390-84D6-91218A40DF1D',
      'RE10',
      'Wildlife reservoir',
      1,
      NULL,
      '652D2259-FA6F-45A2-BB35-C7745E5056D4',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '649082D2-788F-4F41-A623-3C2A4E1B39AB',
      '78A69A3D-9482-4025-BE0B-AEB6BAADDABB',
      'WS24',
      'Wider rural community',
      1,
      NULL,
      '4C4CD781-FED9-4CAC-A3F0-7E67BE82A7A7',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'A14298BB-3C16-4DC1-94B7-3FB74F0ACDED',
      'A873901C-DEA8-4C0F-855F-A5AEFAA2F704',
      'WE12',
      'Impact of likely or statutory control measures',
      1,
      NULL,
      '52BE906A-3E8C-4E14-A277-0A556A0D05C5',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '35891467-E5C6-4DC7-9FA8-464F9F26ED7B',
      '78A69A3D-9482-4025-BE0B-AEB6BAADDABB',
      'WS08',
      'Potential unplanned cost to exchequer',
      10,
      NULL,
      '2AA7A601-6560-4384-AEAD-B9A74018514D',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '0F127948-F0DD-4540-A011-48566EEC43DF',
      'A873901C-DEA8-4C0F-855F-A5AEFAA2F704',
      'WE03',
      'Duration of welfare impact',
      1,
      NULL,
      '239C26CF-1759-45B4-B7AA-722195D70DB2',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '9E6AEB40-D8EF-485A-B226-50B8F82FE66E',
      'A873901C-DEA8-4C0F-855F-A5AEFAA2F704',
      'WE11',
      'Impact on freedom from fear and distress',
      1,
      NULL,
      '14B22362-4A5E-4823-B405-B966F9650613',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '2958D62E-46D6-4793-A889-56668429A7B7',
      'A1EA4C86-D087-4A54-B3A0-5CA33288A346',
      'IT09',
      'Annual level of export consignments containing animals/commodities in each species sent into third country trade',
      1,
      NULL,
      '9A429CF0-7435-470D-9C22-319708F1E721',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '09322102-9D62-4663-924D-5E70CDC1A8DD',
      'CC99BFDF-6621-4390-84D6-91218A40DF1D',
      'RE01',
      'Current prevalence (endemic diseases) OR risk of incursion (exotic diseases)',
      4,
      
          '367EF28D-31A3-46D0-B2A4-BEB38272ED5A'
        ,
      '6AD5F071-9412-4FDE-8F15-082B5FF5FB02',
      
          'D65FCE8E-C0EA-449E-B83D-AC8A8500F838'
        
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'FBDBB16A-94CF-43B2-A664-678B628BBB52',
      '0BE9F729-8669-4CCA-9426-7737F75397D9',
      'PH03',
      'Transmissibility (humans)',
      99,
      NULL,
      '1DE4E306-AAEF-4131-8C78-D787DCE79B98',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '11DECCAF-0945-4F7B-BD49-725854B3F1AF',
      '78A69A3D-9482-4025-BE0B-AEB6BAADDABB',
      'WS21',
      'Global environment',
      1,
      NULL,
      '73854A00-7B2C-4452-87A4-846CF4BDCEA9',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '4CE1B0C9-F26B-4C92-B6B1-7C380A509966',
      'CC99BFDF-6621-4390-84D6-91218A40DF1D',
      'RE08',
      'Potential for silent spread',
      65,
      NULL,
      '95874F6E-CFA3-4DAE-932D-FA908CFAD58C',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '2B4E7E02-09A6-4368-AA9D-7E6D442A040C',
      'A1EA4C86-D087-4A54-B3A0-5CA33288A346',
      'IT08',
      'Annual level of export consignments containing animals/commodities in each species sent into intracommunity trade',
      1,
      NULL,
      'F2801477-78C8-4A34-A35B-8B64CDFEB471',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '39E305D8-7CB0-4F6D-9E88-822A622C0C1D',
      '0BE9F729-8669-4CCA-9426-7737F75397D9',
      'PH06',
      'Average cost per case',
      1,
      NULL,
      'F44C465F-99EE-4780-AC14-6040880856E9',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'A3D947FA-2935-4AEE-96B0-A0AE6461C213',
      'CC99BFDF-6621-4390-84D6-91218A40DF1D',
      'RE12',
      'Level of national preparedness or level of implementation for endemics/welfare issues',
      1,
      NULL,
      '2D0FF667-E077-4ABF-8551-622A04FB6A8C',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'EFAA8531-EFE7-4CF0-A4B9-A3F507F58FF1',
      'CC99BFDF-6621-4390-84D6-91218A40DF1D',
      'RE06',
      'Potential for risk increase',
      1,
      NULL,
      '87DA7961-C443-4E8E-B8CD-559CB2C2B0C6',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '5F1196DB-7CC8-45DB-93AB-AFD355DF841C',
      'CC99BFDF-6621-4390-84D6-91218A40DF1D',
      'RE03',
      'Efficacy, practicality and uptake of control measures applied at the holding level',
      5,
      NULL,
      '114C5FD3-10FF-41C8-9B09-13377D45DFF6',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '53A30261-2C7B-4159-9E9D-B29564302AC9',
      'A1EA4C86-D087-4A54-B3A0-5CA33288A346',
      'IT04',
      'Resource and time required to re-establish trading status',
      99,
      NULL,
      'DDDD01DE-AD39-45F8-B691-1A0E02EEB97B',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '36D7A0BD-FD41-4046-9531-B935EEC6A16D',
      '0BE9F729-8669-4CCA-9426-7737F75397D9',
      'PH02',
      'Modal severity of human disease',
      4,
      NULL,
      'B658405A-DBC2-47DF-943F-4B889453DCED',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '4A63BB0A-BE4E-4E03-A81A-BAF0598DA920',
      '78A69A3D-9482-4025-BE0B-AEB6BAADDABB',
      'WS22',
      'Local environment',
      1,
      NULL,
      'A0CF81AF-C6D1-4B62-A0C4-4228ECCA4D7A',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'BC4C9E3A-39D6-44BE-8CB3-BE4A5FAC6DDD',
      '0BE9F729-8669-4CCA-9426-7737F75397D9',
      'PH08',
      'Attributable fraction (animal)',
      50,
      NULL,
      '75D1A6F2-554F-41E9-AA6B-D334794E3774',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '1C3EFE14-25EF-4546-92D5-C0BE3CF236E6',
      'A873901C-DEA8-4C0F-855F-A5AEFAA2F704',
      'WE05',
      'Level of sentience',
      1,
      NULL,
      '830906FA-0860-496C-816C-45FF963BAF50',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '7FD01EED-AFD3-445F-ABDC-CC36958D5EE8',
      'A873901C-DEA8-4C0F-855F-A5AEFAA2F704',
      'WE08',
      'Impact on freedom from discomfort',
      1,
      NULL,
      '8CED4EAB-5458-4519-9DD6-E1062212061A',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '4E481036-517F-4F31-9C45-CFCB1DF23BC3',
      '0BE9F729-8669-4CCA-9426-7737F75397D9',
      'PH01',
      'Number of cases (human disease)',
      99,
      NULL,
      'FE334744-D887-4547-B1CA-C8751E1F16EB',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'C89EDC33-118D-42C7-B917-D472F1C7F317',
      'A1EA4C86-D087-4A54-B3A0-5CA33288A346',
      'IT01',
      'Potential for restricting impact by regionalisation',
      15,
      NULL,
      '57F81031-D5DE-443A-838B-0DC7AB9D4454',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '6E223561-31D8-466A-8714-D990CFE63A1A',
      '0BE9F729-8669-4CCA-9426-7737F75397D9',
      'PH07',
      'Indirect effects',
      87,
      NULL,
      '5DDE04BE-201E-4F64-8916-506207290572',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'D5E06EA0-8917-427C-81D1-DA362A557433',
      'CC99BFDF-6621-4390-84D6-91218A40DF1D',
      'RE04',
      'Efficacy of control measures implemented above the holding level',
      5,
      NULL,
      '349F1DE4-38EC-4D1F-9B7F-54DC4AF1B30A',
      NULL
      )
        
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'DD8A4657-A00F-45D7-B861-DC661411D5BE',
      'A873901C-DEA8-4C0F-855F-A5AEFAA2F704',
      'WE13',
      'Proportion of animals affected suffering severely',
      1,
      NULL,
      '8B73DA0E-5DD6-43BF-837A-E7CBFD1A604D',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '91CD55C3-B98F-4A62-A17F-DD36945D2E5C',
      'A1EA4C86-D087-4A54-B3A0-5CA33288A346',
      'IT07',
      'Range of commodities, the export of which is/would be compromised',
      1,
      NULL,
      'CF83A24C-6885-4329-8FCA-248BFE4B7509',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'E3AD25B3-5969-4532-9A33-EE7A4D3EBB95',
      'A873901C-DEA8-4C0F-855F-A5AEFAA2F704',
      'WE09',
      'Impact on freedom from pain, injury or disease',
      1,
      NULL,
      '9B5BDC1A-57F7-416F-81D6-1706F254B26F',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      '0B81298D-F3D9-4CDA-80D8-F6BFC728A42D',
      'A1EA4C86-D087-4A54-B3A0-5CA33288A346',
      'IT03',
      'Relative importance of export trade to industry sector',
      95,
      NULL,
      'CFD4A65F-A2ED-4C45-9FFF-E41DDCB9E38E',
      NULL
      )
    
      INSERT INTO [PrioritisationCriterion]
      (
      [Id],
      [PrioritisationCategoryId],
      [Code],
      [Name],
      [Weighting],
      [MappingFlag],
      [TrueMapping],
      [FalseMapping]
      )
      VALUES
      (
      'E892598B-F369-4EC0-9C53-FBEB87F3745F',
      '78A69A3D-9482-4025-BE0B-AEB6BAADDABB',
      'WS23',
      'Local agricultural economy',
      1,
      NULL,
      '13955418-8899-44D9-A48B-D6D3DBB838D4',
      NULL
      )
    
            INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'D0F00550-C6E1-4547-B6C6-049291F6D37D',
      '2958D62E-46D6-4793-A889-56668429A7B7',
      'Low',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'B8E37AF6-BC90-4334-A1C0-07E327D69439',
      'DBA652AB-BB4F-457E-8FBE-2C9109DD7E93',
      'Minor',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'B854BCE7-B226-4FA3-87D0-09A1AAA57DDB',
      '11DECCAF-0945-4F7B-BD49-725854B3F1AF',
      'Negligible',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '81721769-28D7-4CC6-833B-0A13EE6419E8',
      '4CE1B0C9-F26B-4C92-B6B1-7C380A509966',
      'Low',
      85,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '0D5EFBB9-4D24-455C-8761-0A661AAEACAA',
      '0F127948-F0DD-4540-A011-48566EEC43DF',
      'Months',
      0,
      5
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '48D8A28C-EC0C-4F64-BA50-0B5FFB13EF06',
      'CE0A361A-B998-41E7-B424-0B9AF591D8E8',
      'No',
      3,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '857EA143-6212-4C7E-9827-0C9CA5B75EAC',
      'A3D947FA-2935-4AEE-96B0-A0AE6461C213',
      'Medium',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '70B4130C-A593-4D8D-82C7-0D0E433D489D',
      'D5E06EA0-8917-427C-81D1-DA362A557433',
      'Medium',
      5,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'D7B0E587-9DC2-409D-8BF3-11C24D6CF7AB',
      'AD720108-03B7-44FA-9F74-1B5C2B0F0D8E',
      'High',
      6,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '1EC4195D-2DB7-4346-AA62-126852391317',
      'CE0A361A-B998-41E7-B424-0B9AF591D8E8',
      'Yes',
      1,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '208E6AF1-1F67-4FF4-B861-14C1BF76F6C2',
      '1C3EFE14-25EF-4546-92D5-C0BE3CF236E6',
      'Severe',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '470395AA-4347-4324-A886-16C6D9AD47AF',
      '2B4E7E02-09A6-4368-AA9D-7E6D442A040C',
      'Medium',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'DB1A77FA-F206-423B-AC91-17B225C4427C',
      'DBA652AB-BB4F-457E-8FBE-2C9109DD7E93',
      'None',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'BD6DB44C-8EA3-4829-8F1F-1BE3478FCF6A',
      'E892598B-F369-4EC0-9C53-FBEB87F3745F',
      'Medium',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'B2A24774-E406-4F6E-941F-21361CFF5398',
      '0F127948-F0DD-4540-A011-48566EEC43DF',
      'Not applicable',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '69FB53C5-D420-4495-92B9-21C257BCEB78',
      '35891467-E5C6-4DC7-9FA8-464F9F26ED7B',
      'Medium',
      1,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'B919B54E-B775-4DCE-B669-21CFB267746D',
      '649082D2-788F-4F41-A623-3C2A4E1B39AB',
      'High',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '0DBBA5A4-825F-4C32-B787-225A4923AEAF',
      '4A63BB0A-BE4E-4E03-A81A-BAF0598DA920',
      'Very low',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'A53707D6-9C6A-4115-875B-225B3A048189',
      '4A63BB0A-BE4E-4E03-A81A-BAF0598DA920',
      'Low',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '0C78A9ED-3E90-47B2-ACE6-25C7E0C3F3C2',
      '39E305D8-7CB0-4F6D-9E88-822A622C0C1D',
      'Very high',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '32CD2EDA-A410-4AA3-A414-27D97F413416',
      '09322102-9D62-4663-924D-5E70CDC1A8DD',
      '>2-10% / Very low',
      1,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '41BC8459-DB8D-4607-B28C-282F481CE34F',
      '39E305D8-7CB0-4F6D-9E88-822A622C0C1D',
      'Medium',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '8547663B-5412-432B-8A1C-2874D9964720',
      '36D7A0BD-FD41-4046-9531-B935EEC6A16D',
      'Life threatening / maiming',
      5,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'A86C0C3E-8D78-4959-B622-298EF860500E',
      '11DECCAF-0945-4F7B-BD49-725854B3F1AF',
      'Very low',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'CA0E5DA1-4043-43C0-81B3-2A2ACB8E4D0B',
      '4A685626-A7D4-4F81-BBC3-08F6E6C32003',
      '10s',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'EB4EBA14-D549-41C9-98B0-2C40AD31014F',
      '198722DD-F904-4DA7-9CA2-0620B5EA82C2',
      'High',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '1C74759B-37BF-4A75-8DDB-2F053D6B2D46',
      '53A30261-2C7B-4159-9E9D-B29564302AC9',
      'High',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '3D2519ED-129B-4177-86BE-30BD43670CD5',
      '93FE637F-B831-4132-8A6B-1F71B803748A',
      'Low',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'A45C1D6C-BE58-48E6-B01A-31822388FE11',
      'DD8A4657-A00F-45D7-B861-DC661411D5BE',
      'Low',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'F50492E2-F619-4B0E-A7D6-3230F6A75B51',
      '5F1196DB-7CC8-45DB-93AB-AFD355DF841C',
      'High',
      5,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '592E55F1-CB11-45B5-90F4-34C6337FE49D',
      '35891467-E5C6-4DC7-9FA8-464F9F26ED7B',
      'Low',
      2,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '2695AB60-2699-4F21-AB23-35461903943C',
      'BA7F975A-684A-4148-8B2D-3A76DEDA3524',
      'Considerable uncertainty',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'AF1C81B8-3BFF-49AB-9D6A-36E76C5ACA0A',
      '7FD01EED-AFD3-445F-ABDC-CC36958D5EE8',
      'None',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'E7D25100-CAC4-4FF6-BDB2-37329EFADB01',
      '649082D2-788F-4F41-A623-3C2A4E1B39AB',
      'Medium',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'B0C9E20F-6680-46D3-9FEE-3A06CBA54E18',
      'BA7F975A-684A-4148-8B2D-3A76DEDA3524',
      'Yes',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '8B562581-027B-44F2-A582-3B6D99465B47',
      'EFAA8531-EFE7-4CF0-A4B9-A3F507F58FF1',
      'High',
      0,
      5
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'E7CDBEC2-956C-4B5E-84E0-3D78C1632D5F',
      'E892598B-F369-4EC0-9C53-FBEB87F3745F',
      'Low',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'FAF52C5A-F1BA-4E4C-9570-3E2894A07A86',
      'B88F4BF0-3C2A-48AC-822C-0189C87B9C5B',
      'Low',
      1,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'EFFC905C-ED19-4CDF-AE7D-3F3905229A33',
      '1C3EFE14-25EF-4546-92D5-C0BE3CF236E6',
      'Moderate',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '80B1562A-D736-4E3D-9D09-462075A40DC1',
      '09322102-9D62-4663-924D-5E70CDC1A8DD',
      '>50% / High',
      2,
      5
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'EE0CB900-B64F-401D-B623-4A25F90ECB8C',
      '198722DD-F904-4DA7-9CA2-0620B5EA82C2',
      'Low',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'E318171F-9E51-462C-8E67-509F3D192E25',
      'A14298BB-3C16-4DC1-94B7-3FB74F0ACDED',
      'None',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '602ADE34-4441-42CE-B62F-511FD6D36E93',
      '93FE637F-B831-4132-8A6B-1F71B803748A',
      'Very high',
      0,
      5
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'F8A1DCF2-8280-4E18-9DC9-5157835E34DD',
      '93FE637F-B831-4132-8A6B-1F71B803748A',
      'High',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'B16B855E-3FF4-4863-9386-517B8FAA55AC',
      '6E223561-31D8-466A-8714-D990CFE63A1A',
      'Very high',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'F13D47D7-490F-4494-904B-518AC47F4EDF',
      '53A30261-2C7B-4159-9E9D-B29564302AC9',
      'Low',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '09D02F5A-08BA-4185-BD3C-55602DF0AC44',
      'E892598B-F369-4EC0-9C53-FBEB87F3745F',
      'Very low',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'AAE15B9A-DBE2-4491-83ED-56C03855CB8C',
      '0B81298D-F3D9-4CDA-80D8-F6BFC728A42D',
      'Medium',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'FEDAE7E7-1B67-40A6-98D9-5840658138FE',
      '2958D62E-46D6-4793-A889-56668429A7B7',
      'Not commercial',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '348760C3-2DA5-4DD7-80A0-593D30381AFE',
      'CE0A361A-B998-41E7-B424-0B9AF591D8E8',
      'To some extent',
      2,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'F121B021-6155-48B6-86A5-597683B6B198',
      'D5E06EA0-8917-427C-81D1-DA362A557433',
      'High',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'D64F7E1B-CB84-4E16-9352-598010EC394D',
      'E3AD25B3-5969-4532-9A33-EE7A4D3EBB95',
      'Moderate',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '642875A8-C743-4257-9564-59E344AF5F63',
      '39E305D8-7CB0-4F6D-9E88-822A622C0C1D',
      'Low',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '22382E20-063D-4ABF-A4C6-5AA40C7A5122',
      '91CD55C3-B98F-4A62-A17F-DD36945D2E5C',
      'Very high',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '8B70EEB3-FB5B-467D-AFFB-5E3C9EBE39A5',
      '2958D62E-46D6-4793-A889-56668429A7B7',
      'Medium',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '10CE587E-17F9-4BEE-9FF2-5F0AC9F23323',
      'AD720108-03B7-44FA-9F74-1B5C2B0F0D8E',
      'Medium',
      7,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '10814717-0087-4F28-A5AE-60AF8A39A044',
      '36D7A0BD-FD41-4046-9531-B935EEC6A16D',
      'Serious',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '55C0EC98-15D4-4685-940B-61814F85D978',
      'E3AD25B3-5969-4532-9A33-EE7A4D3EBB95',
      'Severe',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '83B485E8-A4F8-46FD-998A-6790D9C9DA9C',
      '5F1196DB-7CC8-45DB-93AB-AFD355DF841C',
      'Medium',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'DB2A0630-E96E-4964-A7B8-687736258CDB',
      '35891467-E5C6-4DC7-9FA8-464F9F26ED7B',
      'High',
      3,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'DE3513EC-1E11-44CA-9C8B-69166E94629E',
      'FBDBB16A-94CF-43B2-A664-678B628BBB52',
      'Rare',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '8FFB3704-11CE-4C17-A284-6AA354E3D391',
      'B88F4BF0-3C2A-48AC-822C-0189C87B9C5B',
      'Medium',
      2,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'F78465DB-AB13-473D-BD28-6B5BE9C84E6A',
      '1C3EFE14-25EF-4546-92D5-C0BE3CF236E6',
      'None',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '3A87D62C-522D-4211-9EDF-6D46CF98BB2C',
      '4E481036-517F-4F31-9C45-CFCB1DF23BC3',
      'Low',
      2,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'F5197732-EC80-4263-AD61-6EFA7E2418D5',
      'FBDBB16A-94CF-43B2-A664-678B628BBB52',
      'Very slow / not applicable',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '9F3BBE32-8A51-4DAF-A770-7144B3A01F2A',
      '2B4E7E02-09A6-4368-AA9D-7E6D442A040C',
      'Low',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '8700AC07-460A-4BD7-8D85-7218E72515A1',
      '5F1196DB-7CC8-45DB-93AB-AFD355DF841C',
      'Low',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '29ACB9A0-C03D-4093-A2E9-731F36E73C3E',
      '0202D258-B3E4-4C8C-9777-3856CEDAFEA9',
      'Medium uncertainty',
      7,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '8F2A8561-B1C0-4D3F-9C5D-737B2154F17F',
      '7FD01EED-AFD3-445F-ABDC-CC36958D5EE8',
      'Moderate',
      78,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '3261CD19-195D-40E3-8E0C-742201E6032E',
      '649082D2-788F-4F41-A623-3C2A4E1B39AB',
      'Very low',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '110F8D51-AA98-44EC-ACE3-76E50A6484AD',
      '4CE1B0C9-F26B-4C92-B6B1-7C380A509966',
      'Medium',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '6BC8FB42-2007-42C1-9B7A-78C4ABC0F4C0',
      'DD8A4657-A00F-45D7-B861-DC661411D5BE',
      'None',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '04520E08-FAB7-41C2-B627-78C74B1D1FD1',
      '1C3EFE14-25EF-4546-92D5-C0BE3CF236E6',
      'Minor',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'EF41F8A0-B749-4706-B582-7A851D0A9C70',
      'FBDBB16A-94CF-43B2-A664-678B628BBB52',
      'Occasional',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '08195E05-4E72-4296-893C-85C095BDA188',
      '649082D2-788F-4F41-A623-3C2A4E1B39AB',
      'Low',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'D26B4DFC-51A9-4651-A0BD-8C62BB5B7614',
      'EFAA8531-EFE7-4CF0-A4B9-A3F507F58FF1',
      'Low',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '2620ED33-8D10-41DC-8696-8E2AA8C56ABA',
      '4A685626-A7D4-4F81-BBC3-08F6E6C32003',
      '100Ks',
      3,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'DD43CF29-FE27-4393-A1C0-8F9C449016FA',
      '4E481036-517F-4F31-9C45-CFCB1DF23BC3',
      'Medium',
      3,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'E50E33EF-C1E8-4962-AEB5-9153E7E84359',
      '0B81298D-F3D9-4CDA-80D8-F6BFC728A42D',
      'Not commercial',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '7E0CD769-64EA-444F-BBB8-96D51C82CE35',
      '6E223561-31D8-466A-8714-D990CFE63A1A',
      'Medium',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '88346BE6-52C3-473B-B9E7-979DC6EC14BB',
      '91CD55C3-B98F-4A62-A17F-DD36945D2E5C',
      'High',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '9666527B-8FCC-40D3-B55B-98D0767D42ED',
      '4CE1B0C9-F26B-4C92-B6B1-7C380A509966',
      'High',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'FF8E37C2-CD26-4C7B-8D79-9959F4711C43',
      '9E6AEB40-D8EF-485A-B226-50B8F82FE66E',
      'Minor',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'EBA635EC-9273-4A3B-9CB8-99666D63D918',
      '0F127948-F0DD-4540-A011-48566EEC43DF',
      'Years',
      0,
      6
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '55C5641E-F727-4DA2-86E4-997BFCE9F7CF',
      '53A30261-2C7B-4159-9E9D-B29564302AC9',
      'Medium',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '6807A095-8E41-4DEB-948F-9EF282E8DA1D',
      'AD720108-03B7-44FA-9F74-1B5C2B0F0D8E',
      'Very low',
      18,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '9D3E3242-A3F6-4B8F-8765-A15C30771AFA',
      '4A685626-A7D4-4F81-BBC3-08F6E6C32003',
      '1000s',
      4,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '95C5ED9D-1701-4BC5-A647-A19CD27A4621',
      '6E223561-31D8-466A-8714-D990CFE63A1A',
      'Low',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '8EB1A506-414F-4180-B4F4-A1EEAFFAB3CB',
      '35891467-E5C6-4DC7-9FA8-464F9F26ED7B',
      'Very high',
      5,
      5
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '7DC6C923-E2D9-4890-B72F-A43DF2199319',
      'EFAA8531-EFE7-4CF0-A4B9-A3F507F58FF1',
      'No change',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '6EDDFB22-A5B6-40A0-B800-A52869F5A916',
      'A14298BB-3C16-4DC1-94B7-3FB74F0ACDED',
      'Medium',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'B51BB2FB-727D-4478-95AC-A55A07BD04AC',
      '91CD55C3-B98F-4A62-A17F-DD36945D2E5C',
      'Medium',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'C8ED2E53-B5F4-4555-84AF-A591082489DC',
      'E3AD25B3-5969-4532-9A33-EE7A4D3EBB95',
      'None',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'F837B749-ADB6-4406-ABBE-A625E03CFD4D',
      '93FE637F-B831-4132-8A6B-1F71B803748A',
      'None',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'C63E50A6-7FCB-4ACD-A804-A9DD63E4742B',
      '4A685626-A7D4-4F81-BBC3-08F6E6C32003',
      'Millions',
      5,
      5
      )
        
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '410941F2-03FB-4680-9681-AAA7A4A1976B',
      'D5E06EA0-8917-427C-81D1-DA362A557433',
      'Low',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '77C605AA-906B-4ADD-99ED-AB174CD1E5F6',
      'EFAA8531-EFE7-4CF0-A4B9-A3F507F58FF1',
      'Reduction',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '15A05868-368D-465F-A2DF-AB72A50E05DE',
      '36D7A0BD-FD41-4046-9531-B935EEC6A16D',
      'Mild',
      6,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'CC631658-7780-4776-B9A4-AD64E5158478',
      '39E305D8-7CB0-4F6D-9E88-822A622C0C1D',
      'High',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '0D64F881-A313-492F-BE2D-B29FE273E7E0',
      'DD8A4657-A00F-45D7-B861-DC661411D5BE',
      'High',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '08553EA9-377D-4139-BAD6-B3CD130D059F',
      '0B81298D-F3D9-4CDA-80D8-F6BFC728A42D',
      'Low',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '71AF48BF-3193-471A-BBC5-B623C6C8B138',
      '9E6AEB40-D8EF-485A-B226-50B8F82FE66E',
      'Moderate',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'F0088B67-EB07-43BC-A151-B8058CB30A9A',
      '35891467-E5C6-4DC7-9FA8-464F9F26ED7B',
      'Negligible',
      4,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '9496AD78-C1EE-4A2D-93D5-B8283BF393A7',
      'E892598B-F369-4EC0-9C53-FBEB87F3745F',
      'Very high',
      0,
      5
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'E9CCB6AD-AA4D-48EA-8850-B84CE40E02FF',
      'E892598B-F369-4EC0-9C53-FBEB87F3745F',
      'High',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '67822EAF-AC8F-4232-BFFC-B9D85A4A9269',
      'FBDBB16A-94CF-43B2-A664-678B628BBB52',
      'Common',
      0,
      5
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '87F2DE81-A8C2-46A8-98D4-BAB53F2AFFF5',
      'BC4C9E3A-39D6-44BE-8CB3-BE4A5FAC6DDD',
      'Negligible',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '1BCE965F-924A-4C6D-A727-BADFF94991F9',
      '36D7A0BD-FD41-4046-9531-B935EEC6A16D',
      'Medium',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '8C676DB5-FA45-44B8-8BA1-BC0619BA0BB9',
      '0B81298D-F3D9-4CDA-80D8-F6BFC728A42D',
      'High',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '11CBF027-A194-446F-B74E-BCB3A4C233AB',
      'DD8A4657-A00F-45D7-B861-DC661411D5BE',
      'Medium',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'C75CBB2C-F6B5-4EB6-A392-BD19A95522E2',
      'FBDBB16A-94CF-43B2-A664-678B628BBB52',
      'Uncommon',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '4384071D-938A-4BBB-9330-C31B5BD049B1',
      '198722DD-F904-4DA7-9CA2-0620B5EA82C2',
      'Very high',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '644D0AEA-5B99-4784-8538-C61289E70BF0',
      '2B4E7E02-09A6-4368-AA9D-7E6D442A040C',
      'Not commercial',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'FB6D6C56-EBF1-4644-8840-C8C3F6937256',
      '0202D258-B3E4-4C8C-9777-3856CEDAFEA9',
      'High uncertainty',
      14,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'E395EFBA-1935-48CB-A506-CAA30196C692',
      '4A63BB0A-BE4E-4E03-A81A-BAF0598DA920',
      'Negligible',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '6044350A-650B-4A52-B636-CCAFAF797CEE',
      '4E481036-517F-4F31-9C45-CFCB1DF23BC3',
      'Very low',
      4,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'E04CEB69-8E7A-4EA2-86DE-CF90FD422B79',
      'BC4C9E3A-39D6-44BE-8CB3-BE4A5FAC6DDD',
      'Medium',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '05BCE82C-1B97-436F-B3C2-D13D161D8503',
      '09322102-9D62-4663-924D-5E70CDC1A8DD',
      '>20-50% / Medium',
      3,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '855FB1AC-8E36-4213-9FA6-D245EDB00FB0',
      '2958D62E-46D6-4793-A889-56668429A7B7',
      'High',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'F87B0EC2-2A9E-48AD-A230-D44AE1B87228',
      'BC4C9E3A-39D6-44BE-8CB3-BE4A5FAC6DDD',
      'High',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '2765D36D-5F4E-47C8-8352-D4CB129FBF53',
      '0202D258-B3E4-4C8C-9777-3856CEDAFEA9',
      'Low uncertainty',
      21,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'B4C5FDBE-6432-442F-963D-D5856CC69F2C',
      '9E6AEB40-D8EF-485A-B226-50B8F82FE66E',
      'None',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '1565D3D6-3FDC-4D42-A4C1-D59DE2C0648D',
      'C89EDC33-118D-42C7-B917-D472F1C7F317',
      'High',
      1,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '0B7BE09E-ED98-4AB2-B071-D677733F0BDB',
      'AD720108-03B7-44FA-9F74-1B5C2B0F0D8E',
      'Low',
      9,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'A1726350-82CD-4386-99D4-D88F317655BD',
      'A14298BB-3C16-4DC1-94B7-3FB74F0ACDED',
      'Low',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'CDE47094-0B9C-4D1C-9937-D8E8395070E8',
      '6E223561-31D8-466A-8714-D990CFE63A1A',
      'High',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '93426EF8-85C3-492C-BFCA-D916E46E6617',
      '0F127948-F0DD-4540-A011-48566EEC43DF',
      'Hours',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '21572EC1-37E2-4BCA-A820-D9B6909318EE',
      '4E481036-517F-4F31-9C45-CFCB1DF23BC3',
      'High',
      5,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '276F3080-340D-4005-8990-D9F1021B2BF9',
      'C89EDC33-118D-42C7-B917-D472F1C7F317',
      'None',
      2,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '4800DCF4-E567-4E59-B8D8-DF58D024B1D0',
      'A3D947FA-2935-4AEE-96B0-A0AE6461C213',
      'Low',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '4419C806-460A-421A-967B-DFCCDDCF143D',
      'DBA652AB-BB4F-457E-8FBE-2C9109DD7E93',
      'Severe',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '3751A821-C729-4DD5-9AFE-E0CCCAF94FE9',
      '09322102-9D62-4663-924D-5E70CDC1A8DD',
      '>0-2% / Negligible',
      4,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'C65C9D3C-6E11-46D4-A108-E1E5A8FF253F',
      'C89EDC33-118D-42C7-B917-D472F1C7F317',
      'Some',
      3,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'EF3D585C-6198-43BA-B06E-E207D9669868',
      'E3AD25B3-5969-4532-9A33-EE7A4D3EBB95',
      'Minor',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '6117CA6F-9608-4720-90E8-E300E7574C3D',
      'EFAA8531-EFE7-4CF0-A4B9-A3F507F58FF1',
      'Medium',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '957888F0-C359-4799-B17E-E3E0C1B462B7',
      'A3D947FA-2935-4AEE-96B0-A0AE6461C213',
      'High',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '51EE3CEC-441E-40C3-BC1A-E50E263A1BC0',
      'B88F4BF0-3C2A-48AC-822C-0189C87B9C5B',
      'High',
      3,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'CBEF2E07-978C-4FAE-ABC1-E6DC3D65926F',
      'AD720108-03B7-44FA-9F74-1B5C2B0F0D8E',
      'Very high',
      10,
      5
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'B3E5BCF1-51D3-4647-A684-E727C29174F6',
      '198722DD-F904-4DA7-9CA2-0620B5EA82C2',
      'Medium',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'DAC49391-8D7C-4572-8C34-EBE00159681E',
      '91CD55C3-B98F-4A62-A17F-DD36945D2E5C',
      'Low',
      0,
      1
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '075D759F-54A0-4698-971F-EE5A6ECF686E',
      '7FD01EED-AFD3-445F-ABDC-CC36958D5EE8',
      'Severe',
      75,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '4047855B-7B0B-4CE8-9B02-EF18FD0F8D9B',
      '4A63BB0A-BE4E-4E03-A81A-BAF0598DA920',
      'Medium',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'FBCE2B45-71A8-4447-9988-EFFF036F8416',
      '7FD01EED-AFD3-445F-ABDC-CC36958D5EE8',
      'Minor',
      0,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '342272BD-6834-4FCA-B88A-F13D98843766',
      'BA7F975A-684A-4148-8B2D-3A76DEDA3524',
      'No',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '52678BB8-F12B-4C20-BBB7-F22C2CA60843',
      '93FE637F-B831-4132-8A6B-1F71B803748A',
      'Medium',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '3FE2510C-F1AA-458E-8649-F27DE2B4C456',
      '649082D2-788F-4F41-A623-3C2A4E1B39AB',
      'Very high',
      0,
      5
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'A8877699-17D9-44F5-A25F-F3D7672EFA53',
      '0F127948-F0DD-4540-A011-48566EEC43DF',
      'Weeks',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '41B036EA-96A2-4298-8890-F538588789A9',
      'A14298BB-3C16-4DC1-94B7-3FB74F0ACDED',
      'High',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '829C34E7-C5B2-4F6F-ADEB-F6E9DA2F5BEA',
      'DBA652AB-BB4F-457E-8FBE-2C9109DD7E93',
      'Moderate',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'D15F29BD-0F1A-4824-A62B-F7E6898D1E4A',
      '4A685626-A7D4-4F81-BBC3-08F6E6C32003',
      '100s',
      6,
      2
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '6218FA18-7A89-4C88-981C-F8DC68DBC67B',
      '9E6AEB40-D8EF-485A-B226-50B8F82FE66E',
      'Severe',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      'B7C358E3-865E-4B03-BECC-FAE61231F15C',
      '2B4E7E02-09A6-4368-AA9D-7E6D442A040C',
      'High',
      0,
      4
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '33F42ABF-8E39-4598-861E-FE4893EA6CDF',
      '0F127948-F0DD-4540-A011-48566EEC43DF',
      'Days',
      0,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '4C419848-FE7D-4FDF-8321-FF805A898760',
      '09322102-9D62-4663-924D-5E70CDC1A8DD',
      '>10-20% / Low',
      8,
      3
      )
    
      INSERT INTO [PrioritisationCriterionValue]
      (
      [Id],
      [PrioritisationCriterionId],
      [CriterionValue],
      [Score],
      [SequenceNumber]
      )
      VALUES
      (
      '48F4B88E-3B76-4458-8998-FF9B8DA26113',
      'BC4C9E3A-39D6-44BE-8CB3-BE4A5FAC6DDD',
      'Very low',
      4,
      2
      )
    