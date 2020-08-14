Feature: SCLOOPW-1495

As Admin, I should be able to archive and restore pages in site center when I use the standard website
This is consistent because Admin will get consistent result when archiving and restoring pages

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "admin"

Scenario: Login to Site
Given browser "Chrome"
When I open "{environment.Standard School Site.Login URL}"
And I set "Username" value to "{credentials.admin.username}"
And I set "Password" value to "{credentials.admin.password}"
And I click on "Login"
Then "Sys Admin Standard's Portal" page should be displayed

Scenario: Navigate to "Site Center"
When I click on "Site Center"
Then "Site Center" page should be displayed

Scenario: Click "Tools" Tab
When I click on "Tools tab"
Then "View List Button" should be displayed

Scenario: Click "View List" button
When I click on "View List Button"
Then "Archived Content" page should be displayed

Scenario: Check Accessibility Issues - Links and click Undelete
When I "check" "Checkbox for Accessibility Issues - Links (in Archive Page)" checkbox
And I click on "Undelete Button"
Then "Select Destination Dialog" should be displayed

Scenario: Click OK
When I click on "OK"
Then "Site Center" page should be displayed
And "View List Button" should be displayed

Scenario: Click Pages Tab
When I click on "Pages Tab"
Then "Accessibility Issues - Links (in Site Center Page)" should be displayed

Scenario: Click "Accessibility Issues - Links" and click Archive button
When I click on "Accessibility Issues - Links (in Site Center Page)"
And I click on "Archive Button (in User Site Center page)"
And I wait until "Accessibility Issues - Links (in Site Center Page)" disappears
Then "Accessibility Issues - Links (in Site Center Page)" should not be displayed