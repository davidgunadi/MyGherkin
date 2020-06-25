Feature: SUPSOFT-4094

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* Environment * QA : Make rdp to "SupportSoft Server"" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "* Administrator credential should be used."

Scenario: Browser: Login to Support Administrator
Given browser "Internet Explorer"
When I open "{environment.Support Administrator portal.URL}"
And I set "Username In SA Login Page" value to "Administrator.Username"
And I set "Password In SA Login Page" value to "Administrator.Password"
And I click on "Login Button In SA Login Page"
Then "Welcome to the Support Administrator" page should be displayed

Scenario: Browser: Navigate to Solr Server Configuration Page
When I click on "Platform Configuration In SA Menu" 
And I click on "Solr Server in SA Menu"
Then "Solr Server" page should be displayed
And "Perform Fuzzy Searches Checkbox in Solr Server" should be displayed
And "Disable Spell Checkbox in Solr Server" should be displayed
And "Save Button in Solr Server" should be displayed

Scenario: Browser: Disable Fuzzy Search and Enable spell check
When I "uncheck" "Perform Fuzzy Searches Checkbox in Solr Server" checkbox
And I "uncheck" "Disable Spell Checkbox in Solr Server" checkbox
And I click on "Save Button in Solr Server"
Then "Unchecked Perform Fuzzy Searches Checkbox in Solr Server" should be displayed
And "UnChecked Disable Spell Checkbox in Solr Server" should be displayed

Scenario: Browser: Navigate to Solr Server Configuration Page
When I click on "Platform Configuration In SA Menu" 
And I click on "Solr Server in SA Menu"
Then "Solr Server" page should be displayed
And "Unchecked Perform Fuzzy Searches Checkbox in Solr Server" should be displayed
And "UnChecked Disable Spell Checkbox in Solr Server" should be displayed
And "Save Button in Solr Server" should be displayed