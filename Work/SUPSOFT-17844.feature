Feature: SUPSOFT-17844

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
Then "Logout Button in Top Menu" should be displayed

Scenario: Navigate to 'Application Management' > 'RequestAssist' > 'Severity Levels'
When I click on "Application Management in SA Menu"
And I click on "RequestAssist in SA Menu"
And I click on "Severity Levels in SA Menu"
Then "New Button (in Severity Levels)" should be displayed
And "Cancel Button (in Severity Levels)" should be displayed
And "Edit Button (for First Record) (in Severity Levels)" should be displayed
And "Delete Button (for First Record) (in Severity Levels)" should be displayed
And I remember a value from "Value Cell (for First Record) (in Severity Levels)" as "ValueRowOne"
And I remember a value from "Value Cell (for Second Record) (in Severity Levels)" as "ValueRowTwo"
And the value of "ValueRowOne" should be greater than "{ValueRowTwo}"

Scenario: Click on "New" button
When I click on "New Button (in Severity Levels)"
Then "Save Button (in Severity Levels)" should be displayed
And "Severity Textbox (in Severity Levels)" should be displayed
And "Value Textbox (in Severity Levels)" should be displayed

Scenario: Create "Emergency" entry with 4 digits value, and make sure it is saved within 10 seconds
Given a stopwatch "Timer"
Given "FourDigitRandom" default value is "{random_number(1000,9999)}"
Given "EmergencyWithFourDigitNumber" default value is "Emergency_{FourDigitRandom}"
When I set "{EmergencyWithFourDigitNumber}" to "Severity Textbox (in Severity Levels)" value
And I set "{FourDigitRandom}" to "Value Textbox (in Severity Levels)" value
And I click on "Save Button (in Severity Levels)"
And I start the stopwatch "Timer"
And I wait until "Settings saved Message" appears
And I stop the stopwatch "Timer"
Then the stopwatch "Timer" value should be "10" sec or less
And "Settings saved Message" should be displayed
And "EmergencyWithFourDigitNumber (in Severity Column)" should be displayed

Scenario: Go to the functionality 'Service Level Agreements'
When I click on "Service Level Agreements in SA Menu"
Then "Average Time to First Response(Minutes) Table" should be displayed
And "Average Time to Close(Minutes) Table" should be displayed
And "EmergencyWithFourDigitNumber (in Average Time to First Response Table)" should be displayed
And "EmergencyWithFourDigitNumber (in Average Time to Close Table)" should be displayed
And "Pencil Icon for EmergencyWithFourDigitNumber (in Average Time to First Response Table)" should be displayed
And "Pencil Icon for EmergencyWithFourDigitNumber (in Average Time to Close Table)" should be displayed

Scenario: Edit "Emergency" entry in 'Average Time to Close(Minutes)' table
When I click on "Pencil Icon for EmergencyWithFourDigitNumber (in Average Time to Close Table)"
Then "Save Button (in Service Level Agreements)" should be displayed
And "SLA Value Textbox (in Service Level Agreements)" should be displayed

Scenario: Enter 35 and Save
When I set "35" to "SLA Value Textbox (in Service Level Agreements)" value
And I click on "Save Button (in Service Level Agreements)"
Then "Pencil Icon for EmergencyWithFourDigitNumber (in Average Time to Close Table)" should be displayed
And "SLA Value Textbox (in Service Level Agreements)" should not be displayed

Scenario: Edit "Emergency" entry in 'Average Time to Response(Minutes)' table
When I click on "Pencil Icon for EmergencyWithFourDigitNumber (in Average Time to First Response Table)"
Then "Save Button (in Service Level Agreements)" should be displayed
And "SLA Value Textbox (in Service Level Agreements)" should be displayed

Scenario: Enter 35 and Save
When I set "35" to "SLA Value Textbox (in Service Level Agreements)" value
And I click on "Save Button (in Service Level Agreements)"
Then "Pencil Icon for EmergencyWithFourDigitNumber (in Average Time to First Response Table)" should be displayed
And "SLA Value Textbox (in Service Level Agreements)" should not be displayed