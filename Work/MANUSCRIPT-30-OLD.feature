Feature: MANUSCRIPT-30

# EnvDS Error: href is not a confluence link

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Use one of the test accounts in our Staging environment:

https://confluence.devfactory.com/display/MAN/Environments



The users on these accounts are the Admin of the account." from "Check the E2E to Login on Staging: MANUSCRIPT-27"
Given credentials "The credentials for Administrator user is shared at:

https://confluence.devfactory.com/display/MAN/Environments"

Scenario: Login
When I execute scenario "MANUSCRIPT-27"
Then "Fogbugz Landing" page should be displayed

Scenario: Display "My Cases" Page
When I hover on "Planners" in "Left Sidebar"
And I click on "Onboarding Planner"
Then "Planner" page should be displayed
And I should see "cases" in "Planner Column"

Scenario: Display Case Page.
When I click on "Case" in "Planner Column"
Then "Case" page should be displayed

Scenario: Display Case Edit Page
When I click on "Edit" button in "Case Page"
Then I should see "Edit view" in "Case Page"

Scenario: Edit Title
When I set "Title" value to "<New_Title>"
And I set "Category" value to "<Category>"
And I set "Priority" value to "<Priority>"
And I set "Due Date" value to "<DueDate>"
And I click on "Save"
Then I should see "Case view" in "Case Page"
And I should see "<New_Title>" in "Title"
And I should see "<Category>" in "Category"
And I should see "<Priority>" in "Priority"
And I should see "<DueDate>" in "Due Date"
And I should see ""Edited By" event" in "events listview"

Scenario: Close Case
When I press "ESC"
Then I should not see "Case Page"
And "Planner" page should be displayed
And I should see "[<New_Title>, <Category>, <Priority>] Case" in "Planner Column"