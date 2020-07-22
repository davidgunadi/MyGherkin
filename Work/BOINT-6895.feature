Feature: BOINT-6895

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Quality" from "https://confluence.devfactory.com/display/BI/00+-+E2E+Environment+Data+Structure"
Given credentials "brick_admin"

Scenario: Execute BOINT-6894 - Create Intranet Navigation Terms Sets for French Language
Given "IntranetNavigationFRRandomValue" default value is "Intranet Navigation-FR-{date('YYYYMMDDmmss')}"
When I execute scenario "BOINT-6894" with inputs "IntranetNavigationFRRandomValue" as "{IntranetNavigationFRRandomValue}" to capture outputs "IntranetNavigationFRUniqueIdentifier"

Scenario: Login to Brick
Given browser "Chrome"
When I open "{environment.brick_home.URL}"
And I set "{credentials.brick_admin.username}" to "Brick Username" value
And I set "{credentials.brick_admin.password}" to "Brick Password" value
And I click on "Log me in button"
Then "Logout (in Brick)" should be displayed

Scenario: Perform a search for "Intranet Manual Staging"
When I click on "Search Term Field"
And I type "Intranet Manual Staging"
Then "Intranet Manual Staging Record (in Brick)" should be displayed

Scenario: Open the Bonzai Configuration by clicking on the Config Icon in the result
When I click on "Cog Icon (for Intranet Manual Staging Record, in Brick)"
Then "Edit Bonzai Configuration Header" should be displayed

Scenario: Select the target language (e.g. French) from the language dropdown
When I set "French" to "Language Dropdown (in Edit Bonzai Configuration)" value
And I press "TAB"
Then "FR Icon (next to the textboxes)" should be displayed

Scenario: Copy the new French Navigation Term Set Guid from BOINT-6894 into the proper field
When I set "Navigation Term Set Guid Textbox" value to "{IntranetNavigationFRUniqueIdentifier}"
Then I should see "{IntranetNavigationFRUniqueIdentifier}" in "Navigation Term Set Guid Textbox"
And I remember a value from "value" attribute of "Cache Key Textbox" as "CacheKeyOriginalValue"

Scenario: Update the cache key by incrementing its current value
Given "CacheKeyIncrementedValue" default value is "{to_int(CacheKeyOriginalValue)+1}"
When I set "Cache Key Textbox" value to "{CacheKeyIncrementedValue}"
Then I should see "{CacheKeyIncrementedValue}" in "Cache Key Textbox"

Scenario: Save the configuration by clicking on the Save button.
When I click on "Save Button (in Edit Bonzai Configuration)"
Then "Your configuration has been saved" should be displayed