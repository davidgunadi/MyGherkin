Feature: SCLOOPW-11158

As an user, I should be able to trace the changes when I see the history of a page
This is traceable because User should be able to trace their page history

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "teacher3"

Scenario: Login to Gradebook Website as Teacher3
Given browser "Chrome"
When I open "{environment.Gradebook.Login URL}"
And I set "Username" value to "{credentials.teacher3.username}"
And I set "Password" value to "{credentials.teacher3.password}"
And I click on "Login"
Then "N. Gregory Portal" page should be displayed
And "Logout" should be displayed

Scenario: Click "My Website"
When I click on "My Website"
Then "N. Gregory" page should be displayed

Scenario: Click "Manage Site"
When I click on "Manage Site"
Then "User Site Center" page should be displayed

Scenario: Click "Add New"
When I click on "Add New"
Then "Page" should be displayed

Scenario: Click "Page"
When I click on "Page"
Then "Create Page" should be displayed

Scenario: Fill title as "SCLOOPW-11158", check the first layout option, click submit

Scenario: Click "Publish" button

Scenario: Click "SCLOOPW-11158" then click "Edit"

Scenario: Hover under "SCLOOPW-11158" then click plus sign

Scenario: Click "Title" icon

Scenario: Click "Publish Changes" button

Scenario: Click "SCLOOPW-11158" then click More Tools

Scenario: Click "History"

Scenario: Click "Back to Site Center"

Scenario: Click "SCLOOPW-11158" then click "Archive" button	
