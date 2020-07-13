Feature: PAUB-19064

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB6-2" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"

Scenario: Login
Given browser "Chrome"
When I open "{environment.UBView.Login URL}"
And I click on "username"
And I type "{credentials.UBView-Cred.username}"
And I click on "password" 
And I type "{credentials.UBView-Cred.password}"
And I click on "login"
Then "Home Link" should be displayed

Scenario: Navigate to Dashboard
When I click on "Status Link"
And I click on "Status Hardware Link"
Then "Hardware Support Tag Id" should be displayed
And "Hardware Cache Engine Table" should be displayed
And "Hardware System Info Table" should be displayed