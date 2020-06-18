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

Scenario: Navigate to Party Tab
When I click on "Party Top Navigation Tab"
Then "Party Search Label" should be displayed

Scenario: Navigate to Mass Renewals
When I click on "Mass Renewals (in Sidebar)"
And I refresh the page
Then "Search Mass Renewals Label" should be displayed

Scenario: Click New
When I click on "New Button (in Mass Renewal)"
Then "Create New (Header)" should be displayed

Scenario: Enter Form Details and Validate
When I click on "Jurisdiction Dropdown (in Mass Renewal)"
And I click on "Alabama (Dropdown Option)"
And I click on "Appointment Line Dropdown (in Mass Renewal)"
And I click on "Automobile (Dropdown Option)"
And I click on "Description Textarea (in Mass Renewal)"
And I type "test description"
And I click on "Termination Reason Dropdown (in Mass Renewal)"
And I click on "Voluntary Termination (Dropdown Option)"
And I click on "Validate Button"
Then "Validating Successful Message" should be displayed

Scenario: Click Cancel Button and Verify No Record is Created
When I click on "Cancel Button"
Then "No Results Label" should be displayed