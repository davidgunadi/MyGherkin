Feature: JVANLT-5857

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Jive Analytics E2E" from "https://confluence.devfactory.com/display/EN/Jive+Analytics+-+E2E+Environment+Data"
Given credentials "ca user"

Scenario: Login as User
Given browser "Chrome"
When I open "{environment.Jive Cloud.URL}"
And I set "Email Address input field" value to "{credentials.ca user.username}"
And I set "Password input field" value to "{credentials.ca user.password}"
And I click on "Sign in button"
Then "Welcome" page should be displayed

Scenario: Navigate to Avatar - Community Analytics - Community Usage Dashboard
When I click on "Avatar icon"
And I click on "Community Analytics menu item"
And I click on "Engagement Dashboard drop-down"
And I click on "Community Usage Dashboard option"
And I wait until "Content Creation Graph" appears
Then "Content Creation Graph" should be displayed


User clicks on Avatar -> Community Analytics -> clicks on Engagement Dashboard dropdown and selects Community Usage Dashboard
Community Usage Dashboard is displayed and all reports are loaded

User observes and writes down current number of content created (type="Documents") in the current month
Number of content created (type="Documents") saved to paper/text editor

User clicks on Pencil -> Document -> enters some title and some body, selects "The community Community" as publish location -> Publish
Document created successfully and displayed on screen

User clicks on Avatar -> Community Analytics -> clicks on Engagement Dashboard dropdown and selects Community Usage Dashboard
Community Usage Dashboard is displayed and all reports are loaded

Check the current number of content created (type="Documents") in the current month
The count should be increased by one compared to value recorded in step 3
Scenario: Preconditions
Given environment from ""

