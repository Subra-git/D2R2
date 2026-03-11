 /*
 
Steps to update the Live Profiles Database
 
Drop the entire SurveillanceProfiles database on vla37
Create a new database called SurveillanceProfiles on vla37

Execute the following scripts in this sequence:

C:\Projects\VLA86 - Surveillance Profiles\SurveillanceProfiles\ProfilesDatabase\Create Scripts\CreateMainTables.sql
C:\Projects\VLA86 - Surveillance Profiles\SurveillanceProfiles\ProfilesDatabase\Change Scripts\ChangeMainTables.sql
C:\Projects\VLA86 - Surveillance Profiles\SurveillanceProfiles\ProfilesDatabase\Create Scripts\PopulateBaselineData.sql
C:\Projects\VLA86 - Surveillance Profiles\SurveillanceProfiles\ProfilesDatabase\Create Scripts\CreateMainStoredProcedures.sql

At this point, the database contains all custom tables, stored procedures and data. Then add in the code-generated
scripts to create the profiles tables and stored procedures
C:\Projects\VLA86 - Surveillance Profiles\SurveillanceProfiles\ProfilesDatabase\Create Scripts\CreateProfileTables.sql
C:\Projects\VLA86 - Surveillance Profiles\SurveillanceProfiles\ProfilesDatabase\Create Scripts\CreateProfileStoredProcedures.sql
C:\Projects\VLA86 - Surveillance Profiles\SurveillanceProfiles\ProfilesDatabase\Create Scripts\CreatePrioritisationStoredProcedures.sql

The execute this to create users for the dev system (if required):
C:\Projects\VLA86 - Surveillance Profiles\SurveillanceProfiles\ProfilesDatabase\Create Scripts\CreateProfileUsers.sql


User/Password for Defra Users:
 
 DefraBOProfilesUser
 c@nt3rbury
 
 
 
 
 
 
 
 */