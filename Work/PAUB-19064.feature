Feature: PAUB-19064

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB6-2" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UB-Cred"

Scenario: Login
Given browser "Chrome"
When I open "{environment.UBView.Login URL}"
And I set "username" value to "{credentials.UBView-Cred.username}"
And I set "password" value to "{credentials.UBView-Cred.password}"
And I click on "login"
Then "Home Link" should be displayed

Scenario: Navigate to Dashboard
When I click on "Status Link"
And I click on "Hardware View (under Status)"
Then "Support Tag ID (in Hardware View)" should be displayed
And "Cache Engine Table (in Hardware View)" should be displayed
And "System Info Table (in Hardware View)" should be displayed