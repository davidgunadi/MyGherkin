Feature: JVSRCH-10465

As Jive User, I should be able to see edited discussion when I use spotlight search
This is consistent because search result list must be consistent with recent edit operations

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/JIVE/E2E+Environement+Information"
Given credentials "admin"

Scenario: Precondition to run JVSRCH-10427 and JVSRCH-10443 (Create User and Discussion)
Given browser "Chrome"
When I execute scenario "JVSRCH-10443" to capture outputs "DiscussionTitle", "DiscussionDetails", "DiscussionTag"
Then scenario steps should complete successfully

Scenario: Login as Jive Admin user
Given browser "Chrome"
When I open "{environment.MSI.Login URL}"
And I click on "UserName Textbox"
And I type slowly "{credentials.admin.username}"
And I click on "Password Textbox"
And I type slowly "{credentials.admin.password}"
And I click on "Login Button"
Then "Home Page - User Menu Icon" should be displayed

Scenario: Click on "Search" icon
When I click on "Search icon" and retry until "Search input" appears
Then "Search input" should be displayed

Scenario: Search for Discussion created in precondition "JVSRCH-10443"
Given "VarSpotlightSearchText" default value is "{DiscussionTitle}"
When I click on "Search input"
And I type "{DiscussionTitle}"
And I press "ENTER"
Then "the Spotlight Search result displayed by search text variable" should be displayed

Scenario: Click on the Discussion Link
When I click on "the Spotlight Search result displayed by search text variable"
Then "{DiscussionTitle}" page should be displayed

Scenario: Edit the Discussion
When I click on "Edit link"
And I wait until "Discussion Description Body" appears
Then "Edit" page should be displayed

Scenario: Edit Title, Description, Tags, and Update
Given "DiscussionTitleEdited" default value is "{DiscussionTitle}_Edited"
And "DiscussionDetailsEdited" default value is "{DiscussionDetails}_Edited"
And "DiscussionTagEdited" default value is "{DiscussionTag}_Edited"
When I set "{DiscussionTitleEdited}" to "Discussion Title" value
And I click on "Discussion Description Body"
And I wait for "2" seconds
And I press "CTRL+a"
And I type "{DiscussionDetailsEdited}"
And I click on "Tag This Discussion"
And I type "{DiscussionTagEdited}"
And I press "ENTER"
And I click on "Update Button (in Edit Page)"
Then "{DiscussionTitleEdited}" page should be displayed

Scenario: Wait for a minute and Click on "Search" icon
When I wait for "60" seconds
And I click on "Search icon" and retry until "Search input" appears
Then "Search input" should be displayed


Scenario: Search for the updated Discussion Title
Given "VarSpotlightSearchText" value is "{DiscussionTitleEdited}"
When I click on "Search input"
And I type "{DiscussionTitleEdited}"
And I press "ENTER"
Then "the Spotlight Search result displayed by search text variable" should be displayed

Scenario: Search for the updated Discussion Description
When I click on "X button in Search Input"
And I type "{DiscussionDetailsEdited}"
And I press "ENTER"
Then "the Spotlight Search result displayed by search text variable" should be displayed

Scenario: Search for the updated Discussion Tag
When I click on "X button in Search Input"
And I type "{DiscussionTagEdited}"
And I press "ENTER"
Then "the Spotlight Search result displayed by search text variable" should be displayed

Scenario: Click on the Discussion Link
When I click on "the Spotlight Search result displayed by search text variable"
Then "{DiscussionTitleEdited}" page should be displayed

Scenario: Click on "Comments" Link
When I click on "Comment Link" and retry until "Comment textarea" appears
Then "Comment textarea" should be displayed

Scenario: Add a Comment
Given "RandomComment" default value is "Comment_{random_string(6)}"
When I click on "Comment textarea"
And I type "{RandomComment}"
And I click on "Add Reply button"
Then "Comment with the value as RandomComment" should be displayed

Scenario: Wait for a minute and Click on "Search" icon
When I wait for "60" seconds
And I click on "Search icon" and retry until "Search input" appears
Then "Search input" should be displayed

Scenario: Search for the added Comment
When I click on "Search input"
And I type "{RandomComment}"
And I press "ENTER"
Then "the Spotlight Search result displayed by search text variable" should be displayed

Scenario: Click on the Discussion Link
When I click on "the Spotlight Search result displayed by search text variable"
Then "{DiscussionTitleEdited}" page should be displayed

Scenario: Click on "Add a reply" Link
When I click on "Add a reply button in created discussion page" and retry until "Comment textarea" appears
Then "Comment textarea" should be displayed

Scenario: Add a Reply
Given "RandomComment" value is "Reply_{random_string(6)}"
When I click on "Comment textarea"
And I type "{RandomComment}"
And I click on "Add Reply button"
Then "Comment with the value as RandomComment" should be displayed

Scenario: Wait for a minute and Click on "Search" icon
When I wait for "60" seconds
And I click on "Search icon" and retry until "Search input" appears
Then "Search input" should be displayed

Scenario: Search for the added Reply
When I click on "Search input"
And I type "{RandomComment}"
And I press "ENTER"
Then "the Spotlight Search result displayed by search text variable" should be displayed

Scenario: Click on the "X" icon to clear the searched text
When I click on "X button in Search Input"
Then I should see "" in "Search input"

Scenario: Click again on the "X" icon to close the "Search" context panel
When I click on "X button in Search Input"
Then "Search input" should not be displayed