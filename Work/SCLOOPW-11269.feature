Feature: SCLOOPW-11269

As an admin, I can access to groups only after login so that no other can access groups without valid credentials

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

Scenario: Click on "Groups" at top-right of the page
When I click on "Groups Link"
Then "Join/Create Groups" should be displayed
And "First Group Name under Groups Dropdown" should be displayed

Scenario: Click on "Join/Create Groups"
When I click on "Join/Create Groups"
Then "Groups" page should be displayed
And "First Group in Group Table (in Groups Page)" should be displayed
And I remember a value from "First Group in Group Table (in Groups Page)" as "GroupName"

Scenario: Click on the first group and copy the Page URL
When I click on "First Group in Group Table (in Groups Page)"
Then "{GroupName}" page should be displayed
And I remember current url as "GroupPageDirectUrl"

Scenario: Logout
When I click on "Logout"
Then "Gradebook School" page should be displayed
And "Login at the bottom of the screen" should be displayed

Scenario: Go to Copied URL
When I open "{GroupPageDirectUrl}"
Then "Login Required message" should be displayed