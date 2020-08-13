Feature: SCLOOPW-1864

As Admin, I should be able to confirm that Checker doesn't flag symbols as uppercase when I check it in Site Center's "Edit Header and Footer"
This is consistent because Admin will get consistent result when checking "Checker doesn't flag symbols as uppercase"

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "admin"

Scenario: Login to Site
Given browser "Chrome"
When I open "{environment.Gradebook.Login URL}"
And I set "Username" value to "{credentials.admin.username}"
And I set "Password" value to "{credentials.admin.password}"
And I click on "Login"
Then "Sys Admin GB's Portal" page should be displayed

Scenario: Navigate to Site Center
When I click on "Site Center"
Then "Site Center" page should be displayed

Scenario: Edit Home Page
When I click on "Home (Row in Site Center Table)"
And I click on "Edit at Site Center"
Then "Edit Homepage" page should be displayed

Scenario: Navigate to "Header and Footer" and validate No yellow warning should appear on "@ 2018 WEUSD"
When I click on "Edit Header and Footer"
Then "2018 WEUSD" should be displayed
And I remember a value from "class" attribute of "2018 WEUSD" as "ClassProperty"
And the value of "ClassProperty" should not contain "hilite"
And the value of "ClassProperty" should not contain "error"

Scenario: Cleanup - Exit Edit Mode
When I click on "Cancel Button"
And I click on "CANCEL CHANGES"
Then "Site Center" page should be displayed