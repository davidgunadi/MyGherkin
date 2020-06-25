Feature: COTRAC-11380

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "QA" from "https://confluence.devfactory.com/display/AVOLIN/CoreTrac+-+EnvDS"
Given credentials "Admin"

Scenario: Login to the ResourceOne App
Given browser "Chrome"
When I open "{environment.R1 application endpoint.Login URL}"
And I set "Username" value to "{credentials.Admin.username}"
And I set "Password" value to "{credentials.Admin.password}"
And I click on "Sign In Button"
Then "ResourceOne" page should be displayed

Scenario: Navigate to Marketing Lists Page
When I wait until "Action Center Title" appears
And I wait until "Refresh icon on top bar" appears
And I click on "menu Marketing"
And I click on "submenu Marketing Lists"
Then "Marketing Lists" should be displayed

Scenario: Open existing Marketing List for editing
When I double click on "Row with the column value Contact for the column Type"
And I switch to second window
Then "Contact List header" should be displayed

Scenario: Open Edit Criteria panel for the Marketing List
When I hover on "menu Membership"
And I click on "submenu Edit Criteria"
Then "Criteria for Contact List header" should be displayed
And "Contacts Under ContentFrame" should be displayed

Scenario: Open Associated Accounts dialog
When I set "Associated Accounts" to "Add From" value
And I wait until "Add button under ContentFrame" appears
And I click on "Add button under ContentFrame"
Then I should see "Contacts whose Associated Accounts" in "Criteria Header"

Scenario: Navigate to General Contact Information Window
When I click on "Add button under ContentFrame"
Then "General Account Information dialog" should be displayed

Scenario: Add Associated Accounts General Info criteria
When I click on "Open Date checkbox"
And I wait until "Open Date Inputbox" appears
And I set "Open Date Inputbox" value to "{date('M/DD/YYYY')}"
And I click on "Add Criteria button for Account Information"
And I wait until "Criteria for Contact List Table" appears
Then "Criteria for Contact List header" should be displayed
And I should see "General Info: Open Date is on [\{date('M/DD/YYYY')}]" in "Criteria for Contact List Table"

Scenario: Open Associated Opportunities dialog
When I click on "Uplevel Icon for Associated Accounts"
And I wait until "Add From" appears
And I set "Associated Opportunities" to "Add From" value
And I click on "Add button under ContentFrame"
Then I should see "Contacts whose Associated Opportunities" in "Criteria Header"

Scenario: Navigate to General Contact Information Window
When I click on "Add button under ContentFrame"
Then "General Opportunity Information dialog" should be displayed

Scenario: Add Associated Opportunities General Info criteria
When I click on "Close Date checkbox"
And I wait until "Close Date Inputbox" appears
And I set "Close Date Inputbox" value to "{date('M/DD/YYYY')}"
And I click on "Add Criteria button for Account Information"
And I wait until "Criteria for Contact List Table" appears
Then "Criteria for Contact List header" should be displayed
And I should see "General Info: Lost Date is on [\{date('M/DD/YYYY')}]" in "Criteria for Contact List Table"

Scenario: Save Membership Criteria
When I click on "Uplevel Icon for Associated Opportunities"
And I wait until "Customize Goals - SAVE Goal button" appears
And I click on "Customize Goals - SAVE Goal button"
Then "Marketing List" page should be displayed

Scenario: Save the Marketing List
When I click on "New User - Save button"
And I wait until "menu Membership" appears
And I hover on "menu Membership"
And I click on "submenu Edit Criteria"
Then "Criteria for Contact List header" should be displayed
And I should see "Associated Accounts: Accounts" in "Criteria for Contact List Table"
And I should see "Associated Opportunities: Opportunities" in "Criteria for Contact List Table"

Scenario: Delete the added Criteria
When I click on "Delete icon next to Associated Accounts"
And I accept the alert box
And I wait until "Delete icon next to Associated Accounts" disappears
And I click on "Delete icon next to Associated Opportunities"
And I accept the alert box
And I wait until "Delete icon next to Associated Opportunities" disappears
And I click on "Customize Goals - SAVE Goal button"
And I click on "New User - Save button"
And I wait until "New User - Close button" appears
And I click on "New User - Close button"
And I switch to main window
Then "Marketing Lists" should be displayed