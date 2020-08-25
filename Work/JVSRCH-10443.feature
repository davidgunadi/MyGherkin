Feature: JVSRCH-10443

As a Jive user, I should see a newly created discussion in "Your Content" page when I just created a new discussion
This is consistent because The content shown on the current user "Your Content" page would be consistent with recently created discussion

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/JIVE/E2E+Environement+Information"
Given credentials "admin"

Scenario: Precondition to create user
Given browser "Chrome"
When I execute scenario "JVSRCH-10427" to capture outputs "Email", "Password"
Then scenario steps should complete successfully

Scenario: Login as Jive user created in precondition
When I open "{environment.MSI.Login URL}"
And I click on "Email Address Textfield"
And I type slowly "{Email}"
And I click on "Password Textfield"
And I type slowly "{Password}"
And I click on "Login Button"
Then "Home Page - User Menu Icon" should be displayed

Scenario: Goto Start a discussion page
When I click on "Pencil Icon"
And I click on "Discussion menu item in Create menu"
Then "Start a discussion" page should be displayed

Scenario: Enter details and create a discussion
Given "DiscussionTitle" default value is "Test Discussion {random_string(5)}"
And "DiscussionDetails" default value is "Test Content {random_string(5)}"
And "DiscussionTag" default value is "TestTag{random_string(3)}"
When I set "{DiscussionTitle}" to "Discussion Title" value
And I set "{DiscussionDetails}" to "Discussion Details" value
And I click on "The community Community option"
And I click on "Tag This Discussion"
And I type "{DiscussionTag}"
And I press "ENTER"
And I click on "Post button in Start a discussion page"
And I wait until "Add a reply button in created discussion page" appears
Then "Created Discussion Page with Title" should be displayed

Scenario: Goto Your Content page and verify the discussion created
When I click on "Avatar icon"
And I click on "Your Content"
Then "All Content Tab" should be displayed
And "Created Discussion In Your Content Page" should be displayed