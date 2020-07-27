Feature: JVANLT-5863

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
And I wait until "Application landing page" appears
Then "Welcome" page should be displayed

Scenario: Navigate to Avatar - Community Analytics - Community Usage Dashboard
When I click on "Avatar icon"
And I click on "Community Analytics menu item"
And I click on "Engagement Dashboard drop-down"
And I click on "Community Usage Dashboard option"
And I wait until "Content Creation Graph" appears
Then "Content Creation Graph" should be displayed

Scenario: User observes and writes down current number of content created (type="Polls") in the current month
When I wait for "2" seconds
And I hover on "Bar Chart for Current Month (for Content Creation)"
Then I remember a value from "Polls Value (in Graph Tooltip)" as "OriginalPollsCount"

Scenario: Create a new Poll and publish it in Community
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"
When I click on "Pencil icon"
And I click on "Poll link"
And I wait until "Cancel Button (Enabled)" appears
And I set "Event Page title" value to "Polls_{RandomValue}"
And I set "Choice1_{RandomValue}" value to "Choice 1 Textbox"
And I set "Choice2_{RandomValue}" value to "Choice 2 Textbox"
And I click on "Event Body (in HTML Formatting)"
And I type "Sample Polls Body"
And I click on "The community Community Radio Button"
And I wait until "In a Place Textbox" disappears
And I click on "Create Poll Button"
And I wait until "Add a comment Button (Enabled)" appears
Then "Polls_{RandomValue}" page should be displayed

Scenario: Navigate to Avatar - Community Analytics - Community Usage Dashboard
When I click on "Avatar icon"
And I click on "Community Analytics menu item"
And I click on "Engagement Dashboard drop-down"
And I click on "Community Usage Dashboard option"
And I wait until "Content Creation Graph" appears
Then "Content Creation Graph" should be displayed

Scenario: Check the current number of content created (type="Polls") in the current month is increased by 1
Given "OriginalPollsCountPlusOne" default value is "{to_int(OriginalPollsCount)+1}"
When I wait for "2" seconds
And I hover on "Bar Chart for Current Month (for Content Creation)"
Then I should see "{OriginalPollsCountPlusOne}" in "Events Value (in Graph Tooltip)"