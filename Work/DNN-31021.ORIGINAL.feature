Feature: DNN-31021

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
    * Home: //li[a/span/text()="Home"]
    * CONTENT menu: //li[@id="Content"]
    * Pages menu item: //li[@id="Dnn.Pages"]
    * Pages panel: //div[@id="Pages-panel"]
    * Advanced: //li[text()="Advanced"]
    * S.E.O.: //li[text()="S.E.O."]
    * Add URL: //div[@class="AddItemBox" and text()="Add URL"]
    * URL Path: //div[div/label/text()="URL Path"]/div/input
    * Save: //div[@class="editUrl"]//button[text()="Save"]
    * invalid URL error dialog: //p[@id="notification-message"]
    * the new page URL: //div[@class="url-table"]/div[div/text()="/-test"]
    * the delete icon next to the new page URL: //div[@class="url-table"]/div[div/text()="/-test"]//div[@class="extension-action"][1]
    * Delete: //a[@id="confirmbtn"]" from "https://confluence.devfactory.com/display/DNN/Environment+Data+Structure"
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

Scenario: Add an illegal URL to a page
Given browser "Chrome"
When I click on "Home"
And I wait unless "CONTENT menu" appears
And I hover on "CONTENT menu"
And I click on "Pages menu item"
And I wait unless "Pages panel" appears
And I click on "Advanced"
And I click on "S.E.O."
And I click on "Add URL"
And I set "/(test)" to "URL Path" value
And I click on "Save"
And I wait unless "invalid URL error dialog" appears
Then I should see "The Page URL entered contains characters which cannot be used in a URL" in "invalid URL error dialog"

Scenario: Verify suggested URL
Given browser "Chrome"
When I wait while "invalid URL error dialog" appears
Then I should see "/-test" in "URL Path"

Scenario: Accept suggested URL
Given browser "Chrome"
When I click on "Save"
Then "the new page URL" should be displayed

Scenario: Cleanup
Given browser "Chrome"
When I click on "the delete icon next to the new page URL"
And I click on "Delete"
And I click on "Close Persona Bar button"
And I hover on "DNN logo"
And I click on "Logout"
Then I should see "Login" in "Login link"