Feature: ADCM-17180

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Develop Branch Enterprise ( Next Release Version )" from "https://confluence.devfactory.com/display/ADCM/DCM+Environments+Data+Structure"
Given credentials "DCM system admin default credentials"
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"

Scenario: Precondition - Run ADCM-11414 to Create Product
When I execute scenario "https://jira.devfactory.com/browse/ADCM-11414"

# Scenario: Log in as DCM System Admin Default Credentials
# Given browser "Chrome"
# When I open "{environment.DCM UI.URL}"
# And I set "{credentials.DCM system admin default credentials.username}" to "User Name field" value
# And I set "{credentials.DCM system admin default credentials.password}" to "Password field" value
# And I click on "Login button"
# Then "Welcome" should be displayed

Scenario: Go to Reports
When I click on "Reports Top Navigation Tab"
And I refresh the page
Then "Results of Favorite Report Search" should be displayed

Scenario: Go to "SQL/OQL Reporting"
When I click on "SQL/OQL Reporting Left Menu Link"
And I refresh the page
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
And I type "Query{RandomValue}" in the alert box
And I accept the alert box
And I click on "Query Name input field"
And I type "Query{RandomValue}"
And I click on "Search button (in Query List)"
Then I should see "Query{RandomValue}" in "Query Name (in Search Result, Row 1)"
And I should see "OQL" in "Query Type (in Search Result, Row 1)"











Feature: ADCM-17180

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Develop Branch Enterprise ( Next Release Version )" from "https://confluence.devfactory.com/display/ADCM/DCM+Environments+Data+Structure"
Given credentials "DCM system admin default credentials"
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"

Scenario: Create Product1
Given browser "Chrome"
When I execute scenario "https://jira.devfactory.com/browse/ADCM-11414"
Then "Product1 in First Row in Result of Product Search Grid" should be displayed

Scenario: Go to Reports
When I click on "Reports Top Navigation Tab"
And I refresh the page
Then "Results of Favorite Report Search" should be displayed

Scenario: Go to "SQL/OQL Reporting"
When I click on "SQL/OQL Reporting Left Menu Link"
And I refresh the page
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
And I type "Query{RandomValue}" in the alert box
And I accept the alert box
And I click on "Query Name input field"
And I type "Query{RandomValue}"
And I click on "Search button (in Query List)"
Then I should see "Query{RandomValue}" in "Query Name (in Search Result, Row 1)"
And I should see "OQL" in "Query Type (in Search Result, Row 1)"a