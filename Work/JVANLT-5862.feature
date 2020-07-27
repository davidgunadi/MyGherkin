Feature: JVANLT-5862

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

Scenario: User observes and writes down current number of content created (type="Events") in the current month
When I hover on "Bar Chart for Current Month (for Content Creation)"
Then I remember a value from "Events Value (in Graph Tooltip)" as "OriginalEventCount"

Scenario: Create a new Event and Publish it in Community
#User clicks on Pencil -> Event -> enters some title, enters some location and some body, selects any Event Type, selects Community as publish location -> Create Event


Scenario: Navigate to Avatar - Community Analytics - Community Usage Dashboard
When I click on "Avatar icon"
And I click on "Community Analytics menu item"
And I click on "Engagement Dashboard drop-down"
And I click on "Community Usage Dashboard option"
And I wait until "Content Creation Graph" appears
Then "Content Creation Graph" should be displayed

Scenario: Check the current number of content created (type="Events") in the current month is increased by 1
Given "OriginalEventCountPlusOne" default value is "{to_int(OriginalEventCount)+1}"
When I hover on "Bar Chart for Current Month (for Content Creation)"
Then I should see "{OriginalEventCountPlusOne}" in "Events Value (in Graph Tooltip)"