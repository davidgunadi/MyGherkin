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

Scenario: Create "Emergency" entry with value as 150, and make sure it is saved within 4 seconds
Given a stopwatch "Timer"
When I set "Emergency" to "Severity Textbox (in Severity Levels)" value
And I set "150" to "Value Textbox (in Severity Levels)" value
And I click on "Save Button (in Severity Levels)"
And I start the stopwatch "Load Timer"
And I wait until "Settings saved Message" appears
And I stop the stopwatch "Load Timer"
Then the stopwatch "Load Timer" value should be "4" sec or less
And "Settings saved Message" should be displayed
And "Emergency (in Severity Column)" should be displayed

Scenario: Go to the functionality 'Service Level Agreements'
When I click on "Service Level Agreements in SA Menu"
Then "Average Time to First Response(Minutes) Table" should be displayed
And "Average Time to Close(Minutes) Table" should be displayed
And "Emergency (in Average Time to First Response Table)" should be displayed
And "Emergency (in Average Time to Close Table)" should be displayed
And "Edit Icon for Emergency (in Average Time to First Response Table)" should be displayed
And "Edit Icon for Emergency (in Average Time to Close Table)" should be displayed

Scenario: Edit "Emergency" entry in 'Average Time to Close(Minutes)' table
When I click on "Edit Icon for Emergency (in Average Time to First Response Table)"


Scenario: Enter 35 and Save

Scenario: Edit "Emergency" entry in 'Average Time to Response(Minutes)' table
When I click on "Edit Icon for Emergency (in Average Time to Close Table)"

Scenario: Enter 35 and Save

Scenario: Cleanup (Required)
