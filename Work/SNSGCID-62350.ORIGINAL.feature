Feature: SNSGCID-62350

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment ""end-to-end" or "se7"" from "https://confluence.devfactory.com/x/cUTsGg"
Given credentials "N/A"

Scenario: Login
Given browser "Chrome"
When I open "{environment.analyzer-ui-single-node.URL}"
And I set "Username field" to "{credentials.TEST-62350.username}" value
And I set "Password field" to "{credentials.TEST-62350.password}" value
And I click on "Login button"
Then "Welcome message" should be displayed

Scenario: Access Analytics Workbench
When I click on "Data Design menu"
And I click on "Analytics Workbench menu"
And I click on "Analytics tab"
Then "Analytics tab" should be displayed

Scenario: Open filters
When I click on "'Filtering' button"
Then "'by Inputs' option" should be displayed
and "'by Outputs' option" should be displayed

Scenario: Select by inputs filter
When I click on "'by Inputs' option"
Then "'Filter list by: input' selector" should be displayed

Scenario: Select PNG type
When I click on "'Filter list by: input' selector"
And I click on "'PNG' option"
And I click on "'Filter list by: input' selector"
Then I should see "Multi Param Input" in "First row Name column"

Scenario: Add Lookup type to filter
When I click on "'Filter list by: input' selector"
And I click on "'Lookup' option"
And I click on "'Filter list by: input' selector"
Then I should see "Execute Report" in "First row Name column"
And I should see "Multi Param Input" in "Second row Name column"

Scenario: Clear filter
When I click on "Trash button"
Then "'Filter list by: input' selector" should not be displayed

Scenario: Open filters and select by outputs filter
When I click on "'Filtering' button"
And I click on "'by Outputs' option"
Then "'Filter list by: output' selector" should be displayed

Scenario: Select HTML type
When I click on "'Filter list by: output' selector"
And I click on "'HTML' option"
And I click on "'Filter list by: output' selector"
Then I should see "Table to HTML" in "First row Name column"

Scenario: Add CSV type to filter
When I click on "'Filter list by: output' selector"
And I click on "'CSV' option"
And I click on "'Filter list by: output' selector"
Then I should see "Table to CSV" in "First row Name column"
And I should see "Table to HTML" in "Second row Name column"