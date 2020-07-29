Feature: JVFINTG-8365

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/pages/viewpage.action?spaceKey=JIVE&title=Environments"
Given credentials "admin"

Scenario: Login to jive instance
Given browser "Chrome"
When I open "{environment.LatestEnvironment.URL}"
And I set "Email Address|Username" value to "{credentials.admin.username}"
And I set "Password" value to "{credentials.admin.password}"
And I click on "Log In button"
Then "User Profile picture" should be displayed

Scenario: Allow file type in Admin Console
When I click on "User Profile picture"
And I click on "Admin Console menu item"
And I click on "Admin Console ADVANCED SETTINGS button"
And I click on "Advanced Settings - System tab"
And I click on "Settings subtab"
And I click on "Attachments (Link in the Left Menu)"
And I click on "application/msword from COMMON CONTENT TYPES"
And I click on "<< Icon"
Then "application/msword in DISALLOWED CONTENT TYPES" should be displayed