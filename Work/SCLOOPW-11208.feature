Feature: SCLOOPW-11208

As a user, I should be able to go to my account settings and logout to verify my scheduling settings are secure when I use the website direct URL
This is secure because Site settings is not accessible via direct URL unless user is logged in

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "teacher3"

Scenario: Login to Gradebook Website as Teacher3
Given browser "Chrome"
When I open "{environment.Gradebook.Login URL}"
And I set "Username" value to "{credentials.teacher3.username}"
And I set "Password" value to "{credentials.teacher3.password}"
And I click on "Login"
Then "Logout" should be displayed

Scenario: Click "Settings" in top right corner
When I click on "Settings Icon on Top Right Side of the Main Page"
Then "Settings" page should be displayed

Scenario: Click "Go" button under "Account Management"	
When I click on "Go button for Account Management"
Then "Edit Your Account" page should be displayed
And "Receive Daily Emails" should be displayed
And I remember current url as "SettingsPageDirectURL"

Scenario: Logout
When I click on "Logout"
Then "Gradebook School" page should be displayed
And "Login at the bottom of the screen" should be displayed

Scenario: Go to Copied URL
When I open "{SettingsPageDirectURL}"
Then "Login Required message" should be displayed