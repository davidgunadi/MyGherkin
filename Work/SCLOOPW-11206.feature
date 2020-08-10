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

Scenario: Click "Go" button under "Account Management"	

Scenario: Change "Receive Daily Emails" to No
Scenario: Change "Receive Daily Emails" to Yes