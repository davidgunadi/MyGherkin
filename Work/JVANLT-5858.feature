Feature: JVANLT-5858

As a User with Manage Community permissions, I should be able to verify that newly created content (type=Blog Posts) affects Analytics reports, when I access Community Analytics / Content Creation Report.
This is consistent because This E2E verifies the user ability to create a content of type Blog Post in a consistent way

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
When I click on "Avatar icon" and retry until "Community Analytics menu item" appears
And I click on "Community Analytics menu item"
And I click on "Engagement Dashboard drop-down"
And I click on "Community Usage Dashboard option"
And I wait until "Content Creation Graph" appears
Then "Content Creation Graph" should be displayed

Scenario: User observes and writes down current number of content created (type="Blog Posts") in the current month
When I hover on "Bar Chart for Current Month (for Content Creation)"
Then I remember a value from "Blog Posts Value (in Graph Tooltip)" as "OriginalBlogPostsCount"

Scenario: Create a new Blog Post and publish it in Your Personal Blog
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"
When I click on "Pencil icon"
And I click on "Blog Post link"
And I wait until "Cancel Button (Enabled)" appears
And I click on "Blog title"
And I type "Blog_{RandomValue}"
And I click on "Blog Post Body (in HTML Formatting)"
And I type "Sample Blog Body"
And I click on "Your personal blog"
And I click on "Publish button"
And I wait until "Global Reach" appears
Then "Blog_{RandomValue}" page should be displayed

Scenario: Navigate to Avatar - Community Analytics - Community Usage Dashboard
When I click on "Avatar icon"
And I click on "Community Analytics menu item"
And I click on "Engagement Dashboard drop-down"
And I click on "Community Usage Dashboard option"
And I wait until "Content Creation Graph" appears
Then "Content Creation Graph" should be displayed

Scenario: Check the current number of content created (type="Blog Posts") in the current month is increased by 1
Given "OriginalBlogPostsCountPlusOne" default value is "{to_int(OriginalBlogPostsCount)+1}"
When I hover on "Bar Chart for Current Month (for Content Creation)"
Then I should see "{OriginalBlogPostsCountPlusOne}" in "Blog Posts Value (in Graph Tooltip)"