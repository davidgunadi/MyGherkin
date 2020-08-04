Feature: SCLOOPM-2839

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "stu65"

Scenario: Login to SchoolLoop website using precondition credentials and website url
Given browser "Chrome"
When I open "{environment.Gradebook.Login URL}"
And I set "Username" value to "{credentials.stu65.username}"
And I set "Password" value to "{credentials.stu65.password}"
And I click on "Login"
Then "Logout" should be displayed

Scenario: Click on loopmail icon at the top-middle of the page
When I click on "LoopMail"
Then "LoopMail: Inbox" page should be displayed
And "Inbox Table" should be displayed

Scenario: Click on the sent button at left-top of the page
When I click on "Sent Link"
Then "LoopMail: Sent" page should be displayed
And "Sent Email Table" should be displayed