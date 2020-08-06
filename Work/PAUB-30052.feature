Feature: PAUB-30052

As an administrator, I should be able to see live streaming stats consistently when I check http traffic.
This is consistent because This E2E shows that UI elements of the product is accessible.

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB7-1" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UBView-Cred"

Scenario: Login
Given browser "Chrome"
When I open "{environment.UBView.Login URL}"
And I set "username" value to "{credentials.UBView-Cred.username}"
And I set "password" value to "{credentials.UBView-Cred.password}"
And I click on "login"
Then "Home Link" should be displayed

Scenario: Navigate to Dashboard
When I click on "Statistics Link"
And I click on "Statistics HTTP Services Link"
Then I should see "Outgoing Video" in "Statistics HTTP Services Traffic Types Legend Table"