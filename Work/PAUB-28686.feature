Feature: PAUB-28686

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
When I click on "Add Button (for List)"
Then "Add Policy Form" should be displayed

Scenario: Create "E2ETest_Policy_BandwidthLimit_5Mbps"
Given "RandomNumber" default value is "{date('YYYYMMDDmmss')}"
Given "PolicyName" default value is "E2ETest_Policy_BandwidthLimit_5Mbps_{RandomNumber}"
Given "BandwidthLimitValue" default value is "5"
When I set "Name Textbox (in Add Policy Popup)" value to "{PolicyName}"
And I set "Policy type Dropdown (in Add Policy Popup)" value to "Bandwidth limit"
And I set "Bandwidth Limit (in Add Policy Popup)" value to "{BandwidthLimitValue}"
Then I should see "{PolicyName}" in "Name Textbox (in Add Policy Popup)"
And I should see "Bandwidth limit" in "Policy type Dropdown (in Add Policy Popup)"
And I should see "{BandwidthLimitValue}" in "Bandwidth Limit (in Add Policy Popup)"

Scenario: Click on Add
When I click on "Add Button (in Popup)"
Then "Policy with name=PolicyName in the Policies list" should be displayed

Scenario: Cleanup (This is to keep the list tidy, and should be fine since this E2E is not a precondition to any other E2E)
When I click on "Checkbox (for Policy with name = PolicyName)"
And I click on "Delete Button (for List)"
And I click on "Delete Confirmation Button (in Popup)"
Then "Policy with name=PolicyName in the Policies list" should not be displayed