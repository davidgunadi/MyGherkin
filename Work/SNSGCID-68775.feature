Feature: SNSGCID-68775

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "end-to-end" from "https://confluence.devfactory.com/display/SEN/Sensage+EnvDS"
Given credentials "TEST-68775"

Scenario: Precondition - Populate data
Given HTTP request
When I execute GET request for "{environment.datasetpreload-single-node.URL}/TEST-68775"
Then "Preload finished" should be in response body

Scenario: Login to Environment and Access "Scheduler" -> "Schedules"
Given browser "Chrome"
When I open "{environment.analyzer-ui-single-node.URL}"
And I set "{credentials.TEST-68775.username}" to "Username field" value
And I set "{credentials.TEST-68775.password}" to "Password field" value
And I click on "Login button"
Then "Welcome message" should be displayed
When I click on "Scheduler menu"
And I click on "Schedules menu"
Then "active 'Report Schedules' tab" should be displayed
And "TEST-68775-SCHEDULE1 schedule row" should be displayed
And "TEST-68775-SCHEDULE schedule row" should be displayed
And "disabled 'Delete schedule(s)' button in Scheduler page" should be displayed

Scenario: Select all reports schedules in the report list and verify Delete button is enabled
When I click on "Grid Header's(checkbox to select all the schedules)"
Then "enabled 'Delete schedule(s)' button in Scheduler page" should be displayed

Scenario: Delete Schedule and Verify Message
When I click on "enabled 'Delete schedule(s)' button in Scheduler page"
Then I should see "The following selected schedules does not have delete permissions: TEST-68775-SCHEDULE. Do you want to reset your selection to the ones you can delete?" in "the message area in 'Please confirm' dialog"

Scenario: Click Yes and verify Results
When I click on "Yes button in delete confirmation dialog"
Then "checked TEST-68775-SCHEDULE1 schedule row" should be displayed
And "unchecked TEST-68775-SCHEDULE schedule row" should be displayed
And "enabled 'Delete schedule(s)' button in Scheduler page" should be displayed