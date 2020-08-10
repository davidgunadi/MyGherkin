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
Scenario: Click on "Join/Create Groups"
Scenario: Click on "Create Group" and Verify Page Elements
Scenario: Enter all fields according to your need and click on "Create"

Scenario: Logout
Scenario: Navigate to Login Page

Scenario: Login to Gradebook Website as Teacher
Scenario: Click on "Groups" at top-right of the page
Scenario: Click on "Join/Create Groups"
Scenario: Click on "Create Group" and Verify Page Elements