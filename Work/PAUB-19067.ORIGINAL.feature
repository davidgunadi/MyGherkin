Feature: PAUB-19067

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
And I click on "Status Memory Utilization Link"
Then "Memory Utilization Raw Graph" should be displayed