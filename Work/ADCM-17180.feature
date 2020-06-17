Feature: ADCM-17180

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Develop Branch Enterprise ( Next Release Version )" from "https://confluence.devfactory.com/display/ADCM/DCM+Environments+Data+Structure"
Given credentials "DCM system admin default credentials"
Given "RandomValue" value is the current datetime "+0 milliseconds" #need to change this to random string only

#NEED TO ADD PRECONDITION

Scenario: Log in as DCM System Admin Default Credentials
Given browser "Chrome"
When I open "{environment.DCM UI.URL}"
And I set "{credentials.DCM system admin default credentials.username}" to "User Name field" value
And I set "{credentials.DCM system admin default credentials.password}" to "Password field" value
And I click on "Login button"
Then "Welcome" should be displayed

Scenario: Go to Reports
When I click on "Reports Top Navigation Tab"
Then "Results of Favorite Report Search" should be displayed

Scenario: Go to "SQL/OQL Reporting"
When I click on "SQL/OQL Reporting Left Menu Link"
Then "SQL/OQL Reporting page title" should be displayed

Scenario: Open "Query Details" Tab
When I click on "Query Details tab"
Then "Query text area" should be displayed

Scenario: Write OQL Type Query and Verify & Execute
When I click on "OQL Radio Button (in Query Details Form)"
And I click on "Query text area"
And I type "select p.name from SCCMProduct p where p.name = 'product1'"
And I click on "Verify & Execute Query button"
Then "product1 (in Execution Results Table)" should be displayed

Scenario: Save Query and Verify
When I click on "Save Query button"
And I type "{RandomValue}" in the alert box
And I accept the alert box
And I click on "Query Name input field"
And I type "{RandomValue}"
And I click on "Search button (in Query List)"
Then I should see "{RandomValue}" in "Query Name (in Search Result, Row 1)"
And I should see "OQL" in "Query Type (in Search Result, Row 1)"