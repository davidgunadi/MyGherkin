Feature: PAUB-25578

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

Scenario: Navigate Size Distribution Window
When I click on "Statistics Link"
And I click on "HTTP Web Browsing (under Statistics)"
And I click on "Size Distribution Tab Link"
Then "Size Distribution Graph" should be displayed