Feature: BOINT-7730

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Automation Staging" from "https://confluence.devfactory.com/display/BI/00+-+E2E+Environment+Data+Structure"
Given credentials "sc_admin"
Given "GeneratedRandom" value is the current datetime "+0 milliseconds"

Scenario: Log in to Bonzai as a site collection administrator
Given browser "Chrome"
When I open "{environment.bonzai_home.Login URL}"
Then "Admin Menu Icon" should be displayed

Scenario: Navigate to Bonzai MarketPlace
When I click on "See All (for MarketPlace)"
Then "MarketPlace (Page)" should be displayed

Scenario: Open Site Contents
When I click on "Admin Menu Icon"
And I click on "Site contents"
Then "Site Contents (Header)" should be displayed
And "List Libraries and Other Apps" should be displayed

Scenario: Open MarketPlace Custom list
When I click on "MarketPlace Locations (in Site Contents)"
Then "MarketPlace Locations (Header in Site Contents)" should be displayed

Scenario: Click New Item
When I click on "New Item"
Then "Title Textbox (in New MarketPlace Location Form)" should be displayed

Scenario: Enter New Item Details
When I set "Title Textbox (in New MarketPlace Location Form)" value to "Loc_{GeneratedRandom}"
And I click on "Save Button (in New Location Form)"
And I set "Find an item Textbox" value to "Loc_{GeneratedRandom}"
Then I should see "Loc_{GeneratedRandom}" in "Location List (Last Item)"

Scenario: Navigate to List Settings
When I click on "List Tab (in Office Ribbon)"
And I click on "List Settings (in Office Ribbon)"
Then "MarketPlace Locations - Settings (Header)" should be displayed

Scenario: Verify All Locations is present
When I hover on "All Locations (in MarketPlace Locations Settings)"
Then "All Locations (in MarketPlace Locations Settings)" should be displayed

Scenario: Navigate back to MarketPlace
When I click on "Site Image Logo"
Then "MarketPlace (Page)" should be displayed

Scenario: Verify Added Location is Present
When I click on "Location Dropdown (in MarketPlace)"
Then I should see "Loc_{GeneratedRandom}" in "Location Dropdown Item (Last Item) (In MarketPlace)"