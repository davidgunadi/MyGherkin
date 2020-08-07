Feature: SCLOOPW-11267

As an admin, I do able to access group so that I can see the information of the group loads fast

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

Scenario: Click on the first group and verify page is opened in timely manner
Given a stopwatch "Timer"
When I click on "First Group in Group Table (in Groups Page)"
And I start the stopwatch "Timer"
Then "{GroupName}" page should be displayed
When I stop the stopwatch "Timer"
Then the stopwatch "Timer" value should be "5" sec or less