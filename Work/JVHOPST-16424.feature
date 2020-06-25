Feature: JVHOPST-16424

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Default SE7 environment" from "https://confluence.devfactory.com/x/g1nsGg"
Given credentials "regular_user1"

Scenario: Login as Admin User
Given browser "Chrome"
When I open "{environment.Jive HOP web application.URL}"
And I click on "Email Address input field"
And I type "{credentials.regular_user1.username}"
And I click on "Password input field"
And I type "{credentials.regular_user1.password}"
And I click on "Sign in button"
Then "Main" page should be displayed

Scenario: Create a custom stream and add a group to the custom stream
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"
When I click on "News menu item"
And I click on "Plus submenu icon"
And I click on "OK Got It"
And I set "Stream name textbox" value to "GroupStream_{RandomValue}"
And I set "Search Textbox (in Stream Page)" value to "Community Group for storing ALL types of content"
And I click on "Add Button (for Community Group for storing ALL types of content)"
And I wait until "In Stream Button (for Community Group for storing ALL types of content)" appears
And I click on "Done Button (in New Stream Page)"
Then "GroupStream_{RandomValue}" page should be displayed

Scenario: Open a group page add in the custom stream in step 2
When I click on "Search icon"
And I set "Search input" value to "Community Group for storing ALL types of content"
And I click on "Community Group for storing ALL types of content (in Search Result)"
Then "Community Group for storing ALL types of content group page" should be displayed

Scenario: Create a project in the Group
When I click on "Actions dropdown"
And I click on "Project link"
And I set "Name Textbox (in Create Project)" value to "TestProject_{RandomValue}"
And I set "Description Textarea (in Create Project)" value to "TestDesc_{RandomValue}"
And I click on "Tags Textbox (in Create Project)"
And I type "TestTag"
And I type "ENTER"
And I click on "Preview"
And I click on "Create Project"
Then "Test Project in Community Group for storing ALL types of content (Header)" should be displayed

Scenario: Verify the project added in the group displayed in the custom stream created in step 2
When I click on "News menu item"
And I click on "GroupStream XXX (in Stream Page)"
Then "You created TestProject (Notification, in Stream Page)" should be displayed

Scenario: Cleanup - Delete Created Stream
When I click on "X Icon (in Stream Page)"
And I click on "Delete Icon (in Delete This Stream confirmation popup)"
Then "X Icon (in Stream Page)" should not be displayed