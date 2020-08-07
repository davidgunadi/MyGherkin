Feature: SCLOOPW-11260

As a student, I can access groups where I am assigned so that I can see the contents related to the group
This is accessible because User can access groups assigned to the user

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

Scenario: Click on "Groups" at top-right of the page
When I click on "Groups Link"
Then "About Groups" should be displayed
And "First Group Name under Groups Dropdown" should be displayed

Scenario: Navigate to "About Groups" Page
When I click on "About Groups"
Then "Groups" page should be displayed
And "First Group in Group Table (in Groups Page)" should be displayed
And I remember a value from "First Group in Group Table (in Groups Page)" as "GroupName"

Scenario: Verify Group Details
When I click on "First Group in Group Table (in Groups Page)"
Then "{GroupName}" page should be displayed

Scenario: Verify Logout
When I click on "Logout"
Then "Gradebook School" page should be displayed
And "Login at the bottom of the screen" should be displayed