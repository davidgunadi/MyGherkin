Feature: BEC-77

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Beckon Web App QA" from "https://confluence.devfactory.com/display/BEC/Manual+Testing+Environments"
Given credentials "beckonqa"

Scenario: Access to beckon environment 
Given browser "Chrome"
When I open "{environment.Web Application.Login URL}"
Then "Username Input" should be displayed

Scenario: Log in
When I click on "Username Input"
And I type "{credentials.beckonqa.username}"
And I click on "Password Input"
And I type "{credentials.beckonqa.password}"
And I click on "Sign In Button"
Then "Logged In Icon Logo" should be displayed

Scenario: Switch page to MY ACCOUNTS 
When I click on "User Icon"
And I click on "My Accounts Link"
Then "My Accounts (Page Header)" should be displayed

Scenario: Show Turner home page 
When I click on "Application Support Accounts tab"
And I set "Search All Columns Input" value to "Turner"
And I click on "Turner Record"
Then "Turner Page Logo" should be displayed

Scenario: Switch page to User Management GROUPS 
When I click on "Turner Page Logo"
And I click on "Groups Menu Item Link"
Then "Groups Tab (Selected)" should be displayed

Scenario: Show group details
When I click on "Turner Standard User Record"
Then I should see "Turner Standard Users" in "Group Name Title"

Scenario: Add users
When I click on "ADD USERS (in Group Management)"
And I click on "Checkbox (for Cuong)"
And I click on "Checkbox (for Eva)"
And I click on "ADD TO GROUP (in Group Management)"
Then "Cuong Record - In Group User List" should be displayed
Then "Eva Record - In Group User List" should be displayed

Scenario: Edit group role
When I click on "User Group Role Dropdown"
And I click on "Account Admin (Dropdown Item)"
Then I should see "Account Admin" in "User Group Role Dropdown"

Scenario: Edit group name
When I click on "Group Name Title"
And I type slowly "Turner Standard Users 2"
And I press "ENTER"
Then I should see "Turner Standard Users 2" in "Group Name Title"

Scenario: Edit group name
When I click on "Group Name Title"
And I type slowly "Turner Standard Users 3"
And I press "ENTER"
Then I should see "Turner Standard Users 3" in "Group Name Title"

Scenario: Back to User Management GROUPS page
When I click on "Back Arrow (in Group Management)"
Then "Groups Tab (Selected)" should be displayed

Scenario: Search new group
When I set "Search All Columns Input" value to "Turner Standard Users 3"
Then "Turner Standard User 3 Record" should be displayed
And "A few seconds ago" should be displayed

Scenario: Show group details
When I click on "Turner Standard User 3 Record"
Then I should see "Turner Standard Users 3" in "Group Name Title"

Scenario: Edit group name
When I click on "Group Name Title"
And I type slowly "Turner Standard Users"
And I press "ENTER"
Then I should see "Turner Standard Users" in "Group Name Title"

Scenario: Delete user
When I set "Search All Columns Input" value to "Cuong"
And I hover on "Cuong Record - In Group User List"
And I click on "Delete Icon (for Cuong)"
And I click on "Confirm Dialog Button"
Then "User Deleted Message" should be displayed

Scenario: Delete user
When I set "Search All Columns Input" value to "Eva"
And I hover on "Eva Record - In Group User List"
And I click on "Delete Icon (for Eva)"
And I click on "Confirm Dialog Button"
Then "User Deleted Message" should be displayed
And "46 users (in Group Management)" should be displayed