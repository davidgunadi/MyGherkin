Feature: SUPSOFT-13165

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"
Given credentials "Analyst"

Scenario: Browser: Login to Support Administrator
Given browser "Chrome"
When I open "{environment.SupportSoft Administrator portal.URL}"
And I set "{credentials.Administrator.username}" to "Username In SA Login Page" value
And I set "{credentials.Administrator.password}" to "Password In SA Login Page" value
And I click on "Login Button In SA Login Page"
Then "SupportSoft - Support Administrator" page should be displayed
And "Platform Configuration in SA Menu" should be displayed

Scenario: Browser: Navigate to Solr Server Configuration Page
When I click on "Platform Configuration in SA Menu"
And I click on "Solr Server in SA Menu"
Then "Solr Server (Header)" should be displayed
And "Perform Fuzzy Searches Checkbox in Solr Server" should be displayed
And "Disable Spell Checkbox in Solr Server" should be displayed
And "Save Button in Solr Server" should be displayed

Scenario: Browser: Disable Fuzzy Search and Enable spell check
When I "uncheck" "Perform Fuzzy Searches Checkbox in Solr Server" checkbox
And I "uncheck" "Disable Spell Checkbox in Solr Server" checkbox
And I click on "Save Button in Solr Server"
Then I remember a value from "checked" attribute of "Perform Fuzzy Searches Checkbox in Solr Server" as "PerformFuzzyCheckboxStatus"
And I remember a value from "checked" attribute of "Disable Spell Checkbox in Solr Server" as "DisableSpellCheckboxStatus"
And the value of "PerformFuzzyCheckboxStatus" should be "false"
And the value of "DisableSpellCheckboxStatus" should be "false"


Scenario: Browser: Navigate to Solr Server Configuration Page
When I click on "Platform Configuration In SA Menu"
And I click on "Solr Server in SA Menu"
Then "Solr Server (Header)" should be displayed
And the value of "PerformFuzzyCheckboxStatus" should be "false"
And the value of "DisableSpellCheckboxStatus" should be "false"
And "Save Button in Solr Server" should be displayed