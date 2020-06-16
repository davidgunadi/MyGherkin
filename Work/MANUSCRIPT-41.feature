Feature: MANUSCRIPT-41

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

Scenario: Navigate to Onboarding Planner
When I hover on "Sidebar - Planner"
And I click on "Sidebar - Planner - Onboarding Planner"
Then "Manuscript Planner - First Column - First Record Case Link" should be displayed

Scenario: Group by Assigned To
When I click on "Group By Dropdown - Assigned To Option"
Then "Plus Icon - Assigned To" should be displayed

Scenario: Group by Kanban Column
When I click on "Group By Dropdown - Kanban Column Option"
Then "Plus Icon - Kanban Column" should be displayed

Scenario: Group by Priority
When I click on "Group By Dropdown - Priority Option"
Then "Plus Icon - Priority" should be displayed

Scenario: Group by Project
When I click on "Group By Dropdown - Project Option"
Then "Plus Icon - Project" should be displayed

Scenario: Group by Status
When I click on "Group By Dropdown - Status Option"
Then "Plus Icon - Status" should be displayed