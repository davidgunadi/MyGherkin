Feature: JVCLD-46328

As a Jive admin user, I should be able to deactivate user when I select the user from the admin console
This is consistent because Should behave exactly as it is even if executed multiple times

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/JIVE/Environments"
Given credentials "admin"

Scenario: Precondition - Run JVCLD-42976 to Create a Standard User
Given browser "Chrome"
When I execute scenario "JVCLD-42976" to capture outputs "FirstName", "Email"
Then scenario steps should complete successfully

Scenario: Login to the application as Admin
Given browser "Chrome"
When I open "{environment.LatestEnvironment.URL}"
When I click on "Email Address"
And I type "{credentials.admin.username}"
And I click on "Password"
And I type slowly "{credentials.admin.password}"
And I click on "Log In button"
Then "Logged in as Admin user" should be displayed

Scenario: Go to User Profile -> Admin Console -> Advance Settings - People Tab
When I click on "Avatar icon" and retry until "Admin Console menu item" appears
And I click on "Admin Console menu item"
And I click on "Admin Console ADVANCED SETTINGS button"
And I click on "Admin Console People navigation item"
And I wait until "User Profiles page in Admin Console People" appears
Then "User Profiles page in Admin Console People" should be displayed

Scenario: Search for user created in Precondition
Given "EmailVariable" default value is "{Email}"
When I set "Text field with Search Users placeholder" value to "{FirstName}"
And I click on "People search button"
Then "Username with the value EmailVariable" should be displayed

Scenario: Click on the user name from the Search result
When I click on "Username with the value EmailVariable"
Then I should see "{EmailVariable}" in "User Summary page heading"

Scenario: Deactivate The User
When I click on "Deactivate User button"
Then I remember the alert text as "AlertMessage"
And the value of "AlertMessage" should be "Are you sure you want to deactivate this user account?"

Scenario: Accept Deactivate Alert Confirmation
When I accept the alert box
Then "Activate User button" should be displayed
And I should see "No" in "The value for Activated Row"