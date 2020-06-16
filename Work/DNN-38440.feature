Feature: DNN-38440

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Evoq Engage (Automation)" from "https://confluence.devfactory.com/display/DNN/Environment+Data+Structure"
Given credentials "dnnhost"

Scenario: Log in
Given browser "Chrome"
When I open "{environment.Site.URL}"
And I click on "Login link"
And I set "{credentials.dnnhost.username}" to "Username" value
And I set "{credentials.dnnhost.password}" to "Password" value
And I click on "Login button"
Then "DNN logo at the top left" should be displayed

Scenario: Add a fake web server
When I hover on "SETTINGS menu"
And I click on "SQL Console menu item"
And I click on "Query editor"
And I type "insert into WebServers (ServerName, CreatedDate, LastActivityDate, URL, IISAppName, Enabled, ServerGroup, UniqueId, PingFailureCount) values ('FAKE-SERVER-1', getdate(), getdate(), 'fake-server-1-url.dnndev.me', '/LM/W3SVC/991/ROOT', 1, null, null, 0), ('FAKE-SERVER-2', getdate(), getdate(), 'fake-server-2-url.dnndev.me', '/LM/W3SVC/992/ROOT', 1, null, null, 0); select * from WebServers where ServerName like 'FAKE-SERVER-%' order by ServerName"
And I click on "Run Script"
Then "FakeServer1 Query Result" should be displayed
And "FakeServer2 Query Result" should be displayed

Scenario: Set a task to run on a fake server (part 1)
When I hover on "SETTINGS menu"
And I click on "Servers menu item"
And I click on "Clear Cache"
And I wait for "5" seconds
And I hover on "SETTINGS menu"
And I click on "Scheduler menu item"
And I click on "SCHEDULER tab"
And I click on "Edit Icon for Purge Cache"
And I set "Server Textbox (in Scheduler)" value to "FAKE-SERVER-1"
And I click on "Update Button (in Scheduler)"
Then "Update Successful Message (in Scheduler)" should be displayed

Scenario: Set a task to run on a fake server (part 2)
When I click on "Server Selection Dropdown"
And I click on "FAKE-SERVER-2 Dropdown Item"
Then "Purge Cache (task name in Scheduler)" should not be displayed

Scenario: Cleanup (Part 1)
When I click on "Server Selection Dropdown"
And I click on "All Dropdown Item"
And I click on "Edit Icon for Purge Cache"
And I set "Server Textbox (in Scheduler)" value to ""
And I click on "Update Button (in Scheduler)"
Then "Update Successful Message (in Scheduler)" should be displayed

Scenario: Cleanup (Part 2)
When I hover on "SETTINGS menu"
And I click on "SQL Console menu item"
And I click on "Query editor"
And I type "delete WebServers where ServerName like 'FAKE-SERVER-%'; select count(1) CountOfFakeServers from WebServers where ServerName like 'FAKE-SERVER-%'"
And I click on "Run Script"
And I hover on "SETTINGS menu"
And I click on "Servers menu item"
And I click on "Clear Cache"
And I wait for "5" seconds
And I click on "Close Persona Bar button"
And I wait unless "Close Persona Bar button" appears
And I hover on "DNN logo at the top left"
And I click on "Logout in Evoq Logo menu"
Then "Login link" should be displayed