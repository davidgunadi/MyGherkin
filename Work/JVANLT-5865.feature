Feature: JVANLT-5865

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

Scenario: User observes and writes down current number of content created (type="Videos") in the current month
When I hover on "Bar Chart for Current Month (for Content Creation)"
Then I remember a value from "Videos Value (in Graph Tooltip)" as "OriginalVideosCount"

Scenario: Create a new Video and publish it in "Community"
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"
When I click on "Pencil icon"
And I click on "Video link"
And I wait until "Cancel Button (Enabled)" appears
And I click on "The community Community Radio Button"
And I click on "Video Textbox (in Video Page)"
And I type slowly "https://www.youtube.com/watch?v=EngW7tLk6R8"
And I click on "Import Video Button (in Video Page) (In Enabled State)"
And I wait until "Youtube Video Preview" appears
And I click on "Video Title (in Video Page)"
And I type "Video_{RandomValue}"
And I click on "Video Body (in HTML Formatting)"
And I type "Sample Video Body"
And I click on "Publish button"
And I wait until "Global Reach" appears
Then "Video_{RandomValue}" page should be displayed

Scenario: Navigate to Avatar - Community Analytics - Community Usage Dashboard
When I click on "Avatar icon"
And I click on "Community Analytics menu item"
And I click on "Engagement Dashboard drop-down"
And I click on "Community Usage Dashboard option"
And I wait until "Content Creation Graph" appears
Then "Content Creation Graph" should be displayed

Scenario: Check the current number of content created (type="Videos") in the current month is increased by 1
Given "OriginalVideosCountPlusOne" default value is "{to_int(OriginalVideosCount)+1}"
When I hover on "Bar Chart for Current Month (for Content Creation)"
Then I should see "{OriginalVideosCountPlusOne}" in "Videos Value (in Graph Tooltip)"