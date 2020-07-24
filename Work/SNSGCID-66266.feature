Feature: SNSGCID-66266

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "end-to-end" from "https://confluence.devfactory.com/display/SEN/Sensage+EnvDS"
Given credentials "TEST-66266"

Scenario: Precondition - Populate data
Given HTTP request
When I execute GET request for "{environment.datasetpreload-single-node.URL}/TEST-66266"
Then "Preload finished" should be in response body

Scenario: Login and Access Data Design -> Analytics Workbench menu
Given browser "Chrome"
When I open "{environment.analyzer-ui-single-node.URL}"
And I set "{credentials.TEST-66266.username}" to "Username field" value
And I set "{credentials.TEST-66266.password}" to "Password field" value
And I click on "Login button"
And I click on "Data Design menu"
And I click on "Analytics Workbench menu"
And I click on "Page search text inputbox in 'Models' tab of 'Analytics Workbench' page"
And I type "TEST-66266-MODEL"
Then "Analytics Workbench (Header)" should be displayed
And "TEST-66266-MODEL model row" should be displayed
And "disabled 'Status' button" should be displayed

Scenario: Select the model in the model list
When I click on "TEST-66266-MODEL model row"
Then "enabled 'Status' button" should be displayed

Scenario: Click Status Button
When I click on "enabled 'Status' button"
Then "option 'Active' in Status button dropdown" should be displayed
Then "option 'Hidden' in Status button dropdown" should be displayed
Then "option 'Deprecated' in Status button dropdown" should be displayed

Scenario: Select Hidden
When I click on "option 'Hidden' in Status button dropdown"
Then I should see "HIDDEN" in "Status column of 'TEST-66266-MODEL' model row"

Scenario: Click Status and Select Deprecated
When I click on "enabled 'Status' button"
When I click on "option 'Deprecated' in Status button dropdown"
Then I should see "DEPRECATED" in "Status column of 'TEST-66266-MODEL' model row"

Scenario: Verify "TEST-66266-MODEL" is not displayed in "Select an Analytics model to schedule" dropdown in Schedule Page
When I click on "Scheduler menu"
And I click on "Schedules menu"
And I click on "Analytics Schedules Tab"
And I click on "Add a schedule button in 'Scheduler' page"
And I click on "Select an Analytics model to schedule dropdown bar"
Then "option 'TEST-66266-MODEL' in models dropdown" should not be displayed

Scenario: Update "TEST-66266-MODEL" status to Active
When I press 'ESCAPE'
And I click on "Analytics Workbench menu"
And I click on "Page search text inputbox in 'Models' tab of 'Analytics Workbench' page"
And I type "TEST-66266-MODEL"
And I click on "TEST-66266-MODEL model row"
And I click on "enabled 'Status' button"
And I click on "option 'Active' in Status button dropdown"
Then I should see "ACTIVE" in "Status column of 'TEST-66266-MODEL' model row"

Scenario: Verify "TEST-66266-MODEL" is displayed in "Select an Analytics model to schedule" dropdown in Schedule Page
When I click on "Schedules menu"
And I click on "Analytics Schedules Tab"
And I click on "Add a schedule button in 'Scheduler' page"
And I click on "Select an Analytics model to schedule dropdown bar"
Then "option 'TEST-66266-MODEL' in models dropdown" should be displayed