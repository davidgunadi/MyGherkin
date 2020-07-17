Feature: SUPSOFT-14363

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Navigate to "Support Administrator Portal" and Login as Admin
Given browser "Internet Explorer"
When I open "{environment.SupportSoft Administrator portal.URL}"
And I set "{credentials.Administrator.username}" to "Username In SA Login Page" value
And I set "{credentials.Administrator.password}" to "Password In SA Login Page" value
And I click on "Login Button In SA Login Page"
Then "SupportSoft - Support Administrator" page should be displayed

Scenario: Navigate to Reporting > LiveAssist > Archived Reports > Chat Transcript
When I click on "Reporting in SA Menu"
And I click on "Live Assist (under Reporting)"
And I click on "Archived Reports (under Live Assist)"
And I click on "Chat Transcript (under Archived Reports)"
Then "Chat Transcript (Header)" should be displayed

Scenario: Run Report Now
When I click on "Run Report Now (in Chat Transcript)"
Then "Report Filter Form (in Chat Transcript)" should be displayed

Scenario: Enter Report Inputs and Click Run
Given "TomorrowDate" default value is "{date('D','1 days')}"
When I click on "Calendar Icon for Report Start Date (in Chat Transcript)"
And I switch to second window
And I click on "<m (in Calendar Picker)"
And I click on "1 (in Calendar Picker)"
And I switch to main window
And I click on "Calendar Icon for Report End Date (in Chat Transcript)"
And I switch to second window
And I click on "TomorrowDate (in Calendar Picker)"
And I switch to main window
And I set "Room Textbox (in Chat Transcript)" value to "%"
And I click on "Run Button (in Chat Transcript)"
Then "Results Table (in Chat Transcript)" should be displayed

Scenario: Show Report Properties

Scenario: Hide Report Properties