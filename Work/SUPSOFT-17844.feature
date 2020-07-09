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