Feature: PAUB-19065

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB6-2" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UBView-Cred"

Scenario: Login
Given browser "Firefox"
When I open "{environment.UBView.Login URL}"
And I set "username" value to "{credentials.UBView-Cred.username}"
And I set "password" value to "{credentials.UBView-Cred.password}"
And I click on "login"
Then "Home Link" should be displayed

Scenario: Navigate to Logical Status
When I click on "Status Link"
And I click on "Logical View (under Status)"
Then "Avg CPU Link (in Logical View)" should be displayed
And "Memory Link (in Logical View)" should be displayed
And "In Traffic Link (in Logical View)" should be displayed
And "Cache Out Link (in Logical View)" should be displayed