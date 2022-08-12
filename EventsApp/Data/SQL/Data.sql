-- Back to School Bash 8-25-21

-- Errors:
-- 1. Can't make multiple events for one organization
-- 2. Can't Create multiple Items

EXEC CreateOrganization @Name = N'ACM', @Description = N'Association for Computing Machinary';
EXEC CreateOrganization @Name = N'WebDev', @Description = N'Web Development Club';
EXEC CreateOrganization @Name = N'Hack K-State', @Description = N'Annual Hackathon at K-State'; 

EXEC CreatePerson @WID = '835468861', @EID = N'lauralegg', @FirstName = N'Laura', @LastName = N'Legg';
EXEC CreatePerson @WID = '123456789', @EID = N'jacoblegg', @FirstName = N'Jacob', @LastName = N'Legg';
EXEC CreatePerson @WID = '987654321', @EID = N'Kodiak', @FirstName = N'Cody', @LastName = N'Murphy';

EXEC CreateMember @OrgName = N'ACM', @WID = '835468861', @IsAdmin = 1;
EXEC CreateMember @OrgName = N'Hack K-State', @WID = '987654321', @IsAdmin = 1;
EXEC CreateMember @OrgName = N'Hack K-State', @WID = '123456789', @IsAdmin = 0;

EXEC CreateEvent @Name = N'Back to School Bash', @OrgName= N'ACM', @Location = N'DUE 1116', @StartDate = '2022-8-25', @EndDate = '2022-8-25', @Description = N'Back to school celebration';
EXEC CreateEvent @Name = N'Hack K-State 2022', @OrgName= N'Hack K-State', @Location = N'College of Business', @StartDate = '2022-11-11', @EndDate = '2022-11-13', @Description = N'2022 Hackathon supported by MLH';

EXEC CreateItem @EventName = N'Back to School Bash', @Name = N'Pizza', @Purpose = N'Food students attending the event', @Price = 6.12;

EXEC CreateRole 