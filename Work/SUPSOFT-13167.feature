Feature: SUPSOFT-13167

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Create an advanced search
Given "RequestTypeName" default value is "Test{date('MMDDhhmmss')}"
When I execute scenario "SUPSOFT-13175" with inputs "RequestTypeName" as "{RequestTypeName}"
Then scenario steps should complete successfully

Scenario: Navigate to "Application Management - RequestAssist - Types"
Given browser "Chrome"
When I open "{environment.SupportSoft Administrator portal.URL}"
And I set "{credentials.Administrator.username}" to "Username In SA Login Page" value
And I set "{credentials.Administrator.password}" to "Password In SA Login Page" value
And I click on "Login Button In SA Login Page"
And I click on "Application Management in SA Menu"
And I click on "RequestAssist in SA Menu"
And I click on "Types in SA Menu"
Then "Types (Header)" should be displayed
And "RequestTypeName (in Types Table)" should be displayed
And "Delete Icon for RequestTypeName (in Types Table)" should be displayed

Scenario: Use Developer Tools to Clear Cache, try deleting the Created Request Type, and verify Login Page is displayed instead
When I execute an action which only human can execute:
"""
Open Developer Tools for the Browser you are using.
Remove all the Session Cookies for the environment.
"""
When I click on "Delete Icon for RequestTypeName (in Types Table)"
Then "Login Button In SA Login Page" should be displayed