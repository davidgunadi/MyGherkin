Feature: NORTHP-19467

As an Admin, I should be able to create a user when I create a user with convert ability
This is consistent because In this E2E we get the same result as expected

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Telescope Web Server QA" from "https://confluence.devfactory.com/display/NOR/Telescope+-+Testing+environments+-+Data+Structure+Environments"
Given credentials "telescopetswebqa"

Scenario: Login to the TSAdmin
Given browser "Chrome"
When I open "{environment.TSAdmin application.URL}"
And I click on "Connect To"
And I click on "TSAdmin - Administer - qnps_npsqadb option from dropdown"
And I set "{credentials.telescopetswebqa.username}" to "Username" value
And I set "{credentials.telescopetswebqa.password}" to "Password" value
And I click on "TSAdmin - Login"
Then "TeleScope Administrator" page should be displayed
And "TSAdmin - Logout" should be displayed

Scenario: Open Create new user page
When I click on "TSAdmin - Users and Groups"
And I click on "TSAdmin - Users and Groups - As Users"
And I click on "TSAdmin - Users and Groups - Add User button"
Then "Edit Users" page should be displayed

Scenario: Fill up the fields
Given "GeneratedUserName" default value is "User_{random_string(6)}"
When I set "TSAdmin - Users and Groups - User Name" value to "{GeneratedUserName}"
And I set "TSAdmin - Users and Groups - First Name" value to "{GeneratedUserName}"
And I set "TSAdmin - Users and Groups - Last Name" value to "{GeneratedUserName}"
And I set "TSAdmin - Users and Groups - Password" value to "Password123!"
And I click on "TSAdmin - Users and group - Selection Icon for Member of"
And I click on "TSAdmin - Users and group - Default Option (in Member Of Listbox)"
And I set "TSAdmin - Users and Groups - E-Mail" value to "{GeneratedUserName}@northplains.io"
And I "check" "TSAdmin - Users and Groups - Copy Files checkbox" checkbox
And I "check" "TSAdmin - Users and Groups - Convert All Files" checkbox 
And I "check" "TSAdmin - Users and Groups - Allow Telescope Uploader checkbox" checkbox 
And I "check" "TSAdmin - Users and Groups - Check Out Files" checkbox 
And I click on "TSAdmin - Users and Groups - Save button"
And I click on "TSAdmin - Users and Groups"
And I click on "TSAdmin - Users and Groups - As Users"
Then "User with the name GeneratedUserName in the User Table" should be displayed

Scenario: Logout
When I click on "TSAdmin - Logout"
Then "Username" should be displayed