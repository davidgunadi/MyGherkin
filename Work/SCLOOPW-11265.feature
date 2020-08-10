Feature: SCLOOPW-11265

As a teacher, I should be able to access group page so that I can create new group when I login into the site
This is consistent because Teacher can consistently create a new group

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "teacher" and "teacher3"

Scenario: Login to Gradebook Website as Teacher3
Given browser "Chrome"
When I open "{environment.Gradebook.Login URL}"
And I set "Username" value to "{credentials.teacher3.username}"
And I set "Password" value to "{credentials.teacher3.password}"
And I click on "Login"
Then "Logout" should be displayed

Scenario: Click on "Groups" at top-right of the page
When I click on "Groups Link"
Then "Join/Create Groups" should be displayed
And "First Group Name under Groups Dropdown" should be displayed

Scenario: Click on "Join/Create Groups"
When I click on "Join/Create Groups"
Then "Groups" page should be displayed

Scenario: Click on "Create Group" and Verify Page Elements
When I click on "Create Group link"
Then "Create Group - Name Input" should be displayed
And "Create Group - Description Input" should be displayed
And "Create Group - Private Group checkbox" should be displayed
And "Standard Group Radio Button" should be displayed
And "Curriculum Group Radio Button" should be displayed

Scenario: Enter all fields according to your need and click on "Create"
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"
Given "GroupNameForTeacher3" default value is "GroupTeacher3_{RandomValue}"
When I set "Create Group - Name Input" value to "GroupTeacher3_{RandomValue}"
And I click on "Create Group - Description Input"
And I type "Sample Description Teacher 3 {RandomValue}"
And I click on "Create Button"
Then "{GroupNameForTeacher3}" page should be displayed

Scenario: Logout
When I click on "Logout"
Then "Gradebook School" page should be displayed
And "Login at the bottom of the screen" should be displayed

Scenario: Navigate to Login Page
When I click on "Login at the bottom of the screen"
Then "Username" should be displayed

Scenario: Login to Gradebook Website as Teacher
Given browser "Chrome"
When I open "{environment.Gradebook.Login URL}"
And I set "Username" value to "{credentials.teacher.username}"
And I set "Password" value to "{credentials.teacher.password}"
And I click on "Login"
Then "Logout" should be displayed

Scenario: Click on "Groups" at top-right of the page
When I click on "Groups Link"
Then "Join/Create Groups" should be displayed
And "First Group Name under Groups Dropdown" should be displayed

Scenario: Click on "Join/Create Groups"
When I click on "Join/Create Groups"
Then "Groups" page should be displayed

Scenario: Click on "Create Group" and Verify Page Elements
When I click on "Create Group link"
Then "Create Group - Name Input" should be displayed
And "Create Group - Description Input" should be displayed
And "Create Group - Private Group checkbox" should be displayed
And "Standard Group Radio Button" should be displayed
And "Curriculum Group Radio Button" should be displayed