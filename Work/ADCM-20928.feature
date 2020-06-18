Feature: ADCM-20928

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Develop Branch Enterprise ( Next Release Version )" from "https://confluence.devfactory.com/display/ADCM/DCM+Environments+Data+Structure"
Given credentials "DCM system admin default credentials"



Scenario: Log in as DCM System Admin Default Credentials
Given browser "Chrome"
When I open "{environment.DCM UI.URL}"
And I set "{credentials.DCM system admin default credentials.username}" to "User Name field" value
And I set "{credentials.DCM system admin default credentials.password}" to "Password field" value
And I click on "Login button"
Then "Welcome" should be displayed

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

