Feature: JVANLT-5866

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

Scenario: User observes and writes down current number of content created (type="Ideas") in the current month
When I hover on "Bar Chart for Current Month (for Content Creation)"
Then I remember a value from "Ideas Value (in Graph Tooltip)" as "OriginalIdeasCount"

Scenario: Create a new Idea and publish it in "The community Community"
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"
When I click on "Pencil icon"
And I click on "Idea link"
And I wait until "Cancel Button (Enabled)" appears
And I click on "Idea Title (in Idea Page)"
And I type "Idea_{RandomValue}"
And I click on "Idea Body (in HTML Formatting)"
And I type "Sample Idea Body"
And I click on "The community Community Radio Button"
And I wait until "In a Place Textbox" disappears
And I click on "Publish button"
And I wait until "Global Reach" appears
Then "Idea_{RandomValue}" page should be displayed

Scenario: Navigate to Avatar - Community Analytics - Community Usage Dashboard
When I click on "Avatar icon"
And I click on "Community Analytics menu item"
And I click on "Engagement Dashboard drop-down"
And I click on "Community Usage Dashboard option"
And I wait until "Content Creation Graph" appears
Then "Content Creation Graph" should be displayed

Scenario: Check the current number of content created (type="Ideas") in the current month is increased by 1
Given "OriginalIdeasCountPlusOne" default value is "{to_int(OriginalIdeasCount)+1}"
When I hover on "Bar Chart for Current Month (for Content Creation)"
Then I should see "{OriginalIdeasCountPlusOne}" in "Document Value (in Graph Tooltip)"