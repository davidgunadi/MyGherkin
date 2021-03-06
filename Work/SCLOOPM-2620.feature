Feature: SCLOOPM-2620

As a teacher, I want to be able to access Loopmail when I want to send mail to other users
This is accessible because User should be able to access SchoolLoop Android app and access Loopmail

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "teacher"

Scenario: Login to SchoolLoop Android application
Given UI connection to "School Loop - Android"
When I run application "https://appcenter.ms/orgs/School-Loop/apps/School-Loop-QA"
And I click on "School Name-mobile"
And I click on "School Name input-mobile"
And I type "{credentials.teacher.school}"
And I click on "User Name-mobile"
And I type "{credentials.teacher.username}"
And I click on "Password-mobile"
And I type "{credentials.teacher.password}"
And I click on "Login button-mobile"
Then "Compose Icon (on Top Right Side of Screen - Mobile)" should be displayed

Scenario: Navigate to Loopmail
When I click on "Compose Icon (on Top Right Side of Screen - Mobile)"
Then "New Loopmail Header (Mobile)" should be displayed

Scenario: Fill in the Fields
Given "RandomEmailSubject" default value is "Email_{random_string(6)}"
When I click on "To Textbox (in New Loopmail - Mobile)"
And I type "vanessa alonzo"
And I click on "VANESSA Alonzo (in Dropdown List)"
And I press "TAB"
And I click on "CC Textbox (in New Loopmail - Mobile)"
And I type "vanessa alonzo"
And I click on "VANESSA Alonzo (in Dropdown List)"
And I press "TAB"
And I click on "Subject Textbox (in New Loopmail - Mobile)"
And I type "{RandomEmailSubject}"
And I click on "Message Textbox (in New Loopmail - Mobile)"
And I type "Test Email Message"
And I click on "Send Button (in New Loopmail - Mobile)"
And I click on "Mailbox Selector in the Top Bar (in Loopmail - Mobile)"
And I click on "Sent Option in Dropdown (in Loopmail - Mobile)"
Then "Email with the subject as RandomEmailSubject (in Loopmail - Mobile)" should be displayed