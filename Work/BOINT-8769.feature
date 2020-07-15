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
When I hover on "People Listing Web Part (under Header Zone)"
And I click on "Down Arrow next to People Listing Web Part"
And I click on "Edit Web Part (dropdown option)"
And I set "Site URL Textbox (in People Listing Web Part)" value to "/"
And I set "List Dropdown(in People Listing Web Part)" value to "People Listing"
And I set "View Dropdown (in People Listing Web Part)" value to "All Items"
And I set "Person Column Dropdown (in People Listing Web Part)" value to "Person to List"
And I "check" "Show Profile Picture Checkbox (in People Listing Web Part)" checkbox
And I "check" "Show Email Address Checkbox (in People Listing Web Part)" checkbox
And I "check" "Show Location Checkbox (in People Listing Web Part)" checkbox
And I "check" "Show Job Title Checkbox (in People Listing Web Part)" checkbox
And I "check" "Show Phone Number Checkbox (in People Listing Web Part)" checkbox
And I "check" "Show Promoted Items Checkbox (in People Listing Web Part)" checkbox
And I set "Display Users As Dropdown (in People Listing Web Part)" value to "Table"
And I "check" "Show Table Headers Checkbox (in People Listing Web Part)" checkbox
And I "check" "Use Paging Checkbox (in People Listing Web Part)" checkbox
And I set "Items per Page Textbox (in People Listing Web Part)" value to "10"
And I click on "OK Button (in People Listing Web Part)"
Then "Contact (Grid Header)" should be displayed

Scenario: Publish the Page and Verify People Listing Web Part Components after Publishing
When I click on "Publish Tab (in Sharepoint Ribbon)"
And I click on "Publish (in Sharepoint Ribbon)"
And I click on "Continue Button (in Publish Dialog)"
And I wait until "Publish Tab (in Sharepoint Ribbon)" disappears
Then "Profile Image (in People Listing Web Part Table)" should be displayed
Then "Contact (Grid Header in People Listing Web Part Table)" should be displayed
Then "Job Title (Grid Header in People Listing Web Part Table)" should be displayed
Then "Email (Grid Header in People Listing Web Part Table)" should be displayed
Then "Location (Grid Header in People Listing Web Part Table)" should be displayed
Then "Phone Number (Grid Header in People Listing Web Part Table)" should be displayed

Scenario: 

Scenario: Enable Responsive Mode in Developer Tools

Scenario: Resize Window Horizontally and Verify Table Changes

Scenario: Delete the Test Page

Scenario: Log Out