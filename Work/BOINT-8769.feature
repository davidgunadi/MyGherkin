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
Then "Landing Page 1 (4 Column w/ Header)" should be displayed

Scenario: Change Page Layout to "Landing Page 1 (4 column w/ header)"
When I click on "Landing Page 1 (4 Column w/ Header)"
Then "Full Zone Header" should be displayed

Scenario: Add Web Part in the "Header Zone"
When I click on "Add a Web Part (under Full Zone Header)"
Then "Web Part Adder (on top of the page)" should be displayed

Scenario: Select Bonzai Web Parts
When I click on "Bonzai Web Parts folder"
Then "People Listing Web Part" should be displayed

Scenario: Add People Listing Web Part
When I click on "People Listing Web Part"
And I click on "Add button"
Then "People Listing Web Part (under Full Zone Header)" should be displayed

Scenario: Edit People Listing Web Part
When I hover on "People Listing Web Part (under Full Zone Header)"
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
Then "Contact (Grid Header in People Listing Web Part Table)" should be displayed

Scenario: Publish the Page and Verify People Listing Web Part Components after Publishing
When I click on "Publish Tab (in Sharepoint Ribbon)"
And I click on "Publish (in Sharepoint Ribbon)"
And I click on "Continue Button (in Publish Dialog)"
And I wait until "People Listing Web Part (under Full Zone Header)" disappears
Then "Profile Image (in People Listing Web Part Table)" should be displayed
And "Contact (Grid Header in People Listing Web Part Table)" should be displayed
And "Job Title (Grid Header in People Listing Web Part Table)" should be displayed
And "Email (Grid Header in People Listing Web Part Table)" should be displayed
And "Location (Grid Header in People Listing Web Part Table)" should be displayed
And "Phone Number (Grid Header in People Listing Web Part Table)" should be displayed

Scenario: Enable Responsive Mode in Developer Tools
When I execute an action which only human can execute:
"""
User opens the Developer Tools and enables the Responsive Mode.
"""
Then I should verify what only human can verify:
"""
User verifies that the handles to resize the browser window vertically and horizontally are now displayed.VALUE
"""

Scenario: Resize Window Horizontally and Verify Table Changes
When I execute an action which only human can execute:
"""
User resizes the window horizontally
"""
Then I should verify what only human can verify:
"""
User verifies that once the width gets smaller, the table view of People Listing Web Part begins to hide some of its columns, until only the Person Picture and the Contact Name are visible at the smallest width.
"""

Scenario: Delete the Test Page
When I click on "Gear Icon (on top right of the page)"
And I click on "Edit page"
And I wait until "Checked out to you" appears
And I click on "Page Tab (in Sharepoint Ribbon)"
And I click on "Delete Page"
And I accept the alert box
Then "Services" page should be displayed

Scenario: Log Out
When I click on "Username (on top right of the page)"
And I click on "Sign Out"
Then "Please close the browser to complete sign out" should be displayed