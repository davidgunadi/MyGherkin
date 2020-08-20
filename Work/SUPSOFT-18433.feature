Feature: SUPSOFT-18433

As an Analyst, I should be able to be available and assist user when I use the support center
This is consistent because Analyst can consistently be available and assist user from support center

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Analyst"

Scenario: Precondition - Run SUPSOFT-18454 to Initiate Chat by User
Given browser "Chrome" as "User Instance"
When I execute scenario "SUPSOFT-18454"
Then scenario steps should complete successfully

Scenario: Analyst logs in to Support Center
Given browser "Internet Explorer" as "Analyst Instance"
When I open "{environment.SupportSoft Support Center portal.URL}" in "Analyst Instance"
And I set "{credentials.Analyst.username}" to "Username Textbox in SC Login Page" value in "Analyst Instance"
And I set "{credentials.Analyst.password}" to "Password Textbox in SC Login Page" value in "Analyst Instance"
And I click on "Login Button in SC Login Page" in "Analyst Instance"
Then "LiveAssist Menu Item in SC Left Menu" should be displayed in "Analyst Instance"

Scenario: Analyst navigate to LiveAssist - Chat
When I click on "LiveAssist Menu Item in SC Left Menu" in "Analyst Instance"
And I click on "Chat Sub Menu Item under Liveassist" in "Analyst Instance"
And I switch to second window in "Analyst Instance"
Then "CSR Chat Window" page should be displayed in "Analyst Instance"
And "User Waiting (in CSR Chat Window)" should be displayed in "Analyst Instance"
And "Preferred User Waiting (in CSR Chat Window)" should be displayed in "Analyst Instance"
And "AHT (in CSR Chat Window)" should be displayed in "Analyst Instance"
And "Closed (in CSR Chat Window)" should be displayed in "Analyst Instance"
And "Escalated (in CSR Chat Window)" should be displayed in "Analyst Instance"
And "Bounced (in CSR Chat Window)" should be displayed in "Analyst Instance"

Scenario: Analyst makes himself available
When I click on "Available Icon (in First Chat Window, in CSR Chat Window)" in "Analyst Instance"
Then "Queue Status Change Available (Message in CSR Chat Window)" should be displayed in "Analyst Instance"
And "Queue poll started (Message in CSR Chat Window)" should be displayed in "Analyst Instance"
And "Hello Test Chat, Thank you for contacting LiveAssist Support, My name is analyst, How may I help you (Message in CSR Chat Window)" should be displayed in "Analyst Instance"
And "Analyst in Chat Room Box" should be displayed in "Analyst Instance"
And "This Issue will be escalated after 40 seconds (Message in CSR Chat Window)" should be displayed in "Analyst Instance"
When I wait for "10" seconds
Then "This Issue will be escalated after 30 seconds (Message in CSR Chat Window)" should be displayed in "Analyst Instance"

Scenario: Analyst Send Message to User
#When I click on "This Issue will be escalated after 30 seconds (Message in CSR Chat Window)" in "Analyst Instance"
When I click on "Analyst in Chat Room Box" in "Analyst Instance"
And I press "SHIFT+TAB" in "Analyst Instance"
And I type "Chat One - From Analyst to User" in "Analyst Instance"
And I press "ENTER" in "Analyst Instance"
Then "analyst is assisting you on this issue (Message in LiveAssist Chat)" should be displayed in "User Instance"
Then "analyst has joined the room (Message in LiveAssist Chat)" should be displayed in "User Instance"
Then "Chat One From Analyst to User (Message in LiveAssist Chat)" should be displayed in "User Instance"

Scenario: User Send Message to Analyst
When I click on "Chat Textarea in LiveAssist Chat Window" in "User Instance"
And I type "Chat Two - From User to Analyst" in "User Instance"
And I press "ENTER" in "User Instance"
Then "Chat Two From User to Analyst (Message in CSR Chat Window)" should be displayed in "Analyst Instance"