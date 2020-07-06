Feature: NORTHP-16902

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "* Environments * Telescope Web Server QA
    * Telescope Web Server STG" from "https://confluence.devfactory.com/display/NOR/Telescope+-+Testing+environments+-+Data+Structure+Environments"
Given credentials "telescopetswebqa"

Scenario: Login to the TSWeb
Given browser "Chrome"
When I open "{environment.endpoints.TSWeb application.URL}"
And I set "{credentials.telescopetswebqa.username}" to "Username" value
And I set "{credentials.telescopetswebqa.password}" to "Password" value
And I click on "Login"
Then "Telescope" page should be displayed

Scenario: Open Advanced search
Given browser "Chrome"
When I click on "More Searches"
And I click on "Advanced Search"
Then "TSWeb - Advanced Search - Advanced search dialog" should be displayed

Scenario: Fill up the fields to use asset category parameter
Given browser "Chrome"
When I set "Asset Category" to "TSWeb - Advanced Search - firs field parameter" value
And I set "Is" to "TSWeb - Advanced Search - firs field operator" value
And I set "Video" to "TSWeb - Advanced Search - firs field value" value
And I click on "TSWeb - Advanced Search - Edit button"
Then "TSWeb - Advanced Search - Save search frame" should be displayed

Scenario: Save search
Given browser "Chrome"
When I set "mysearch" to "TSWeb - Advanced Search - Save search name input" value
And I click on "TSWeb - Advanced Search - Save search button"
Then "TSWeb - Advanced Search - Save search frame" should not be displayed
And "TSWeb - Advanced Search - Saved search mysearch" should be displayed