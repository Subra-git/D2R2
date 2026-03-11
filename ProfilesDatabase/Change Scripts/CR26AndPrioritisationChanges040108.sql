/*
CR26 Multi-species summary of risk and epidemiology
*/
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
      'D053CFB2-1763-4A7F-AF56-54C29C2F84F2',
      
          'Multi-species summary of risk and epidemiology'

      ,
      'Multi Species Summary',
      '03022a5f-37fe-4b5f-a93a-f1fc95555df1',
      21,
      0,
      0,
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam dignissim dui ac odio. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis euismod nulla vel mauris. Ut non leo.'
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
      'BA50C83A-9948-45F1-BA14-035400B2BC4B',
      
          NULL
        ,
      'Multi Species Summary',
      'D053CFB2-1763-4A7F-AF56-54C29C2F84F2',
      1,
      'D297F63B-638A-4574-B042-97C248338A26',
      1,
      NULL,0
      )
    
GO

ALTER TABLE [Epidemiology]
ADD  [MultiSpeciesSummary] text NULL
GO 

-- also requires rerun of CreateProfileStoredProcedures.sql

/* 2763 IT12 Prioritisation Criterion not needed */
DELETE
	[ProfileVersionSpeciesPrioritisation]
FROM
	[ProfileVersionSpeciesPrioritisation] INNER JOIN [PrioritisationCriterionValue] ON [ProfileVersionSpeciesPrioritisation].[PrioritisationCriterionValueId] = [PrioritisationCriterionValue].[Id]
	INNER JOIN [PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE
	[PrioritisationCriterion].[Code] = 'IT12'
GO

DELETE
	[PrioritisationCriterionValue]
FROM
	[PrioritisationCriterionValue] INNER JOIN [PrioritisationCriterion] ON [PrioritisationCriterionValue].[PrioritisationCriterionId] = [PrioritisationCriterion].[Id]
WHERE
	[PrioritisationCriterion].[Code] = 'IT12'
GO

DELETE FROM
	[PrioritisationCriterion]
WHERE
	[PrioritisationCriterion].Code = 'IT12'	
GO

--also requires rerun of CreatePrioritisationStoredProcedures.sql

/* 2765 "Not commercial" option should be removed from prioritisation criteria IT03, IT08 and IT09*/
DELETE FROM
	[PrioritisationCriterionValue]
WHERE
	[PrioritisationCriterionValue].[CriterionValue] = 'Not commercial'
GO

/* 2764 Prioritisation criteria need renaming */
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Annual number of human cases of the disease in GB'
WHERE
	[Code] = 'PH01'

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Modal severity of human disease'
WHERE
	[Code] = 'PH02'
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Transmissibility between humans in GB society'
WHERE
	[Code] = 'PH03'		

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Average cost per case'
WHERE
	[Code] = 'PH06'		

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Indirect economic costs of human illness'
WHERE
	[Code] = 'PH07'		

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Proportion of human cases in GB attributable to exposure to animals or animal products from GB'
WHERE
	[Code] = 'PH08'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Uncertainty: Assessment of the current state of knowledge of the public health significance of this infection or issue'
WHERE
	[Code] = 'PH09'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Likelihood of serious human morbidity'
WHERE
	[Code] = 'PH10'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Level of human-animal (or products) interaction/ exposure'
WHERE
	[Code] = 'PH11'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Number of clinical cases, at the modal severity, per year in GB'
WHERE
	[Code] = 'WE01'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Modal duration of welfare impact experienced by animals in GB'
WHERE
	[Code] = 'WE03'	

UPDATE
	[PrioritisationCriterion]
SET
	[Code] = 'WE07',
	[Name] = 'Impact on freedom from hunger and thirst'
WHERE
	[Code] = 'WE05'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on freedom from discomfort'
WHERE
	[Code] = 'WE08'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on freedom from pain, injury or disease'
WHERE
	[Code] = 'WE09'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on freedom to express normal behaviour'
WHERE
	[Code] = 'WE10'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on freedom from fear and distress'
WHERE
	[Code] = 'WE11'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Welfare impact of likely or statutory control measures'
WHERE
	[Code] = 'WE12'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Proportion of infected and/or affected animals affected suffering more severely than the mode'
WHERE
	[Code] = 'WE13'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Total potential unplanned cost to exchequer'
WHERE
	[Code] = 'WS08'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on the global environment'
WHERE
	[Code] = 'WS21'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on the local environment'
WHERE
	[Code] = 'WS22'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on the sector that produces this species'
WHERE
	[Code] = 'WS23'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact on the wider rural community'
WHERE
	[Code] = 'WS24'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Potential for restricting impact by regionalisation/ zoning or compartmentalisation'
WHERE
	[Code] = 'IT01'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Relative importance of export trade to the industry sector'
WHERE
	[Code] = 'IT03'	
	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Resource and time required to re-establish intra-community trading status'
WHERE
	[Code] = 'IT04'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Is there an obligation to control this disease under EU law?'
WHERE
	[Code] = 'IT06'	

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Impact of this disease on the breadth of trade in animals and animal products (live animals and/or products)'
WHERE
	[Code] = 'IT07'	
	
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Annual level of export consignments containing animals/ commodities of this species sent into intracommunity trade'
WHERE
	[Code] = 'IT08'	
		
UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Annual level of export consignments containing animals/ commodities of this species sent into third country trade'
WHERE
	[Code] = 'IT09'		

UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Current holding level prevalence / Risk of introduction into animals in GB'
WHERE
	[Code] = 'RE01'	
	
	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Rate of spread on and between affected premises'
WHERE
	[Code] = 'RE02'	

	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Efficacy and practicality of control applied at the holding level'
WHERE
	[Code] = 'RE03'	
	
	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Efficacy of control measures to prevent dissemination in or between animals that are implemented above holding level'
WHERE
	[Code] = 'RE04'		

	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Potential for risk change in animals in GB'
WHERE
	[Code] = 'RE06'	
		
	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Potential for silent spread'
WHERE
	[Code] = 'RE08'	

	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Is there a reservoir in GB for this disease/agent in another species or vector'
WHERE
	[Code] = 'RE10'	
		
	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Uptake of control measures applied at the holding level by keepers of this species'
WHERE
	[Code] = 'RE11'		

	UPDATE
	[PrioritisationCriterion]
SET
	[Name] = 'Level of national preparedness or level of implementation for endemics/welfare issues'
WHERE
	[Code] = 'RE12'	

GO




	
