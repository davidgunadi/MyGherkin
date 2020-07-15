Feature: BOINT-8771

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

Scenario: Add Web Part in the "Row 1 Left Zone"
When I click on "Add a Web Part (under Row 1 Left Zone)"
Then "Web Part Adder (on top of the page)" should be displayed

Scenario: Select Bonzai Web Parts
When I click on "Bonzai Web Parts folder"
Then "People Listing Web Part" should be displayed

Scenario: Add People Listing Web Part
When I click on "People Listing Web Part"
And I click on "Add button"
Then "People Listing Web Part (under Row 1 Left Zone)" should be displayed

Scenario: Edit People Listing Web Part
When I hover on "People Listing Web Part (under Row 1 Left Zone)"
And I click on "Down Arrow next to People Listing Web Part"
And I click on "Edit Web Part (dropdown option)"
And I set "Site URL Textbox (in People Listing Web Part)" value to "/"
And I set "List Dropdown(in People Listing Web Part)" value to "People Listing"
And I set "View Dropdown (in People Listing Web Part)" value to "All Items"
And I set "Person Column Dropdown (in People Listing Web Part)" value to "Person to List"
And I "check" "Show Profile Picture Checkbox (in People Listing Web Part)" checkbox
And I "uncheck" "Show Email Address Checkbox (in People Listing Web Part)" checkbox
And I "uncheck" "Show Location Checkbox (in People Listing Web Part)" checkbox
And I "uncheck" "Show Job Title Checkbox (in People Listing Web Part)" checkbox
And I "uncheck" "Show Phone Number Checkbox (in People Listing Web Part)" checkbox
And I "check" "Show Promoted Items Checkbox (in People Listing Web Part)" checkbox
And I set "Display Users As Dropdown (in People Listing Web Part)" value to "Grid"
And I "uncheck" "Show Table Headers Checkbox (in People Listing Web Part)" checkbox
And I "check" "Use Paging Checkbox (in People Listing Web Part)" checkbox
And I set "Items per Page Textbox (in People Listing Web Part)" value to "10"
And I click on "OK Button (in People Listing Web Part)"
Then "Profile Image (under Row 1 Left Zone)" should be displayed

Scenario: Publish the Page and Verify that it is displayed as a Grid having three columns per row
When I click on "Publish Tab (in Sharepoint Ribbon)"
And I click on "Publish (in Sharepoint Ribbon)"
And I click on "Continue Button (in Publish Dialog)"
And I wait until "Profile Image (under Row 1 Left Zone)" disappears
Then I should verify what only human can verify:
"""
User verifies that People Listing Web Part is displayed as a Grid having three columns per row.
"""

Scenario: Enable Responsive Mode in Developer Tools
When I execute an action which only human can execute:
"""
User opens the Developer Tools and enables the Responsive Mode.
"""
Then I should verify what only human can verify:
"""
User verifies that the handles to resize the browser window vertically and horizontally are now displayed.
"""

Scenario: Resize Window Horizontally and Verify Table Changes
When I execute an action which only human can execute:
"""
User resizes the window horizontally
"""
Then I should verify what only human can verify:
"""
User verifies that once the width gets smaller, the items of People Listing Web Part will stack vertically in a responsive behaviour.
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