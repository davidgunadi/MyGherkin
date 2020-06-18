Feature: ADCM-20928

# EnvDS Error: YAMLException: end of the stream or a document separator is expected at line 3, column 1:
    You can find the link of the doc ... 
    ^

Login into the DCM UI.
The DCM Welcome page is opened.

Go to the "Party" main tab in the page.
The person party searching page with the "RESULTS OF PARTY SEARCH" table is opened.

Click on the "Mass Renewals" link on the left.
The appointment mass renewals searching page with the "SELECT MASS RENEWAL" table is opened.

Click on the "New" button under the "SELECT MASS RENEWAL" table.
The "Create New Appointment Mass Renewal" page is opened.

Select a jurisdiction in the "Jurisdiction" field, select an option in the "Appointment Line" field, select a future date in the "End Date" field, enter a value in the "Description" field, select a reason in the "Termination Reason" field, then click on the "Validate" button.
It validates the field values, and the "VALIDATING...SUCCESSFUL" message is shown near the "Validate" button.

Click on the "Cancel" button.
The "Create New Appointment Mass Renewal" page is closed and no new appointment mass renewal is created and shown in the "SELECT MASS RENEWAL" table.
Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Login into the "Develop Branch Enterprise ( Next Release Version )" environment." from "https://confluence.devfactory.com/display/ADCM/DCM+QA+Environments"
Given credentials "Check the credentials of the "Develop Branch Enterprise ( Next Release Version )" environment."

