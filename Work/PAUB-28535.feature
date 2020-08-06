Feature: PAUB-28535

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "UB7-1" from "https://confluence.devfactory.com/display/PEERAPP/Environment+Data+Structure"
Given credentials "UBView-Cred"

Scenario: Run precondition PAUB-28484
When I execute scenario "PAUB-28484" to capture outputs "CategoryName"
Then scenario steps should complete successfully

Scenario: Run precondition PAUB-28486
When I execute scenario "PAUB-28486"
Then scenario steps should complete successfully

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
aaa

Scenario: Click on Add button

Scenario: Set Name = E2ETestRule_Nintendo

Scenario: Click on "Add category" drop-down box

Scenario: Click on the option labeled "Service"

Scenario: On the edit box that appeared for service, start typing "E2E"

Scenario: Continue to type, or use the mouse, to select E2ETestCategory_Nintendo, which was created in the predecessor E2E for this test

Scenario: Click on "Add policy" drop-down box

Scenario: Scroll down and click on the option labeled "Block", under Admission. This should have been created in the precondition E2E

Scenario: Click on Add