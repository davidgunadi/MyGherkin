Feature: SCLOOPM-2837

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "stu65"

Scenario: Login to SchoolLoop website using precondition credentials and website url
Given browser "Chrome"
When I open "{environment.Gradebook.Login URL}"
And I set "Username" value to "{credentials.stu65.username}"
And I set "Password" value to "{credentials.stu65.password}"
And I click on "Login"
Then "Logout" should be displayed

Scenario: Click on settings button at the top-right corner and Check the email address field in the account settings page
When I click on "Settings Icon on Top Right Side of the Main Page"
Then "Edit Your Account" page should be displayed
And I should see "@" in "Email Address Textbox (in Settings Page)"