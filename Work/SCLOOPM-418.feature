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
When I click on "Add News"
Then "News" page should be displayed

Scenario: Enter headline, details, select an expires date you need to set, check "School" checkbox in the Audience section at the left  and click on publish button
Given "NewsName" default value is "NewsName{date('YYYYMMDDmmss')}"
Given "ExpiryDate" default value is "{date('MM/DD/YY','30 days')}"
When I set "Headline Textbox" value to "{NewsName}"
And I click on "Details Textarea"
And I type "Details for {Details Textarea}"
And I set "Expires Textbox" value to "{ExpiryDate}"
And I "check" "School Checkbox" checkbox
And I click on "Publish Link"
Then "Success News Published Message" should be displayed

Scenario: Click on the done button and Verify the news section if the newly created news is there
When I click on "Done Button"
Then I should see "{NewsName}" in "News Item where the name is NewsName"