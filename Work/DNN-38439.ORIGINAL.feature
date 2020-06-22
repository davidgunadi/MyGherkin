Feature: DNN-38439

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
    * MANAGE menu: //li[@id="Manage"]
    * Sites menu item: //li[@id="Dnn.Sites"]
    * Sites panel: //div[@id="Sites-panel"]
    * Add New Site: //button[text()="Add New Site"]
    * Add New Site panel: //div[@class="create-portal"][.//h3[text()="Add New Site"]]
    * Title: //input[@id="add-new-site-title"]
    * Directory radio button: //li[label[text()="Directory"]]
    * Create Site: //button[text()="Create Site"]
    * My Website portal: //div[contains(@class,"portal-main-info")][.//div[text()="My Website"]]
    * My Website Site Settings icon: //div[contains(@class,"portal-main-info")][.//div[text()="My Website"]]//div[@title="Site Settings"]
    * Site Settings panel: //div[@id="SiteSettings-panel"]
    * Site Title: //div[div/label[text()="Site Title"]]//input
    * BACK TO SITES: //a[span/text()="Back To Sites"]
    * subsite portal: //div[contains(@class,"portal-main-info")][.//div[text()="subsite"]]
    * subsite Site Settings icon: //div[contains(@class,"portal-main-info")][.//div[text()="subsite"]]//div[@title="Site Settings"]
    * subsite Delete Site icon: //div[contains(@class,"portal-main-info")][.//div[text()="subsite"]]//div[@title="Delete Site"]
    * Yes: //a[@id="confirmbtn"]" from "https://confluence.devfactory.com/display/DNN/Environment+Data+Structure"
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

Scenario: Add a new site
Given browser "Chrome"
When I hover on "MANAGE menu"
And I click on "Sites menu item"
And I wait unless "Sites panel" appears
And I click on "Add New Site"
And I wait unless "Add New Site panel" appears
And I set "subsite" to "Title" value
And I click on "Directory radio button"
And I click on "Create Site"
And I wait unless "Sites panel" appears
Then "subsite" should be displayed

Scenario: Verify My Website settings
Given browser "Chrome"
When I hover on "My Website portal"
And I click on "My Website Site Settings icon"
And I wait unless "Site Settings panel" appears
Then I should see "My Website" in "Site Title"

Scenario: Verify subsite settings
Given browser "Chrome"
When I click on "BACK TO SITES"
And I wait unless "Sites panel" appears
And I hover on "subsite portal"
And I click on "subsite Site Settings icon"
And I wait unless "Site Settings panel" appears
Then I should see "subsite" in "Site Title"

Scenario: Cleanup
Given browser "Chrome"
When I click on "BACK TO SITES"
And I wait unless "Sites panel" appears
And I hover on "subsite portal"
And I click on "subsite Delete Site icon"
And I click on "Yes"
And I click on "Close Persona Bar button"
And I hover on "DNN logo"
And I click on "Logout"
Then I should see "Login" in "Login link"