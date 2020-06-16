Feature: MANUSCRIPT-30

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "FogBugz Staging Environment" from "https://confluence.devfactory.com/display/MAN/Environments"
Given credentials "FogBugzOnDemandSTG"

Scenario: Login
Given browser "Chrome"
When I open "{environment.FogBugzOnDemandDiscovery.Login URL}"
And I set "Email Textbox" value to "{credentials.FogBugzOnDemandSTG.username}"
And I set "Password Textbox" value to "{credentials.FogBugzOnDemandSTG.password}"
And I click on "Login Button"
Then "Avatar" should be displayed

Scenario: Display "My Cases" Page
When I hover on "Sidebar - Planner"
And I click on "Sidebar - Planner - Onboarding Planner"
Then "Manuscript Planner - First Column - First Record Case Link" should be displayed

Scenario: Display Case Page.
When I click on "Manuscript Planner - First Column - First Record Case Link"
Then "Case View - Case ID" should be displayed

Scenario: Display Case Edit Page
When I click on "Case Details - Edit Link"
Then "Case Details - Title Textbox" should be displayed

Scenario: Edit Title
When I set "Case Details - Title Textbox" value to "Test Editing Case"
And I set "Case Details - Category Dropdown" value to "Bug"
And I set "Case Details - Priority Dropdown" value to "3"
And I set "Case Details - Due Date Textbox" value to "01/01/2050"
And I click on "Case Details - Save Button"
Then "Case View - Case ID" should be displayed
And I should see "Test Editing Case" in "Case View - Case Title"
And "Case View - Case Category - Bug" should be displayed
And "Case View - Case Priority - 3 Must Fix" should be displayed
And "Case View - Due Date - 01/01/2050" should be displayed
And "Case View - Edited by summary" should be displayed

Scenario: Close Case
When I press "ESCAPE"
And I wait unless "Case View - Case ID" appears
Then "Case View - Case ID" should not be displayed
And "Manuscript Planner - First Column - First Record Case Link" should be displayed
And "Manuscript Planner - Test Editing Case Record Details" should be displayed