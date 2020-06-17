Feature: BOINT-9613

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Automation Staging" from "https://confluence.devfactory.com/display/BI/00+-+E2E+Environment+Data+Structure"
Given credentials "sc_admin"
Given credentials "brick_superadmin"

Scenario: Log in to Brick as Admin
Given browser "Chrome"
When I open "{environment.brick_home.URL}"
And I set "{credentials.brick_superadmin.username}" to "Brick Username" value
And I set "{credentials.brick_superadmin.password}" to "Brick Password" value
And I click on "Log me in button"
Then "Logout (in Brick)" should be displayed

Scenario: Search for Site Collection Settings
When I click on "Search Term Field"
And I type "intranet automation 1"
Then "Intranet Automation 1 Record (in Brick)" should be displayed

Scenario: Open Site Collection Configuration
When I click on "Cog Icon (for Intranet Automation 1 Record, in Brick)"
Then "Edit Bonzai Configuration Header" should be displayed

Scenario: Save TermStore Group Guid
When I hover on "TermStore Group Guid Textbox"
Then I remember a value from "TermStore Group Guid Textbox" as "termStoreGroupGUID"

Scenario: Save Footer Term Set Guid
When I hover on "Footer Term Set Guid Textbox"
Then I remember a value from "Footer Term Set Guid Textbox" as "footerTermSetGUID"

Scenario: Log in to Bonzai as a site collection administrator
When I open "{environment.bonzai_home.Login URL}"
Then "Admin Menu Icon" should be displayed

Scenario: Navigate to Site Settings
When I click on "Admin Menu Icon"
And I click on "Site settings"
Then "Site Settings (Header)" should be displayed

Scenario: Open Term Store Management Page
When I click on "Term store management link (in Site Settings)"
Then "Term Store Management Tool (Header)" should be displayed

Scenario: Verify TermStore Group Guid Matches
When I click on "Bonzai Automation Environment Terms (Tree Node)"
Then I should see "{termStoreGroupGUID}" in "Unique Identifier Value"

Scenario: Verify Footer Term Set Guid Matches
When I click on "Expand Node Icon (for Bonzai Automation Environment Terms)"
And I click on "Footer Navigation (Tree Node)"
Then I should see "{footerTermSetGUID}" in "Unique Identifier Value"

Scenario: Save the first Footer Header in the Hierarchy
When I click on "Expand Node Icon (for Footer Navigation)"
Then I remember a value from "title" attribute of "First Tree Node Under Footer Navigation" as "departmentName"

Scenario: Go back to Main Page and Verify Thethe The Same Footer is Displayed
When I click on "Logo (located on the left of Site Settings - Term Store Management Tool)"
Then I should see "{departmentName}" in "First Header in the Footer Section in Main Page"