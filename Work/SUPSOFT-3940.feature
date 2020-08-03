Feature: SUPSOFT-3940

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/Non-prod+Environments+-+Supportsoft"
Given credentials "Administrator"

Scenario: Navigate to "Support Administrator Portal" and Login as Admin
Given browser "Chrome"
When I open "{environment.SupportSoft Administrator portal.URL}"
And I set "{credentials.Administrator.username}" to "Username In SA Login Page" value
And I set "{credentials.Administrator.password}" to "Password In SA Login Page" value
And I click on "Login Button In SA Login Page"
Then "SupportSoft - Support Administrator" page should be displayed

Scenario: Navigate to Application Management>Account Manager>Business Unit in the left menu
When I click on "Application Management in SA Menu"
And I click on "Account Manager in SA Menu"
And I click on "Business Unit in SA Menu"
Then "Business Units (Header)" should be displayed
And "Name (Table Header)" should be displayed
And "Description (Table Header)" should be displayed
And "New Button (in Business Units)" should be displayed

Scenario: Click on "New" button
When I click on "New Button (in Business Units)"
Then "Business Unit Name Textbox (in Create Business Unit Form)" should be displayed
And "Description Textbox (in Create Business Unit Form)" should be displayed
And "Save Button (in Create Business Unit Form)" should be displayed
And "Cancel Button (in Create Business Unit Form)" should be displayed

Scenario: Fill all fields and click on "Save" button
Given "BusinessUnitRandomValue" default value is "BusinessUnit{date('YYYYMMDDmmss')}"
When I set "Business Unit Name Textbox (in Create Business Unit Form)" value to "{BusinessUnitRandomValue}"
And I set "Description Textbox (in Create Business Unit Form)" value to "Desc{BusinessUnitRandomValue}"
And I click on "Save Button (in Create Business Unit Form)"
Then "Cell with the name BusinessUnitRandomValue" should be displayed