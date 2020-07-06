Feature: NORTHP-16902

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Telescope Web Server QA" from "https://confluence.devfactory.com/display/NOR/Telescope+-+Testing+environments+-+Data+Structure+Environments"
Given credentials "telescopetswebqa"

Scenario: Login to the TSWeb
Given browser "Chrome"
When I open "{environment.endpoints.TSWeb application.URL}"
And I click on "Close (in Cookies Bar)"
And I set "{credentials.telescopetswebqa.username}" to "Username" value
And I set "{credentials.telescopetswebqa.password}" to "Password" value
And I click on "Login"
Then "Telescope" page should be displayed

Scenario: Open Advanced search
When I click on "More Searches"
And I click on "Advanced Search"
Then "Advanced Search Dialog" should be displayed

Scenario: Fill up the fields to use asset category parameter
When I click on "Field Dropdown (in Advanced Search)"
And I click on "Asset Category (dropdown Option)"
And I click on "Operator Dropdown (in Advanced Search)"
And I click on "Is (dropdown Option"
And I set "Video" to "Value Textbox (in Advanced Search)" value
And I click on "Edit Button (in Advanced Search)"
Then "Save Current Search As Textbox (in Advanced Search)" should be displayed

Scenario: Save search
Given "VarSavedSearchName" default value is "{date('YYYYMMDDmmss')}"
When I set "{VarSavedSearchName}" to "Save Current Search As Textbox (in Advanced Search)" value
And I click on "Save Button (in Advanced Search)"
Then "Save Current Search As Textbox (in Advanced Search)" should not be displayed
And "Option named VarSavedSearchName (under Saved Searches Dropdown)" should be displayed