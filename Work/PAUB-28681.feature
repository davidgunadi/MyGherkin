Feature: PAUB-28681

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
Then "Policy Manager - Categories Tab" should be displayed

Scenario: Click to Categories tab
When I click on "Policy Manager - Categories Tab"
Then "Categories List" should be displayed

Scenario: Click on Add button
When I click on "Add Button (in Categories Page)"
Then "Add Category Form" should be displayed

Scenario: Enter New Policy Manager Details for "E2ETest_Category_DeviceMatchUserAgents_Microsoft"
Given "RandomNumber" default value is "{date('YYYYMMDDmmss')}"
Given "CategoryName" default value is "E2ETest_Category_DeviceMatchUserAgents_Microsoft_{RandomNumber}"
When I set "Add Category Form Name" value to "{CategoryName}"
And I set "Add Category Form Type" value to "Device: Match user agents"
Then I should see "{CategoryName}" in "Add Category Form Name"
And I should see "Device: Match user agents" in "Add Category Form Type"

Scenario: Type or select Microsoft on the box
Given "UserAgentName" default value is "Microsoft"
When I set "User agent Textbox" value to "{UserAgentName}"
And I press "ENTER"
Then I should see "{UserAgentName}" in "First Item above user Agent Textbox"

Scenario: Click on Add Button
When I click on "Add Category Form Add Button"
Then "Category with name=CategoryName in the Categories list" should be displayed

Scenario: Cleanup (This is to keep the list tidy, and should be fine since this E2E is not a precondition to any other E2E)
When I click on "Created Category name - checkbox"
And I click on "Delete Button (in Categories Page)"
And I click on "Delete Confirmation Button (in Popup)"
Then "Category with name=CategoryName in the Categories list" should not be displayed