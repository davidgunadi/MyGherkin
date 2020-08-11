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

Scenario: Go to "My Website"
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
Given "GeneratedTitleName" default value is "SCLOOPW-11158-{date('YYYYMMDDmmss')}"
When I set "Title" value to "{GeneratedTitleName}"
And I click on "First Layout radio button"
And I click on "Submit Button"
Then "{GeneratedTitleName}" page should be displayed

Scenario: Click "Publish" button
When I click on "Header Publish Button"
Then "User Site Center" page should be displayed

Scenario: Click "SCLOOPW-11158" then click "Edit"
When I click on "Cell with the value GeneratedTitleName"
And I click on "Edit at Site Center"
Then "{GeneratedTitleName}" page should be displayed

Scenario: Hover under "SCLOOPW-11158" then click plus sign
When I hover on "Area under the Title to Add Widget"
And I click on "Plus Sign inside Area under the Title to Add Widget"
Then "Insert Module" should be displayed

Scenario: Click "Title" icon
When I click on "Title Icon in Insert Module Dialog"
Then "Module title" should be displayed

Scenario: Click "Publish Changes" button
When I click on "Publish Changes"
Then "User Site Center" page should be displayed

Scenario: Click "SCLOOPW-11158" then click More Tools
When I click on "Cell with the value GeneratedTitleName"
And I click on "More Tools"
Then "History (option under More Tools)" should be displayed

Scenario: Click "History" and verify only 2 changes are displayed
When I click on "History (option under More Tools)"
Then "Row '2' in Page History Table" should be displayed
Then "Row '3' in Page History Table" should not be displayed

Scenario: Click "Back to Site Center"
When I click on "Back to Site Center"
Then "User Site Center" page should be displayed

Scenario: Click "SCLOOPW-11158" then click "Archive" button	
When I click on "Cell with the value GeneratedTitleName"
And I click on "Archive Link"
Then "Cell with the value GeneratedTitleName" should not be displayed