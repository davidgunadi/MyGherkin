Feature: JVCLD-55513

As an Administrator, I should be able to search for a user based on his firstname that has umlaut letters when I am accessing the People tab in Admin Console
This is consistent because An existing user can be consistently be searched by its firstname that has umlaut letters.

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/JIVE/Environments"
Given credentials "admin"

Scenario: Precondition - Run JVCLD-42976 to Create a Standard User with Füße in the FirstName
Given browser "Chrome"
Given "UniqueID" default value is "{random_string(6)}"
And "FirstName" default value is "Füße{UniqueID}"
When I execute scenario "JVCLD-42976" with inputs "UniqueID" as "{UniqueID}", "FirstName" as "{FirstName}" to capture outputs "Email"
Then scenario steps should complete successfully

Scenario: Login to Admin Site
Given browser "Chrome"
When I open "{environment.LatestEnvironment.URL}/admin/login.jsp"
And I set "Admin Console Login Username field" value to "{credentials.admin.username}"
And I set "Admin Console Login Password field" value to "{credentials.admin.password}"
And I click on "Admin Console Login button"
Then "Admin Console ADVANCED SETTINGS button" should be displayed

Scenario: Go to Advanced Settings -> People -> User Search
When I click on "Admin Console ADVANCED SETTINGS button"
And I click on "Admin Console People navigation item"
And I wait until "User Profiles page in Admin Console People" appears
Then "User Profiles page in Admin Console People" should be displayed

Scenario: Search for Füße User
Given "EmailVariable" default value is "{Email}"
When I set "Text field with Search Users placeholder" value to "Füße{UniqueID}"
And I click on "People search button"
Then "Username with the value EmailVariable" should be displayed

Scenario: Search for Fuesse User
When I click on "Reset Button (in User Profiles)"
And I set "Text field with Search Users placeholder" value to "Fuesse{UniqueID}"
And I click on "People search button"
Then "Username with the value EmailVariable" should be displayed

Scenario: Open User Details
When I click on "Username with the value EmailVariable"
Then I should see "{EmailVariable}" in "User Summary page heading"
And I remember a value from "value" attribute of "First Name Textbox (in User Summary)" as "FirstNameValue"
And I should see "Füße{UniqueID}" in "First Name Textbox (in User Summary)"
And I should see "{Email}" in "Email Textbox (in User Summary)"