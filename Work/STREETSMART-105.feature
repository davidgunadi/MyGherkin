Feature: STREETSMART-105 Company - Administration - Price Catalog - New Item

As a Company Admin, I want to be able to Create New Item on Price Catalog when I am in the administration dashboard
This is accessible because Company Admin should be able to Create New Item on Price Catalog

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "StreetSmart CRT" from "https://confluence.devfactory.com/display/SAASOPS/Environment+description+YAML"
Given credentials "Company Super Admin"

Scenario: Login to MC Website as "Company Super Admin"
Given browser "Chrome"
When I open "{environment.Web Site MC.URL}"
And I set "Username textbox(in Login page)" value to "{credentials.Company Super Admin.proposed_fields.username}"
And I set "Password textbox(in Login page)" value to "{credentials.Company Super Admin.proposed_fields.password}"
And I set "Company ID textbox(in Login page)" value to "{credentials.Company Super Admin.proposed_fields.domain}"
And I click on "Login button(in Login page)"
Then "Logout" should be displayed

Scenario: Hover on "Administration" Tab
When I hover on "Administration (Menu in Top Bar)"
Then "Price Catalog (List Item under Administration)" should be displayed

Scenario: Click "Price Catalog"
When I click on "Price Catalog (List Item under Administration)"
Then "Price Catalog Header" should be displayed

Scenario: Click "Add New Item"
When I click on "Add New Item (in Price Catalog Page)"
Then "Add New Item Dialog" should be displayed

Scenario: Fill in Fields and Save
Given "GeneratedIDNumber" default value is "{random_number(100000,999999)}"
Given "GeneratedItemName" default value is "TestItemName_{random_string(6)}"
Given "GeneratedPrice" default value is "{random_number(10,100)}"
Given "GeneratedTax" default value is "{random_number(10,30)}"
Given "GeneratedBarcode" default value is "{random_number(10000000,99999999)}"
When I set "ID Number Textbox (in Add New Item Dialog)" value to "{GeneratedIDNumber}"
And I set "Name Textbox (in Add New Item Dialog)" value to "{GeneratedItemName}"
And I set "Category Dropdown (in Add New Item Dialog)" value to "Default"
And I set "Suggested Unit Price Textbox (in Add New Item Dialog)" value to "{GeneratedPrice}"
And I set "Tax Rate Textbox (in Add New Item Dialog)" value to "{GeneratedTax}"
And I set "Barcode Number Textbox (in Add New Item Dialog)" value to "{GeneratedBarcode}"
And I click on "Save & Close Button (in Dialog)"
Then "GeneratedIDNumber Record in Price Catalog Table" should be displayed