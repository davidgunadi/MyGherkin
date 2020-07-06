Feature: NORTHP-16915

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* Environments * Telescope Web Server QA
    * Telescope Web Server STG" from "https://confluence.devfactory.com/display/NOR/Telescope+-+Testing+environments+-+Data+Structure+Environments"
Given credentials "telescopetswebqa"

Scenario: Create an advanced search
When I execute scenario "NORTHP-16902" with inputs "urlsearch" as "TSWeb - Advanced Search - Save search name input"
Then scenario steps should complete successfully

Scenario: Login to the TSWeb
Given browser "Chrome"
When I open "{environment.endpoints.TSWeb application.URL}"
And I set "{credentials.telescopetswebqa.username}" to "Username" value
And I set "{credentials.telescopetswebqa.password}" to "Password" value
And I click on "Login"
Then "Telescope" page should be displayed

Scenario: Login to the TSWeb
Given browser "Chrome"
When I open "{environment.endpoints.TSWeb application.URL}.woa/?redirect=%2Fwa%2Fservices%2Fuiservice%3Faction%3D11%26cmddata%3Durlsearch"
Then "Assets - assets list frame" should be displayed
And "Assets - First asset" should be displayed