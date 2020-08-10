Feature: SCLOOPW-11206

As an user, I should be able to go to my account settings to change the scheduling of daily email configuration fast when I use the website
This is fast because User can change the scheduling of daily email in a timely manner

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

Scenario: Change "Receive Daily Emails" to No
Given a stopwatch "Timer"
When I click on "Change Button (for Receive Daily Emails)"
And I start the stopwatch "Timer"
And I wait until "No (status for Receive Daily Emails)"
And I stop the stopwatch "Timer"
Then "No (status for Receive Daily Emails)" should be displayed
And the stopwatch "Timer" value should be "4" sec or less

Scenario: Change "Receive Daily Emails" to Yes
When I reset the stopwatch "Timer"
And I click on "Change Button (for Receive Daily Emails)"
And I start the stopwatch "Timer"
And I wait until "Yes (status for Receive Daily Emails)"
And I stop the stopwatch "Timer"
Then "Yes (status for Receive Daily Emails)" should be displayed
And the stopwatch "Timer" value should be "4" sec or less