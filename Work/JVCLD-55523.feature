Feature: JVCLD-55523

As Jive admin user, I should see zero results when searching for a deleted user using API v3
This is consistent because Deleted user should not be found via API by username

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/JIVE/Environments"
Given credentials "admin"

Scenario: Precondition - Run JVCLD-42976 to Create a Standard User
Given browser "Chrome"
When I execute scenario "JVCLD-42976" to capture outputs "Email"
Then scenario steps should complete successfully

Scenario: Admin navigates to people management tab in Admin console using direct URL
Given browser "Chrome"
When I open "{environment.LatestEnvironment.URL}admin/user-search.jspa"
And I set "Admin Console Login Username field" value to "{credentials.admin.username}"
And I set "Admin Console Login Password field" value to "{credentials.admin.password}"
And I click on "Admin Console Login button"
And I click on "Admin Console ADVANCED SETTINGS button"
And I click on "Admin Console People navigation item"
And I wait until "User Profiles page in Admin Console People" appears
Then "User Profiles page in Admin Console People" should be displayed

Scenario: Search for user created in Precondition
Given "EmailVariable" default value is "{Email}"
When I set "Text field with Search Users placeholder" value to "{Email}"
And I click on "People search button"
Then "Username with the value EmailVariable" should be displayed

Scenario: Click on the user name from the Search result
When I click on "Username with the value EmailVariable"
Then I should see "{EmailVariable}" in "User Summary page heading"

Scenario: Click on "Delete User and Content"
When I click on "Delete User and Content"
Then "Delete User" page should be displayed

Scenario: Confirm User Deletion and Wait for 1 Minutes
When I click on "Delete User button in Delete User screen"
And I wait for "1" minutes
Then I should see "User deletion commenced" in "Confirmation message"
And I should see "Any errors will be reported" in "Confirmation Message"

Scenario: Open Bash Terminal and Check User is Deleted
Given "OutputShowingNoResult" value is:
"""
"list" : [ ],
"""
Given shell session
When I execute script:
"""
curl -u USERNAME:PASSWORD {environment.LatestEnvironment.URL}api/core/v3/search/people?filter=search\({Email}\)
"""
Then "{OutputShowingNoResult}" should be in output