Feature: BOINT-8769

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Quality" from "https://confluence.devfactory.com/display/BI/00+-+E2E+Environment+Data+Structure"
Given credentials "sc_admin"

Scenario: Log in to Bonzai as a administrator
Given browser "Chrome"
When I open "{environment.bonzai_home.CredURL}"
Then "Admin Menu Icon" should be displayed

Scenario: Navigate to Add a Page
When I click on "Gear Icon (on top right of the page)"
And I click on "Add a page"
Then "Page Name Textbox" should be displayed

Scenario: Enter New Page Details and Create
Given "RandomValue" default value is "{date('YYYYMMDDmmss')}"
When I set "Page Name Textbox" value to "Page_{RandomValue}"
And I click on "Create"
And I wait until "Checked out to you" appears
Then "Page_{RandomValue}" page should be displayed

Scenario: Open Page Layout
When I click on "Page Tab (in Sharepoint Ribbon)"
And I click on "Page Layout (in Sharepoint Ribbon)"
Then "Home Page 1 (4 Column) - under Page Layout Popup" should be displayed

Scenario: Change Page Layout to "Landing Page 1 (4 column w/ header)"
When I click on "Home Page 1 (4 Column) - under Page Layout Popup"
Then "Header Zone" should be displayed

Scenario: Add Web Part in the "Header Zone"
When I click on "Add a Web Part (under Header Zone)"
Then "Web Part Adder (on top of the page)" should be displayed

Scenario: Select Bonzai Web Parts
When I click on "Bonzai Web Parts folder"
Then "People Listing Web Part" should be displayed

Scenario: Add People Listing Web Part
When I click on "People Listing Web Part"
And I click on "Add button"
Then "People Listing Web Part (under Header Zone)" should be displayed

Scenario: Edit People Listing Web Part

Scenario: Publish the Page

Scenario: Verify People Listing Web Part Components after Publishing

Scenario: Enable Responsive Mode in Developer Tools

Scenario: Resize Window Horizontally and Verify Table Changes

Scenario: Delete the Test Page

Scenario: Log Out