Feature: SNSGCID-69343

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "end-to-end" from "https://confluence.devfactory.com/display/SEN/Sensage+EnvDS"
Given credentials "TEST-69343"

Scenario: Precondition - Populate data
Given HTTP request
When I execute GET request for "{environment.datasetpreload-single-node.URL}/TEST-69343"
Then "Preload finished" should be in response body

Scenario: Login to Environment and Access Data Design -> Reports, and run "TEST-69343-REPORT", and View the Report
Given browser "Chrome"
When I open "{environment.analyzer-ui-single-node.URL}"
And I set "{credentials.TEST-69343.username}" to "Username field" value
And I set "{credentials.TEST-69343.password}" to "Password field" value
And I click on "Login button"
And I click on "Data Design menu"
And I click on "Reports menu"
And I click on "TEST-69343-REPORT Cell"
And I click on "Run dropdown button in the 'Manage Reports' page"
And I click on "option 'Run once'"
And I wait until "DONE status for TEST-69343-REPORT" appears
And I click on "TEST-69343-REPORT Cell"
And I click on "View option in Report Queue"
And I wait until "ts Cell in First Row of Report Execution Result Table" appears
Then "TEST-69343-REPORT (Page Header)" should be displayed

Scenario: Hover the mouse over the first row, in the "ts" column
When I hover on "ts Cell in First Row of Report Execution Result Table"
Then "Filter Icon (in ts Cell, in First Row of Report Execution Result Table)" should be displayed

Scenario: Click filter icon
When I click on "Filter Icon (in ts Cell, in First Row of Report Execution Result Table)"
Then "Minute Item (in Filter Dropdown)" should be displayed
Then "Hour Item (in Filter Dropdown)" should be displayed
Then "Day Item (in Filter Dropdown)" should be displayed
Then "week Item (in Filter Dropdown)" should be displayed
Then "month Item (in Filter Dropdown)" should be displayed

Scenario: Check Minute Filter
When I click on "Minute Item (in Filter Dropdown)"
Then I should see ":59" in "ts textbox (in Execution Results Table)"

Scenario: Check Hour Filter
When I click on "X button inside ts textbox (in Execution Results Table)"
And I hover on "ts Cell in First Row of Report Execution Result Table"
And I click on "Filter Icon (in ts Cell, in First Row of Report Execution Result Table)"
And I click on "Hour Item (in Filter Dropdown)"
Then I should see "59:59" in "ts textbox (in Execution Results Table)"

Scenario: Check Day Filter
When I click on "X button inside ts textbox (in Execution Results Table)"
And I hover on "ts Cell in First Row of Report Execution Result Table"
And I click on "Filter Icon (in ts Cell, in First Row of Report Execution Result Table)"
And I click on "Day Item (in Filter Dropdown)"
Then I should see "00:00:00" in "ts textbox (in Execution Results Table)"
And I should see "23:59:59" in "ts textbox (in Execution Results Table)"

Scenario: Check Week Filter
When I click on "X button inside ts textbox (in Execution Results Table)"
And I hover on "ts Cell in First Row of Report Execution Result Table"
And I click on "Filter Icon (in ts Cell, in First Row of Report Execution Result Table)"
And I click on "week Item (in Filter Dropdown)"
Then I should see "00:00:00" in "ts textbox (in Execution Results Table)"
And I should see "23:59:59" in "ts textbox (in Execution Results Table)"

Scenario: Check Month Filter
When I click on "X button inside ts textbox (in Execution Results Table)"
And I hover on "ts Cell in First Row of Report Execution Result Table"
And I click on "Filter Icon (in ts Cell, in First Row of Report Execution Result Table)"
And I click on "month Item (in Filter Dropdown)"
Then I should see "01-01 00:00:00" in "ts textbox (in Execution Results Table)"