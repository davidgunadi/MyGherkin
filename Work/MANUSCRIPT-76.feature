Feature: MANUSCRIPT-76

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "FogBugz Staging Environment" from "https://confluence.devfactory.com/display/MAN/Environments"
Given credentials "FogBugzOnDemandSTG"

Scenario: Login
Given browser "Chrome"
When I open "{environment.FogBugzOnDemandDiscovery.Login URL}"
And I set "Email Textbox" value to "{credentials.FogBugzOnDemandSTG.username}"
And I set "Password Textbox" value to "{credentials.FogBugzOnDemandSTG.password}"
And I click on "Login Button"
Then "Avatar" should be displayed

Scenario: Display "Your Fogbugz Account" Page
When I hover on "Avatar"
And I click on "Your Fogbugz Account"
Then "FogBugz Account Management" page should be displayed
And "Past Payments" should be displayed
And "Account ID" should be displayed
And "Customer Support" should be displayed
And "Contact Customer Support" should be displayed
And "Primary Contact" should be displayed
And "Export Data" should be displayed
And "Close Account" should be displayed