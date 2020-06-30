Feature: SNSGCID-62350

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "development" from "https://confluence.devfactory.com/display/SEN/Sensage+EnvDS"
Given credentials "TEST-62350"

Scenario: Populate data
Given HTTP request
When I execute GET request for "{environment.datasetpreload-single-node.URL}/TEST-62350"
Then "Preload finished" should be in response body

Scenario: Login
Given browser "Chrome"
When I open "{environment.analyzer-ui-single-node.URL}"
And I set "{credentials.TEST-62350.username}" to "Username field" value
And I set "{credentials.TEST-62350.password}" to "Password field" value
And I click on "Login button"
Then "Welcome message" should be displayed
And "Data Design menu" should be displayed

Scenario: Access Analytics Workbench
When I click on "Data Design menu"
And I click on "Analytics Workbench menu"
And I wait until "Loading Spinner" disappears
And I click on "Analytics tab"
Then "Analytics tab" should be displayed

Scenario: Open filters
When I click on "Filtering button in Analytics tab"
Then "by Outputs option in Analytics tab" should be displayed
And "by Inputs option in Analytics tab" should be displayed

Scenario: Select by inputs filter
When I click on "by Inputs option in Analytics tab"
Then "Filter list by input selector in Analytics tab" should be displayed

Scenario: Select PNG type
When I click on "Filter list by input selector in Analytics tab"
And I click on "PNG option"
And I click on "Filter list by input selector in Analytics tab"
Then "Multi Param Input (in Search Result)" should be displayed

Scenario: Add Lookup type to filter
When I click on "Filter list by input selector in Analytics tab"
And I click on "Lookup option"
And I click on "Filter list by input selector in Analytics tab"
Then "Multi Param Input (in Search Result)" should be displayed
And "Execute Report (in Search Result)" should be displayed

Scenario: Clear filter
When I click on "Trash button in the filter section in Analytics tab"
Then "Filter list by input selector in Analytics tab" should not be displayed

Scenario: Open filters and select by outputs filter
When I click on "Filtering button in Analytics tab"
And I click on "by Outputs option in Analytics tab"
Then "Filter list by output selector in Analytics tab" should be displayed

Scenario: Select HTML type
When I click on "Filter list by output selector in Analytics tab"
And I click on "HTML option"
And I click on "Filter list by output selector in Analytics tab"
Then "Table to HTML (in Search Result)" should be displayed

Scenario: Add CSV type to filter
When I click on "Filter list by output selector in Analytics tab"
And I click on "CSV option"
And I click on "Filter list by output selector in Analytics tab"
Then "Table to HTML (in Search Result)" should be displayed
Then "Table to CSV (in Search Result)" should be displayed