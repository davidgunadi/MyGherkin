Feature: PAUB-28531

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB7-1" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UBView-Cred-2"

Scenario: Login
Given browser "Chrome"
When I open "{environment.UBView.Login URL}"
And I set "username" value to "{credentials.UBView-Cred-2.username}"
And I set "password" value to "{credentials.UBView-Cred-2.password}"
And I click on "login"
Then "Dashboard" page should be displayed

Scenario: Navigate to the Policy Manager subsite
When I click "Left Navigation Configuration" 
And I click on "Left Navigation Configuration - Policy Manager"
Then Configuration/Policy Manager/Rules page should be displayed

Scenario: Navigate to the Policies tab
When I click "Policy Manager - Policies Tab"
Then Configuration/Policy Manager/Policies **page should be displayed

Scenario: Add new Policies
When I click "Policy Manager - Policies Tab - Add Button" 
And I wait until "Add Policy Form" appears
And I set "Add Policy Form Name" value to "E2ETestPolicy_SpeedLimit_1Mbps"
And I set "Add Policy Form Policy Type" value to "Bandwidth limit"
And I set "Add Policy Form Bandwidth" value to "1"
And I click Add Policy Form Add Button
Then I should see "E2ETestPolicy_SpeedLimit_1Mbps" at the end of the "Policies List"