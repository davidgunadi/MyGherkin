Feature: PAUB-28685

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB7-1" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UBView-Cred"

Scenario: Login into the UltraBand UBView website
Given browser "Chrome"
When I open "{environment.UBView.Login URL}"
And I set "username" value to "{credentials.UBView-Cred.username}"
And I set "password" value to "{credentials.UBView-Cred.password}"
And I click on "login"
Then "Dashboard" page should be displayed

Scenario: Click on Configuration, on the left-side menu
When I click on "Configuration (in Left Menu)"
Then "Left Navigation Configuration - Cluster Configuration" should be displayed
And "Left Navigation Configuration - Policy Manager" should be displayed
And "Left Navigation Configuration - License Manager" should be displayed

Scenario: Click on Policy Manager, on the menu item list that expanded after the step above
When I click on "Left Navigation Configuration - Policy Manager"
Then "Policy Manager - Policies Tab" should be displayed

Scenario: Click to Policies tab
When I click on "Policy Manager - Policies Tab"
Then "Policies List table" should be displayed

Scenario: Click on Add button

Scenario: Create "E2ETest_Policy_BandwidthLimit_1Mbps"

Scenario: Click on Add

Scenario: Cleanup (This is to keep the list tidy, and should be fine since this E2E is not a precondition to any other E2E)