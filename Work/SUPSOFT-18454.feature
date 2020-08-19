Feature: SUPSOFT-18454

As an admin user, I should be able to initiate chat properly when I navigate to Supportsoft User Center portal > LiveAssist chat .
This is consistent because Initiating Chat for User is working properly as specified in the E2E

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "User"

Scenario: User Navigates to User Center
Given browser "Chrome" as "User Instance"
When I open "{environment.SupportSoft User Center portal.URL}" in "User Instance"
Then "Welcome message" should be displayed in "User Instance"
And "LiveAssist Chat Menu Item on Home Page" should be displayed in "User Instance"

Scenario: Navigate to LiveAssist chat
When I click on "LiveAssist Chat Menu Item on Home Page" in "User Instance"
Then "Chat Name Textbox in LiveAssist Chat" should be displayed in "User Instance"
And "Email Textbox in LiveAssist Chat" should be displayed in "User Instance"
And "Problem Type Dropdownlist in LiveAssist Chat" should be displayed in "User Instance"
And "Problem Description Textbox in LiveAssist Chat" should be displayed in "User Instance"
And "Chat with Analyst Button in LiveAssist Chat" should be displayed in "User Instance"

Scenario: Fill in mandatory fields and submit form
Given "chat name" default value is "Test Chat"
Given "email" default value is "test@test.com"
Given "problem type" default value is "Connectivity Issues"
Given "problem description" default value is "Test problem description"
When I set "Chat Name Textbox in LiveAssist Chat" value to "{chat name}" in "User Instance"
And I set "Email Textbox in LiveAssist Chat" value to "{email}" in "User Instance"
And I set "Problem Type Dropdownlist in LiveAssist Chat" value to "{problem type}" in "User Instance"
And I set "Problem Description Textbox in LiveAssist Chat" value to "{problem description}" in "User Instance"
And I click on "Chat with Analyst Button in LiveAssist Chat" in "User Instance"
Then "Chat Textarea in LiveAssist Chat Window" should be displayed in "User Instance"
And "Send Button in LiveAssist Chat Window" should be displayed in "User Instance"
And "End Session Button in LiveAssist Chat Window" should be displayed in "User Instance"
And "You are waiting for analyst to assist you Message in LiveAssist Chat Window" should be displayed in "User Instance"
And "You have joined the room Message in LiveAssist Chat Window" should be displayed in "User Instance"