Feature: SCLOOPM-2620

As a teacher, I want to be able to access Loopmail when I want to send mail to other users
This is accessible because User should be able to access SchoolLoop Android app and access Loopmail

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "teacher"

Scenario: Login to SchoolLoop Android application
Given UI connection to "School Loop - Android" as "app"
When I run application "https://appcenter.ms/orgs/School-Loop/apps/School-Loop-QA" in "app"
And I click on "School Name-mobile" in "app"
And I set "School Name input-mobile" value to "{credentials.teacher.school}" in "app"
And I set "User Name-mobile" value to "{credentials.teacher.username}" in "app"
And I set "Password-mobile" value to "{credentials.teacher.password}" in "app"
And I click on "Login button-mobile" in "app"
Then "News icon-mobile" should be displayed in "app"
And I should see "News" in "News icon-mobile" in "app"

Scenario: Navigate to Loopmail
When I click on "Compose Icon (on Top Right Side of Screen - Mobile)"
Then "New Loopmail Header (Mobile)" should be displayed