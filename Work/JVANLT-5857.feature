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

Scenario: User observes and writes down current number of content created (type="Documents") in the current month
When I hover on "Bar Chart for Current Month (for Content Creation)"
Then I remember a value from "Document Value (in Graph Tooltip)" as "OriginalDocumentCount"

Scenario: Create a new Document and publish it in "The community Community"
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"
When I click on "Pencil icon"
And I click on "Document link"
And I set "Document Title" value to "Doc_{RandomValue}"
And I click on "Document Body"
And I type "Sample Document Body"
And I click on "The community Community Radio Button"
And I click on "Publish button"
Then "Doc_{RandomValue}" page should be displayed

Scenario: Navigate to Avatar - Community Analytics - Community Usage Dashboard
When I click on "Avatar icon"
And I click on "Community Analytics menu item"
And I click on "Engagement Dashboard drop-down"
And I click on "Community Usage Dashboard option"
And I wait until "Content Creation Graph" appears
Then "Content Creation Graph" should be displayed

Scenario: Check the current number of content created (type="Documents") in the current month is increased by 1
Given "OriginalDocumentCountPlusOne" default value is "{to_int(OriginalDocumentCount)+1}"
When I hover on "Bar Chart for Current Month (for Content Creation)"
Then I should see "{OriginalDocumentCountPlusOne}" in "Document Value (in Graph Tooltip)"