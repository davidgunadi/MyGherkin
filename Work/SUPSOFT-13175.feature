Feature: SUPSOFT-13175

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Navigate to "Support Administrator Portal" and Login as Admin
Given browser "Chrome"
When I open "{environment.SupportSoft Administrator portal.URL}"
And I set "{credentials.Administrator.username}" to "Username In SA Login Page" value
And I set "{credentials.Administrator.password}" to "Password In SA Login Page" value
And I click on "Login Button In SA Login Page"
Then "Logout Button in Top Menu" should be displayed

Scenario: Navigate to the section 'Application Management', sub-section 'RequestAssist', open the functionality for 'Types'
When I click on "Application Management in SA Menu"
And I click on "RequestAssist in SA Menu"
And I click on "Types in SA Menu"
Then "Types (Header)" should be displayed

Scenario: Click on 'New' button
When I click on "New Button in Types"
Then "Edit Request Type (Header)" should be displayed
And "Request Type (Textbox, in Edit Request Type Form)" should be displayed
And "Create as subtype of (Dropdown, in Edit Request Type Form)" should be displayed
And "Request Style (Dropdown, in Edit Request Type Form)" should be displayed
And "Request Layout (Dropdown, in Edit Request Type Form)" should be displayed
And "UserCenter Request Layout (Dropdown, in Edit Request Type Form)" should be displayed
And "Available Classes (Listbox, in Edit Request Type Form)" should be displayed
And "Selected Classes (Listbox, in Edit Request Type Form)" should be displayed
And "Save Button (in Edit Request Type Form)" should be displayed
And "Cancel Button (in Edit Request Type Form)" should be displayed

Scenario: Enter Type Name and Save
Given "RequestTypeName" default value is "Test{date('MMDDhhmmss')}"
And I set "Request Type (Textbox, in Edit Request Type Form)" to "{RequestTypeName}"
And I click on "Save Button (in Edit Request Type Form)"
Then "Request type has been saved" should be displayed
And "Set Permissions Button (in Edit Request Type Form)" should be displayed