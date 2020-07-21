Feature: SUPSOFT-4334

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator" and "db_user"

Scenario: Browser: Login to SupportSoft Administrator portal
Given browser "Internet Explorer"
When I set "Administrator.username" to "Username In SA Login Page" value
And I set "Administrator.password" to "Password In SA Login Page" value
And I click on "Login Button In SA Login Page"
Then "Welcome to the Support Administrator" page should be displayed
And "Application Management in SA Menu" should be displayed

Scenario: navigate to SmartResults Administrator page in new tab
When I click on "Application Management in SA Menu" 
And I click on "SmartResults in SA Menu"
Then "SmartResults Administrator" page should be displayed
And "Manage Profiles Tab in SmartResults" should be displayed

Scenario: add Profile
When I click on "Manage Profiles Tab in SmartResults"
And I click on "Create New Button in Manage Profiles"
And I set "AAA Unique Profile Name" to "Profile Name Textbox in Manage Profiles" value
And I click on "Save Button in Manage Profiles"
Then "Profile Created Message in Manage Profiles" should be displayed

Scenario: run the query and see the result in Result Set
Given DB connection to "SupportSoft Database"
When I execute query "SELECT * FROM sprt_cr_profiles WITH(NOLOCK) WHERE [name] = 'AAA Unique Profile Name'"
Then queries should complete successfully