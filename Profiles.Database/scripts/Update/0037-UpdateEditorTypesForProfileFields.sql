--1 Summary
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Summary Description' --1.1
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Description' --1.2
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Affected Species Comments' --1.3
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Other Affected Species Comments' --1.4
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Scenario Description' --1.5
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Revision History' --1.6

--2 Geographic distribution & levels of disease
update [ProfileField] set EditorFieldType = 1 where ShortName = 'GB Presence Indicator Comments' --2.1
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Current Prevalence In GB Comments' --2.2
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Date Of Most Recent Occurrence In GB Comments'  --2.3
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Risk Of Introduction To GB Comments' --2.4
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Potential To Improve Distribution Understanding Comments' --2.5
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Potential For Risk Change Comments' --2.6
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Global Geographic Distribution Comments' --2.7

--3 Epidemiology
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Suspect Case Definition' --3.1
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Probable Case Definition' --3.2
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Confirmed Case Definition' --3.3
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Differential Diagnoses' --3.4
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Potential For Silent Spread Comments' --3.5
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Clinical Signs' --3.7
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Pathological Features' --3.8
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Mortality Indicator Comments' --3.9
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Duration Of Disease Comments' --3.10
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Detection Method Type Comments' --3.11
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Diagnosis Mechanism Comments' --3.12
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Transmission Mechanism Comments' --3.13
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Rate Of Spread On Premises Comments' --3.14
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Therapeutic Agent Susceptibility' --3.15
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Persistence In Environment Indicator Comments' --3.16
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Spread Mechanism Comments' --3.17
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Wildlife Reservoir Indicator Comments' --3.18
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Increase Understanding Potential Comments' --3.19
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Multi Species Summary' --3.20
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Infectious period' --3.21
update [ProfileField] set EditorFieldType = 0 where ShortName = 'EU tracing windows' --3.22a
update [ProfileField] set EditorFieldType = 0 where ShortName = 'OIE tracing window' --3.22b
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Other pertinent information' --3.22c


--4 Characteristics of the agent
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Noninfectious Cause Comments' --4.2
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Infectious Cause Comments' --4.3
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Agent Classification' --4.4
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Licensed labs comments' --4.7
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Further Agent Info' --4.8

--5 Animal welfare
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Welfare Issue Indicator Comments' --5.1
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Freedom From Hunger And Thirst Comments' --5.2
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Freedom From Discomfort Comments'  --5.3
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Freedom From Pain Or Injury Comments' --5.4 
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Freedom To Express Normal Behaviour Comments' --5.5
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Freedom From Fear And Distress Comments' --5.6
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Proportion Of Animals Affected Suffering Severely Comments' --5.7
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Number Of Cases Per Year In GB Comments' --5.8
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Summary Impact On Animal Welfare' --5.9  
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Potential To Reduce Welfare Implications Comments' --5.10

--6 Human health
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Zoonotic Indicator Comments' --6.1
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Level Of Human Exposure To Animal Or Products Comments' --6.2
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Human Transmission Mechanism Comments' --6.3
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Attributable Fraction Comments' --6.4
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Symptoms Of Human Disease' --6.5
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Transmissibility Indicator Comments' --6.6
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Modal Severity Of Human Disease Comments' --6.7
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Maximum Severity Of Human Disease Comments' --6.8
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Geographic Distribution Of Human Disease Comments' --6.9
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Annual Number Of Human Cases In GB Comments' --6.10
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Average Cost Per Case Comments' --6.11
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Indirect Economic Cost Of Human Illness Comments' --6.12
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Uncertainty Comments' --6.13
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Impact On Human Health' --6.14

--7 Wider society
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Potential Unplanned Cost To Exchequer Comments'  --7.1
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Global Environment Comments' --7.2
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Local Environment Comments' --7.3
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Local Agricultural Economy Comments' --7.4
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Wider Rural Community Comments'--7.5
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Total Surveillance Costs Comments' --7.6
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Impact On Society Summary' --7.7
update [ProfileField] set EditorFieldType = 0 where ShortName = 'FFG Costs Summary Comments' --7.8

--8 Legislation & mandates
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Applicable Legislation And Mandates Comments' --8.3
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Legislation Overview' --8.4

--9 Approach to control
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Current Control Mechanisms Comments' --9.1
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Other Control Mechanisms Comments'  --9.2
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Uptake At Holding Level Comments' --9.3
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Welfare Effect Comments' --9.4
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Potential To Reduce Risk Comments' --9.5
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Potential To Limit Disease Spread Or Severity Comments' --9.6
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Potential To Reduce Human Exposure Comments' --9.7
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Vaccines Available Indicator Comments' --9.8
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Controls At The Holding Level Comments' --9.9
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Controls Above The Holding Level Comments' --9.10
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Compensation' --9.11
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Level Of National Preparedness Comments' --9.12

--10 Risk Assessment
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Increased Occurence Risk Factor Comments' --10.1
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Decreased Occurence Mitigating Factor Comments' --10.2
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Potential Decreasing Occurence Mitigating Factor Comments' --10.3
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Variability Level Comments' --10.4
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Uncertainty Level Comments' --10.5
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Risk Summary' --10.6
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Supporting Evidence Base Comments' --10.7

--11 Laboratories
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Laboratory Comments' --11.1
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Laboratory Test Comments' AND Id = '53A3CBFB-0069-401A-9B24-A0BBFB944FC8' --11.2
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Laboratory Test Comments' AND Id = '4DDC1EE2-BD35-478F-BD33-2EDDA338CA5E' --11.3
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Any other pertinent information' --11.3
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Laboratory Test Potential Improvement Comments' --11.4

--12 Surveillance
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Purpose And Detail' --12.1
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Contractor Supporting Comments' --12.1
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Time To Be Brought To Attention Comments' --12.1
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Summary Of Surveillance Activities' --12.2
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Proposal' --12.3

--13 International Trade
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Statutory Obligation To Control Comments' --13.3
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Reestablishment Of Trading Status Comments' --13.5
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Potential For Regionalisation Comments' --13.6
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Range Of Commodities Compromised Comments' --13.7
update [ProfileField] set EditorFieldType = 0 where ShortName = 'Impact On International Trade' --13.11

--14 Opportunity to add value
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Opportunity To Add Value Summary' --14.1

--15 Public & stakeholder perception
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Public And Stakeholder Perception Summary' --15.1

--16 Areas of uncertainty
update [ProfileField] set EditorFieldType = 1 where ShortName = 'Areas Of Uncertainty Summary' --16.1
