Feature: BOINT-6894

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Automation Staging" from "https://confluence.devfactory.com/display/BI/00+-+E2E+Environment+Data+Structure"
Given credentials "sc_admin"

Scenario: Log in to Bonzai as a site collection administrator
Given browser "Chrome"
When I open "{environment.bonzai_home.Login URL}"
Then "Admin Menu Icon" should be displayed

Scenario: Navigate to Site Settings
When I click on "Admin Menu Icon"
And I click on "Site settings"
Then "Site Settings (Header)" should be displayed

Scenario: Open Term Store Management Page
When I click on "Term store management link (in Site Settings)"
Then "Term Store Management Tool (Header)" should be displayed

Scenario: Expand "Bonzai Automation Environment"
When I click on "Expand Node Icon (for Bonzai Automation Environment Terms)"
Then "Intranet Navigation (Tree Node)" should be displayed

Scenario: Right Click on "Intranet Navigation"
When I right click on "Intranet Navigation (Tree Node)"
Then "Copy Term Set (Popup Menu Item)" should be displayed

Scenario: Click Copy Terms and Accept Confirmation
When I click on "Copy Term Set (Popup Menu Item)"
And I accept the alert box
Then "Copy of Intranet Navigation (Tree Node)" should be displayed

Scenario: Select Newly Created Term Set and Select General Tab
When I click on "Copy of Intranet Navigation (Tree Node)"
And I click on "General Tab (in Site Settings)"
Then "Term Set Name Textbox (in Site Settings)" should be displayed

Scenario: Update Term Set Name to "Intranet Navigation - FR"
Given "IntranetNavigationFRRandomValue" default value is "Intranet Navigation-FR-{date('YYYYMMDDmmss')}"
When I set "Term Set Name Textbox (in Site Settings)" value to "{IntranetNavigationFRRandomValue}"
And I click on "Save Button (in Site Settings)"
Then I should see "{IntranetNavigationFRRandomValue}" in "Term Set Name Textbox (in Site Settings)"

Scenario: Expand "Intranet Navigation - FR" and right click Home Term
When I click on "Expand Node Icon (for IntranetNavigationFRRandomValue)"
And I click on "Home (Tree Node)"
And I right click on "Home (Tree Node)"
Then "Copy Term (Popup Menu Item)" should be displayed

Scenario: Click Copy Term
When I click on "Copy Term (Popup Menu Item)"
Then "Copy of Home (Tree Node)" should be displayed

Scenario: Right Click Original Term and click Delete, and Accept Confirmation
When I click on "Home (Tree Node)"
And I right click on "Home (Tree Node)"
And I click on "Delete Term (Popup Menu Item)"
And I accept the alert box
Then "Home (Tree Node)" should not be displayed

Scenario: Select the Copy and Select General Tab
When I click on "Copy of Home (Tree Node)"
And I click on "General Tab (in Site Settings)"
Then "Default Label Textbox (in Site Settings)" should be displayed

Scenario: Update the Default Label to "Home - FR"
When I click on "Default Label Textbox (in Site Settings)"
And I set "Default Label Textbox (in Site Settings)" value to ""
And I set "Default Label Textbox (in Site Settings)" value to "Home - FR"
And I click on "Save Button (in Site Settings)"
And I wait until "Home - FR (Tree Node)" disappears
Then I should see "Home - FR" in "Default Label Textbox (in Site Settings)"
And "Home - FR (Tree Node)" should be displayed

Scenario: Click "Intranet Navigation - FR" and select Custom Sort Tab
When I click on "IntranetNavigationFRRandomValue (Tree Node)"
And I click on "CUSTOM SORT Tab (in Site Settings)"
Then "Custom Sort Order Label (in Site Settings)" should be displayed

Scenario: Select "Use custom sort order" and set "Home FR" to 1 and Save
When I click on "Sort Order Dropdown for Home - FR"
And I click on "Option 1 (in Sort Order Dropdown for Home - FR)"
And I click on "Save Button (in Site Settings)"
And I wait until "Home - FR (Displayed as the first item in the Tree View Order)" appears
Then "Home - FR (Displayed as the first item in the Tree View Order)" should be displayed
And I should see "1" in "Sort Order Dropdown for Home - FR"