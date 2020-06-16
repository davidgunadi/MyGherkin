Feature: DNN-34072

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
    * MANAGE menu: //li[@id='Manage']
    * Sites menu item: //li[@id='Dnn.Sites']
    * Sites panel: //div[@id='Sites-panel']
    * Add New Site: //button[text()="Add New Site"]
    * Add New Site panel: //div[@class='create-portal']
    * Title: //input[@id='add-new-site-title']
    * Site Type: //li[label[text()="Directory"]]
    * Assign Current User as Administrator toggle: //span[contains(@class,'dnn-switch') and ../../span[text()="Assign Current User as Administrator"]]
    * Administrator User Name: //input[@id='admin-user-name']
    * First Name: //input[@id='admin-first-name']
    * Last Name: //input[@id='admin-last-name']
    * Email: //input[@id='admin-email']
    * Admin Password: //input[@id='admin-password']
    * Confirm Password: //input[@id='admin-password-confirm']
    * Create Site: //button[text()="Create Site"]
    * subsite link: //a[contains(@href,"/subsite")]
    * Delete Site: //div[@title="Delete Site"][../../div/div/div/a[contains(@href,"/subsite")]]
    * Yes: //a[@id='confirmbtn']" from "https://confluence.devfactory.com/display/DNN/Environment+Data+Structure"
Given credentials "Use credentials specific to environment above as per the Environment Data Structure."

Scenario: Log in
Given browser "Chrome"
When I open "{Environment.endpoints.Site.URL}"
And I wait unless "Login link" appears
And I click on "Login link"
And I wait unless "User Log In popup" appears
And I set "{credential.username}" to "Username" value
And I set "{credentials.password}" to "Password" value
And I click on "Login button"
And I wait while "User Log In popup" appears
Then I should see "Logout" in "Login link"

Scenario: Create a portal
Given browser "Chrome" as "browser"
When I hover on "MANAGE menu"
And I click on "Sites menu item"
And I wait unless "Sites panel" appears
And I click on "Add New Site"
And I wait unless "Add New Site panel" appears
And I set "subsite" to "Title" value
And I set "Directory" to "Site Type" value
And I click on "Assign Current User as Administrator toggle"
And I set "subsiteadmin" to "Administrator User Name" value
And I set "Subsite" to "First Name" value
And I set "Admin" to "Last Name" value
And I set "subsiteadmin@change.me" to "Email" value
And I set "Pass1234" to "Admin Password" value
And I set "Pass1234" to "Confirm Password" value
And I click on "Create Site"
And I wait unless "Sites panel" appears
Then "subsite link" should be displayed

Scenario: Cleanup
Given browser "Chrome" as "browser"
When I hover on "subsite link"
And I click on "Delete Site"
And I click on "Yes"
And I click on "Close Persona Bar button"
And I hover on "DNN logo"
And I click on "Logout"
Then I should see "Login" in "Login link"