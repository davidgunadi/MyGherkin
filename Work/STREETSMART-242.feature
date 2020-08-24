Feature: STREETSMART-242 Company - Administration - New company 

As a Root Super Admin, I want to be able to create a new company when I am in the administration dashboard
This is accessible because Root Super Admin should be able to create a new company

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "StreetSmart CRT" from "https://confluence.devfactory.com/display/SAASOPS/Environment+description+YAML"
Given credentials "Root Super Admin"

Scenario: Login to MC Website as "Root Super Admin"
Given browser "Chrome"
When I open "{environment.Web Site MC.URL}"
And I set "Username textbox(in Login page)" value to "{credentials.Root Super Admin.proposed_fields.username}"
And I set "Password textbox(in Login page)" value to "{credentials.Root Super Admin.proposed_fields.password}"
And I set "Company ID textbox(in Login page)" value to "{credentials.Root Super Admin.proposed_fields.domain}"
And I click on "Login button(in Login page)"
Then "Logout" should be displayed

Scenario: Hover on ADMINISTRATION
When I hover on "ADMINISTRATION (Menu in Top left)"
Then "Company (List Item under ADMINISTRATION)" should be displayed

Scenario: Click on COMPANIES
When I click on "Company (List Item under ADMINISTRATION)"
Then "Companies List Table" should be displayed

Scenario: Click Create
When I click on "Create Button (in Companies Page)"
Then "Create new Company Dialog" should be displayed

Scenario: Fill in new company details then Save & Close
Given "GeneratedCompanyName" default value is "Cpmpany{random_string(6)}"
When I set "Company Name Textbox (in Create new Company)" value to "{GeneratedCompanyName}"
And I set "Company Type Dropdown (in Create new Company)" value to "Test"
And I set "Package Dropdown (in Create new Company)" value to "StreetSmart Workforce Premier"
And I "check" "Add-On Packages Checkbox (in Create new Company)" checkbox
And I click on "Save & Close Button (in Create new Company)"
Then I remember the alert text as "AlertMessage"
And the value of "AlertMessage" should contain "Created New company with ID"

Scenario: Validate Company is Created
When I accept the alert box
Then "GeneratedCompanyName Record in Company Table" should be displayed