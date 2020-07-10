Feature: PAUB-19063

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB6-2" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UBView-Cred"

Scenario: Log in as padmin
Given browser "Chrome"
When I open "{environment.UBView.Login URL}"
And I set "username" value to "{credentials.UBView-Cred.username}"
And I set "password" value to "{credentials.UBView-Cred.password}"
And I click on "login"
Then "Home Link" should be displayed

Scenario: Navigate to Dashboard
When I click on "Status Link"
And I click on "Dashboard (under Status)"
Then "Dashboard Cache Engine Image" should be displayed
And "Dashboard Total Traffic Per Protocol Downstream Graph" should be displayed
And "Dashboard System Events Text Box" should be displayed