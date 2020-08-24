Feature: JVSRCH-10519

As a jive user I should see my username on the project following list when I created this project
This is consistent because data on the project followers must be consistent and user that created the place should be included

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/JIVE/E2E+Environement+Information"
Given credentials "admin"

Scenario: Login
Given "SiteURL" default value is "{environment.K2.Login URL}"
Given browser "Chrome"
When I open "{SiteURL}"
And I set "Email Address input field" value to "{credentials.admin.username}"
And I set "Password input field" value to "{credentials.admin.password}"
And I click on "Sign in button"
Then "Logged in as Admin user" should be displayed

Scenario: Open Content creation Menu
When I click on "Pencil Icon"
Then "List of Contents that can be created" should be displayed

Scenario: Click On Projects link
When I click on "Project menu item in Create menu"
Then "Create a Project (Select a different type) Dialog" should be displayed

Scenario: Select first recently selected place
When I click on "First Link In Recently Selected Places List"
Then "Create Project" page should be displayed
And "Create Project Dialog" should be displayed

Scenario: Create Project
Given "projectName" default value is "TestProject{random_string()}"
When I set "Name Textbox (in Create Project)" value to "{projectName}"
And I wait until "Green Tick Mark for URL Textbox (in Create Project)" appears
And I click on "Create Project Button"
Then "Project page(view mode) header" should be displayed

Scenario: Navigate to People > Followers
When I click on "Project Page - People Tab"
And I click on "Followers Link In People Tab"
Then "List of Followers" should be displayed