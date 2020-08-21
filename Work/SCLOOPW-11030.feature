Feature: SCLOOPW-11030

As a Teacher, I can go to the class roster securely so that others can't access it without login in
This is secure because Roster page cannot be accessed without logging in with valid credentials

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "teacher3"

Scenario: Login to Gradebook Website as Teacher3
Given browser "Chrome"
When I open "{environment.Gradebook.Login URL}"
And I set "Username" value to "{credentials.teacher3.username}"
And I set "Password" value to "{credentials.teacher3.password}"
And I click on "Login"
Then "N. Gregory Portal" page should be displayed
And "Logout" should be displayed

Scenario: Access "Roster" in "Algebra 1B SPR"
When I click on "More Link (for ALGEBRA 1B SPR)"
And I click on "Roster Tool Link (for ALGEBRA 1B SPR)"
Then "Roster Printout" should be displayed
And I remember current url as "RosterPageDirectURL"

Scenario: Copy URL and Logout
When I click on "Logout"
Then "Gradebook School" page should be displayed
And "Login at the bottom of the screen" should be displayed

Scenario: Access copied URL Directly
When I open "{RosterPageDirectURL}"
Then "Login Required message" should be displayed