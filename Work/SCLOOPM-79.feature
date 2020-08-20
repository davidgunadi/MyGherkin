Feature: SCLOOPM-79

As a staff, I want to be able to access loopmail in schoolloop android app when I want to compose new mail
This is accessible because Staff should be able to access SchoolLoop Android app and access Loopmail

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/SCHOOL/Environments"
Given credentials "staff"

Scenario: Login to school loop application as staff using precondition credential
Given UI connection to "School Loop - Android"
When I run application "https://appcenter.ms/orgs/School-Loop/apps/School-Loop-QA"
And I click on "School Name-mobile"
And I click on "School Name input-mobile"
And I type "{credentials.staff.school}"
And I click on "User Name-mobile"
And I type "{credentials.staff.username}"
And I click on "Password-mobile"
And I type "{credentials.staff.password}"
And I click on "Login button-mobile"
Then "Compose Icon (on Top Right Side of Screen - Mobile)" should be displayed

Scenario: Navigate to Loopmail
When I click on "Compose Icon (on Top Right Side of Screen - Mobile)"
Then "New Loopmail Header (Mobile)" should be displayed

Scenario: Fill in the To Field and Click Suggested Name
Given "RandomEmailSubject" default value is "Email_{random_string(6)}"
When I click on "To Textbox (in New Loopmail - Mobile)"
And I type "principal principal"
And I click on "principal principal (in Dropdown List)"
And I press "TAB"
Then "principal principal as Recipient Name (in New Loopmail - Mobile)" should be displayed

Scenario: Enter Subject and Details, then Send the email
When I click on "Subject Textbox (in New Loopmail - Mobile)"
And I type "{RandomEmailSubject}"
And I click on "Message Textbox (in New Loopmail - Mobile)"
And I type "Test Email Message"
And I click on "Send Button (in New Loopmail - Mobile)"
And I click on "Mailbox Selector in the Top Bar (in Loopmail - Mobile)"
And I click on "Sent Option in Dropdown (in Loopmail - Mobile)"
Then "Email with the subject as RandomEmailSubject (in Loopmail - Mobile)" should be displayed