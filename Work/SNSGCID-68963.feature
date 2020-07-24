Feature: SNSGCID-68963

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "end-to-end" from "https://confluence.devfactory.com/display/SEN/Sensage+EnvDS"
Given credentials "TEST-68963" and "TEST-68963-USER1"

Scenario: Precondition - Populate data
Given HTTP request
When I execute GET request for "{environment.datasetpreload-single-node.URL}/TEST-68963"
Then "Preload finished" should be in response body

Scenario: Login to Environment and Access "Scheduler" -> "Schedules"
Given browser "Chrome"
When I open "{environment.analyzer-ui-single-node.URL}"
And I set "{credentials.TEST-68963.username}" to "Username field" value
And I set "{credentials.TEST-68963.password}" to "Password field" value
And I click on "Login button"
Then "Welcome message" should be displayed
When I click on "Scheduler menu"
And I click on "Schedules menu"
Then "active 'Report Schedules' tab" should be displayed
And "TEST-68963-SCHEDULE Cell" should be displayed

Scenario: Edit permission for "TEST-68963-SCHEDULE"
When I click on "TEST-68963-SCHEDULE Cell"
And I click on "Lock Icon (Edit permissions button) (In Scheduler Page)"
Then "Edit Access Permissions dialog" should be displayed

Scenario: Apply filter for "Users and Groups" as "TEST-68963-GROUP"
When I set "Users and Groups filter textbox" value to "TEST-68963-GROUP"
And I press "ENTER"
Then "TEST-68963-GROUP Record" should be displayed
And "unchecked 'View' checkbox in the 'TEST-68963-GROUP' row" should be displayed
And "unchecked 'Edit' checkbox in the 'TEST-68963-GROUP' row" should be displayed
And "unchecked 'Delete' checkbox in the 'TEST-68963-GROUP' row" should be displayed

Scenario: Check View permission and Save
When I click on "View Checkbox for TEST-68963-GROUP"
And I click on "Save button in Edit Access Permissions dialog"
And I wait until "Edit Access Permissions dialog" disappears
Then "Edit Access Permissions dialog" should not be displayed

Scenario: Open a new Incognito Browser and Login as "TEST-68963-USER1", then navigate to "Scheduler" -> "Schedules"
Given browser "Chrome"
When I open "{environment.analyzer-ui-single-node.URL}"
And I set "{credentials.TEST-68963-USER1.username}" to "Username field" value
And I set "{credentials.TEST-68963-USER1.password}" to "Password field" value
And I click on "Login button"
Then "Welcome message" should be displayed
When I click on "Scheduler menu"
And I click on "Schedules menu"
Then "active 'Report Schedules' tab" should be displayed
And "TEST-68963-SCHEDULE Cell" should be displayed

Scenario: Verify Edit button is disabled for "TEST-68963-SCHEDULE" report schedule
When I click on "TEST-68963-SCHEDULE Cell"
Then "disabled 'Edit' button in Scheduler page" should be displayed