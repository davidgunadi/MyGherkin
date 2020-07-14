Feature: NORTHP-16915

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Telescope Web Server QA" from "https://confluence.devfactory.com/display/NOR/Telescope+-+Testing+environments+-+Data+Structure+Environments"
Given credentials "telescopetswebqa"

Scenario: Create an advanced search
Given browser "Chrome"
Given "VarSavedSearchName" default value is "{date('YYYYMMDDmmss')}"
When I execute scenario "NORTHP-16902" with inputs "VarSavedSearchName" as "{VarSavedSearchName}"
Then "Save Current Search As Textbox (in Advanced Search)" should not be displayed
And "Option named VarSavedSearchName (under Saved Searches Dropdown)" should be displayed

Scenario: Login to the TSWeb
Given browser "Chrome"
When I open "{environment.endpoints.TSWeb application.URL}"
And I click on "Close (in Cookies Bar)"
And I set "{credentials.telescopetswebqa.username}" to "Username" value
And I set "{credentials.telescopetswebqa.password}" to "Password" value
And I click on "Login"
Then "Telescope" page should be displayed

Scenario: Login to the TSWeb
When I open "{environment.endpoints.TSWeb application.URL}.woa/?redirect=%2Fwa%2Fservices%2Fuiservice%3Faction%3D11%26cmddata%3D{VarSavedSearchName}"
Then "Assets List (in Assets Page)" should be displayed
And "First Asset (in Assets Page)" should be displayed