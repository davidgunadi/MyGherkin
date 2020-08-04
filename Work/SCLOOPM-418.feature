Feature: SCLOOPM-418

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "admin"

Scenario: Login to SchoolLoop website using precondition credentials and website url
Given browser "Chrome"
When I open "{environment.Gradebook.Login URL}"
And I set "Username" value to "{credentials.admin.username}"
And I set "Password" value to "{credentials.admin.password}"
And I click on "Login"
Then "Logout" should be displayed

Scenario: At the right side, in the new section, click on Add News button

Scenario: Enter headline, details, select an expires date you need to set, check "School" checkbox in the Audience section at the left  and click on publish button

Scenario: Click on the done button and Verify the news section if the newly created news is there