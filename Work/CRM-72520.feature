Feature: CRM-72520

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Test Automation 1" from "https://confluence.devfactory.com/display/ACRMW/Environments"
Given credentials "Default CRM"
Given "currentDateTime" value is the current datetime "+0 milliseconds"

Scenario: Navigate to ACRM.Web
Given browser "Chrome"
When I open "{environment.QAPortal.URL}"
And I click on "Web link for BB vertical"
And I switch to second window
Then "Log in to Aurea CRM Web dialog" should be displayed

Scenario: Login to ACRM.Web
When I set "{credentials.Default CRM.username}" to "User Name" value
When I set "" to "Password" value
And I click on "Log In"
Then "Start Page Tab" should be displayed

Scenario: Create a new query
When I click on "Queries And Analyses (Left Menu)"
And I click on "New Query (Left Sub Menu)"
Then "New Query Tab" should be displayed

Scenario: Set query information and save
When I wait for "5" seconds
And I set "Query name (in New Query Page)" value to "{currentDateTime}123456789123456789123456789123456789123456789123456789123456789"
And I click on "Black Code Textbox Block for UQL Syntax (in New Query Page)"
And I type "select (Company) from (FI)"
And I wait unless "Search Result Header (in New Query Page)" appears
And I wait for "3" seconds
And I click on "Save Button (in New Query Page)"
Then I should see "{currentDateTime}1234567891234567891234567891234567" in "Query name (in New Query Page)"
And I should see "Query '{currentDateTime}1234567891234567891234567891234567' saved." in "Save Confirmation Message (in New Query Page)"

Scenario: Edit query information and save
When I set "Query name (in New Query Page)" value to "{currentDateTime}abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
And I wait for "3" seconds
And I click on "Save Button (in New Query Page)"
Then I should see "{currentDateTime}abcdefghijklmnopqrstuvwxyzabcdefgh" in "Query name (in New Query Page)"
And I should see "Query '{currentDateTime}abcdefghijklmnopqrstuvwxyzabcdefgh' saved." in "Save Confirmation Message (in New Query Page)"