Feature: CRM-72520

# EnvDS Error: href is not a confluence link

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Use one of the environments available in the reference document.



Selectors: * user name: //*[@id="txtUserName_input"] 
 * password: //*[@id="txtPassword_input"]
 * Log In: //*[@id="btnLogin"]
 * Queries & Analyses: //*[@id="left_item5"]
 * New Query: //*[@id="n45"]
 * Query name: //*[@id="editor_name_input"]
 * UQL Syntax: //*[@id="editor_statement"]
 * Save: //*[@id="editor_header_button_0"]
 * Validation Summary: //*[@id="editor_validationSummary"]" from "https://docs.google.com/document/d/1ie2viZTgWBl8ECSO8LNBRd_zFNmMsKVE1MU168pxsyM/edit#heading=h.d2x0ibc29kgc"
Given credentials "Use the Default ACRM credentials"

Scenario: Navigate to ACRM.Web
When I open "{qaportal-url}"
And I click on "web" for the deployed environment
Then "ACRM.Web login" page should be displayed

Scenario: Login to ACRM.Web
When I set "user name" value to "{env.ACRM.credentials.username}"
And I set "password" value to "{env.ACRM.credentials.password}"
And I click on "Log In"
Then "Start page" page should be displayed

Scenario: Create a new query
When I click on "Queries & Analyses"
And I click on "New Query"
Then "New: Query" page should be displayed

Scenario: Set query information and save
When I set "Query name" value to "123456789123456789123456789123456789123456789123456789123456789"
And I set "UQL Syntax" value to "select (Company) from (FI)"
And I click on "Save"
Then I should see "123456789123456789123456789123456789123456789123456789123456" in "Query name"
And I should see "Query '123456789123456789123456789123456789123456789123456789123456' saved." in "Validation Summary"

Scenario: Edit query information and save
When I set "Query name" value to "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
And I click on "Save"
Then I should see "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefgh" in "Query name"
And I should see "Query 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefgh' saved." in "Validation Summary"