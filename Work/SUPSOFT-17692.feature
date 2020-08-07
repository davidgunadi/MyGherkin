Feature: SUPSOFT-17692

As an administrator, I should be able to always generate a code for the user to connect to RA, when I am in the Support Center Web portal.
This is consistent because User can consistently generate code

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Login to Support Center
Given browser "Chrome"
When I open "{environment.SupportSoft Support Center portal.URL}"
And I set "{credentials.Administrator.username}" to "Username Textbox in SC Login Page" value
And I set "{credentials.Administrator.password}" to "Password Textbox in SC Login Page" value
And I click on "Login Button in SC Login Page"
Then "Logout Button in Top Menu" should be displayed

Scenario: Click "Manage Remote Access"
When I click on "Manage Remote Access in SC Menu"
Then "IAS IT View in SC Menu" should be displayed

Scenario: Click "IAS IT View"
When I click on "IAS IT View in SC Menu"
Then "Generate Connection Code Section" should be displayed
And "Direct Connect Section" should be displayed
And "Issue Queue (in IAS IT View Page)" should be displayed
And "Enter the name of the user for whom you want to generate the connection code Textbox" should be displayed
And "Generate Button (in IAS IT View Page)" should be displayed
And "Generate Connection Code Table" should be displayed

Scenario: Generate a new Connection Code
Given "GeneratedRandomUser" default value is "User{date('YYYYMMDDmmss')}"
When I set "Enter the name of the user for whom you want to generate the connection code Textbox" value to "{GeneratedRandomUser}"
And I click on "Generate Button (in IAS IT View Page)"
Then "GeneratedRandomUser in Generate Connection Code Table" should be displayed