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
Scenario: Search for Discussion created in precondition "JVSRCH-10443"
Scenario: Click on the Discussion Link
Scenario: Edit the Discussion
Scenario: Edit Title, Description, Tags, and Update
Scenario: Wait for a minute and Click on "Search" icon
Scenario: Search for the updated Discussion Title
Scenario: Search for the updated Discussion Description
Scenario: Search for the updated Discussion Tag
Scenario: Click on the Discussion Link
Scenario: Click on "Comments" Link
Scenario: Add a Comment
Scenario: Wait for a minute and Click on "Search" icon
Scenario: Search for the added Comment
Scenario: Click on the Discussion Link
Scenario: Click on "Add a reply" Link
Scenario: Add a Reply
Scenario: Wait for a minute and Click on "Search" icon
Scenario: Search for the added Reply
Scenario: Click on the "X" icon to clear the searched text
Scenario: Click again on the "X" icon to close the "Search" context panel