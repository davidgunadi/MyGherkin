Feature: DNN-38440

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* Environment * DNN Platform (QA) * For TC writing
       * Use a fresh QA Personal Environment
      
      
    * DNN Platform * For SE7 testing
      
      
   
   
 * Selectors * Login link: //*[@id="dnn_userLogin_loginLink"]
    * User Log In popup: Popup window with "User Log In" title
    * Username: Username input box in "User Log In popup"
    * Password: Password input box in "User Log In popup"
    * Login button: Login button in "User Log In popup"
    * Close Persona Bar button: //*[@id="showsite"]
    * DNN logo: //*[@id="personabar"]/div[@class="personabarLogo"]
    * Logout: //*[@id="Logout"]
    * SETTINGS menu: //li[@id="Settings"]
    * SQL Console menu item: //li[@id="Dnn.SqlConsole"]
    * SQL Console panel: //div[@id="SqlConsole-panel"]
    * SQL script area: //div[@class="CodeMirror-lines"]//pre
    * Run Script: //button[text()="Run Script"]
    * ServerName column: //div[@id="result0"]//td[2]
    * Servers menu item: //li[@id="Dnn.Servers"]
    * Servers panel: //div[@id="Servers-panel"]
    * Clear Cache: //button[text()="Clear Cache"]
    * Scheduler menu item: //li[@id="Dnn.TaskScheduler"]
    * Scheduler panel: //div[@id="TaskScheduler-panel"]
    * SCHEDULER tab: //li[text()="SCHEDULER"]
    * the Edit Task icon next to Purge Cache task: //div[@class="row"][div[@title="Purge Cache"]]/div[@class="schedule-item item-row-editButton"]
    * Servers: //div[div/label/text()="Servers"]/div/input
    * Update: //button[text()="Update"]
    * the server selection dropdown: //div[contains(@class,"servergroup-filter-container")]/div
    * FAKE-SERVER-2 dropdown item: //li[text()="FAKE-SERVER-2"]
    * Purge Cache task: //div[@class="row"][div[@title="Purge Cache"]]
    * All dropdown item: //li[text()="All"]" from "https://confluence.devfactory.com/display/DNN/Environment+Data+Structure"
Given credentials "Use credentials specific to environment above as per the Environment Data Structure."

Scenario: Log in
Given browser "Chrome"
When I open "{environment.URL}"
And I wait unless "Login link" appears
And I click on "Login link"
And I wait unless "User Log In popup" appears
And I set "{credentials.username}" to "Username" value
And I set "{credentials.password}" to "Password" value
And I click on "Login button"
And I wait while "User Log In popup" appears
Then I should see "Logout" in "Login link"

Scenario: Add a fake web server
Given browser "Chrome"
When I hover on "SETTINGS menu"
And I click on "SQL Console menu item"
And I wait unless "SQL Console panel" appears
And I set "insert into WebServers (ServerName, CreatedDate, LastActivityDate, URL, IISAppName, Enabled, ServerGroup, UniqueId, PingFailureCount) values ('FAKE-SERVER-1', getdate(), getdate(), 'fake-server-1-url.dnndev.me', '/LM/W3SVC/991/ROOT', 1, null, null, 0), ('FAKE-SERVER-2', getdate(), getdate(), 'fake-server-2-url.dnndev.me', '/LM/W3SVC/992/ROOT', 1, null, null, 0); select * from WebServers where ServerName like 'FAKE-SERVER-%' order by ServerName" to "SQL script area" value
And I click on "Run Script"
Then I should see "FAKE-SERVER-1" in "ServerName column"
And I should see "FAKE-SERVER-2" in "ServerName column"

Scenario: Set a task to run on a fake server
Given browser "Chrome"
When I hover on "SETTINGS menu"
And I click on "Servers menu item"
And I wait unless "Servers panel" appears
And I click on "Clear Cache"
And I wait for "2" "seconds"
And I wait unless "Servers panel" appears
And I hover on "SETTINGS menu"
And I click on "Scheduler menu item"
And I wait unless "Scheduler panel" appears
And I click on "SCHEDULER tab"
And I click on "the Edit Task icon next to Purge Cache task"
And I set "FAKE-SERVER-1" to "Servers" value
And I click on "Update"
And I click on "the server selection dropdown"
And I click on "FAKE-SERVER-2 dropdown item"
Then "Purge Cache task" should not be displayed

Scenario: Cleanup
Given browser "Chrome"
When I click on "the server selection dropdown"
And I click on "All dropdown item"
And I click on "the Edit Task icon next to Purge Cache task"
And I set " " to "Servers" value
And I click on "Update"
And I hover on "SETTINGS menu"
And I click on "SQL Console menu item"
And I wait unless "SQL Console panel" appears
And I set "delete WebServers where ServerName like 'FAKE-SERVER-%'; select count(1) CountOfFakeServers from WebServers where ServerName like 'FAKE-SERVER-%'" to "SQL script area" value
And I click on "Run Script"
And I hover on "SETTINGS menu"
And I click on "Servers menu item"
And I wait unless "Servers panel" appears
And I click on "Clear Cache"
And I wait for "2" "seconds"
And I wait unless "Servers panel" appears
And I click on "Close Persona Bar button"
And I hover on "DNN logo"
And I click on "Logout"
Then I should see "Login" in "Login link"