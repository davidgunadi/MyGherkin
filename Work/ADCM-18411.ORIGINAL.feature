Feature: ADCM-18411

# EnvDS Error: YAMLException: end of the stream or a document separator is expected at line 3, column 1:
    You can find the link of the doc ... 
    ^

Login into the DCM UI.
The DCM Welcome page is opened.

Go to the "Party" tab.
The person party searching page with the RESULTS OF PARTY SEARCH table is opened.

Click on the "Create Person" button.
The page with the "Create New Person" title is opened.

Enter a value(e.g. firstName5) in the "First Name" field,
enter a value(e.g. lastName5) in the "Last Name" field,
enter a 4 digits numeric value(e.g. 1267) in the "DTCC ID" field,
enter a numeric value(e.g. 26763) in the "National Producer Number" field,
select "No" in the "Synchronize with PDB" field, 
enter a value(e.g. 3403543) in the "(Tax ID/SSN (format: 123456789))" field,
check 'Distributor' in the "Applicable Roles" field,
select 'Mailing' in the "Comm. Mode to Try First" field,
enter a value(e.g. Park) in the "Street1" field,
enter a value(e.g. Wall Street) in the "Street2" field,
enter a value(e.g. Aden) in the "Street3" field,
enter a value(e.g. Utah) in the "City" field,
enter a value(e.g. 112332) in the "ZipCode" field,
enter a value(e.g. 9988776655) in the "Phone Number" field,
enter a value(e.g. 8009776655) in the "Cell Phone Number" field,
enter a value(e.g. 12323442) in the "Fax Number" field,
enter a value(e.g. asd@test.com) in the "Email Address" field,
enter a value(e.g. 23211) in the "Pager Number" field,
then click on the "Validate" button.
The 'VALIDATING...SUCCESSFUL' message appears on right side of Validate button.

Click on the "Save" button.
The "Create New Person" page is closed, new person party fields are shown in the "RESULTS OF PARTY SEARCH DISPLAYING: NEWLY CREATED OBJECT" and "DEMOGRAPHIC INFORMATION" tables.
Scenario: Preconditions
Given environment "Login into the "Develop Branch Enterprise ( Next Release Version )" environment." from "https://confluence.devfactory.com/display/ADCM/DCM+QA+Environments"
Given credentials "Check the credentials of the "Develop Branch Enterprise ( Next Release Version )" environment."

