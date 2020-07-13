Feature: PAUB-29840

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB7-1" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UBView-Cred"

Scenario: Log in as padmin
Given browser "Chrome"
When I open "{environment.UBView.Login URL}"
And I click on "username"
And I type "{credentials.UBView-Cred.username}"
And I click on "password" 
And I type "{credentials.UBView-Cred.password}"
And I click on "login"
Then "Home Link" should be displayed

Scenario: Navigate In Maintenance Functionalities
When I click on "Maintenance Link"
And I click on "Maintenance Cache Lists Link"
Then "Maintenance Cache Lists Export Cache List Button" should be displayed