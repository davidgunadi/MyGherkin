Feature: PAUB-29840

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB7-1" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UBView-Cred"

Scenario: Log in as padmin
Given browser "Chrome"
When I open "{environment.UBView.Login URL}"
And I set "username" value to "{credentials.UBView-Cred.username}"
And I set "password" value to "{credentials.UBView-Cred.password}"
And I click on "login"
Then "Home Link" should be displayed

Scenario: Navigate In Maintenance Functionalities
When I click on "Maintenance Link"
And I click on "Cache Lists (under Maintenance)"
Then "Export Cache List Button (in Cache Lists)" should be displayed