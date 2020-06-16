Feature: MANUSCRIPT-41

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* Environment: FogBugz OnDemand Staging" from "https://confluence.devfactory.com/display/MAN/Environment+Data+Structure"
Given credentials "N/A"

Scenario: Login
When I execute scenario "MANUSCRIPT-27"
Then scenario steps should complete successfully

Scenario: Navigate to Onboarding Planner
Given browser "Chrome"
When I click on "Onboarding Planner"
Then "Onboarding Planner" page should be displayed

Scenario: Group by Assigned To
Given browser "Chrome"
When I set "Assigned To" to "Intro to FogBugz Group By" value
Then I should verify what only human can verify: 
""" 
Cases should be grouped by "Assigned To" field.
"""

Scenario: Group by Kanban Column
Given browser "Chrome"
When I set "Kanban Column" to "Intro to FogBugz Group By" value
Then I should verify what only human can verify: 
""" 
Cases should be grouped by "Kanban Column" field.
"""

Scenario: Group by Priority
Given browser "Chrome"
When I set "Priority" to "Intro to FogBugz Group By" value
Then I should verify what only human can verify: 
""" 
Cases should be grouped by "Priority" field.
"""

Scenario: Group by Project
Given browser "Chrome"
When I set "Project" to "Intro to FogBugz Group By" value
Then I should verify what only human can verify: 
""" 
Cases should be grouped by "Project" field.
"""

Scenario: Group by Status
Given browser "Chrome"
When I set "Status" to "Intro to FogBugz Group By" value
Then I should verify what only human can verify: 
""" 
Cases should be grouped by "Status" field.
"""