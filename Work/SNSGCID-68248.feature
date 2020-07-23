Feature: SNSGCID-68248

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "end-to-end" from "https://confluence.devfactory.com/display/SEN/Sensage+EnvDS"
Given credentials "TEST-68248"

Scenario: Precondition - Populate data
Given HTTP request
When I execute GET request for "{environment.datasetpreload-single-node.URL}/TEST-68248"
Then "Preload finished" should be in response body

Scenario: Login and Access "Data Design -> Reports" menu
Given browser "Chrome"
When I open "{environment.analyzer-ui-single-node.URL}"
And I set "{credentials.TEST-68248.username}" to "Username field" value
And I set "{credentials.TEST-68248.password}" to "Password field" value
And I click on "Login button"
Then "Welcome message" should be displayed
And "Data Design menu" should be displayed
When I click on "Data Design menu"
And I click on "Reports menu"
Then "Manage reports page title" should be displayed
And "TEST-68248-REPORT (in Reports Table)" should be displayed
And I should see "0" in "History Count Value for TEST-68248-REPORT"
And I should see "0" in "Space (MB) Value for TEST-68248-REPORT"

Scenario: Select "TEST-68248-REPORT" report and Run Once
When I click on "TEST-68248-REPORT (in Reports Table)"
And I click on "Run dropdown button in the 'Manage Reports' page"
And I click on "option 'Run once'"
Then "Report Queue (Header)" should be displayed
And "TEST-68248-REPORT (in Reports Queue Table)" should be displayed

Scenario: Click "Manage Reports" button once report status is Done
When I wait until "DONE (Status for TEST-68248-REPORT)" appears
And I click on "Manage Reports Button (in Report Queue Page)"
Then "Manage reports page title" should be displayed
And "TEST-68248-REPORT (in Reports Table)" should be displayed
And I should see "0" in "History Count Value for TEST-68248-REPORT"
And I should see "15" in "Space (MB) Value for TEST-68248-REPORT"

Scenario: Verify "View last run" option is disabled
When I click on "TEST-68248-REPORT (in Reports Table)"
And I click on "Run dropdown button in the 'Manage Reports' page"
Then "option 'View last run' DISABLED" should be displayed