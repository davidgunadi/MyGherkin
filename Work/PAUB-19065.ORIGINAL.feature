Feature: PAUB-19065

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB6-2" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"

Scenario: Login
Given browser "Firefox"
When I open "{environment.UBView.Login URL}"
And I click on "username"
And I type "{credentials.UBView-Cred.username}"
And I click on "password" 
And I type "{credentials.UBView-Cred.password}"
And I click on "login"
Then "Home Link" should be displayed

Scenario: Navigate to Logical Status
When I click on "Status Link"
And I click on "Status Logical View Link"
Then "Logical View Memory Link" should be displayed
Then "Logical View CPU Link" should be displayed
Then "Logical View In Traffic" should be displayed
Then "Logical View Cache Out" should be displayed