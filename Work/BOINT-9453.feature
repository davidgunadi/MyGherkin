Feature: BOINT-9453

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Automation Staging" from "https://confluence.devfactory.com/display/BI/00+-+E2E+Environment+Data+Structure"
Given credentials "sc_admin"

Scenario: Log in to Bonzai as a site collection administrator
Given "RandomNumber" default value is "{date('MMDDhhmmss')}"
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

Scenario: Open "People Listing"
When I click on "People Listing (in Site Contents)"
Then "People Listing (Header in Site Contents)" should be displayed

Scenario: Click "New Item"
When I click on "New Item"
Then "Title Textbox (in New People Form)" should be displayed

Scenario: Enter "Title" and "Person to List", then Save
When I set "Title Textbox (in New People Form)" value to "Person_{RandomNumber}"
And I click on "Person to List Textbox (in New People Form)"
And I type "administrator"
And I click on "BONZAI\administrator (Dropdown Option)"
And I click on "Save Button (in New People Form)"
Then #need locator with name