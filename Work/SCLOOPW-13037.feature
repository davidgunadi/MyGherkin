Feature: SCLOOPW-13037

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "staff"
Given credentials "staff2"

Scenario: Tasks: Login as Staff user
Given browser "Chrome" as "Staff_Browser"
When I open "{env.stage.url}" in "Staff_Browser"
And I set "Username" value to "{env.stage.staff.credentials.username}" in "Staff_Browser"
And I set "Password" value to "{env.stage.staff.credentials.password}" in "Staff_Browser"
And I click on "Login" in "Staff_Browser"
Then "Welcome Staff User!" page should be displayed in "Staff_Browser"

Scenario: Open Staff User web site
When I click on "My Website" in "Staff_Browser"
Then "Staff Staff" page should be displayed in "Staff_Browser"

Scenario: Open Manage Site
When I click on "Manage Site" in "Staff_Browser"
Then "User Site Center" page should be displayed in "Staff_Browser"

Scenario: Open Manage Rights
When I click on "Tools" in "Staff_Browser"
And I click on "Manage Rights" in "Staff_Browser"
Then "Assign Rights: Minisite" page should be displayed in "Staff_Browser"

Scenario: Add user as editor
When I click on "Add New Editor" in "Staff_Browser"
And I click on "Staff2 2" in "Staff_Browser"
And I click on "Add Editor" in "Staff_Browser"
Then I should see "Staff2 2" in "Current Editors and Contributors" in "Staff_Browser"

Scenario: Tasks: Login as Staff 2 user
Given browser "Chrome" as "Staff2_Browser"
When I open "{env.stage.url}" in "Staff2_Browser"
And I set "Username" value to "{env.stage.staff2.credentials.username}" in "Staff2_Browser"
And I set "Password" value to "{env.stage.staff2.credentials.password}" in "Staff2_Browser"
And I click on "Login" in "Staff2_Browser"
Then I should see "Staff User" in "My Sites" in "Staff2_Browser"