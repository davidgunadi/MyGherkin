Feature: NORTHP-16593

As a user, I should be able to create a rule when I use the Rule Page in TSAdmin website
This is consistent because In this E2E we get the same result as expected

Scenario: Preconditions
Given quality bar version "20200115.1"
Given environment "Telescope Web Server QA" from "https://confluence.devfactory.com/display/NOR/Telescope+-+Testing+environments+-+Data+Structure+Environments"
Given credentials "telescopetswebqa"

Scenario: Login to the TSAdmin
Given browser "Chrome"
When I open "{environment.TSAdmin application.URL}"
And I click on "Connect To"
And I click on "TSAdmin - Administer - qnps_npsqadb option from dropdown"
And I set "{credentials.telescopetswebqa.username}" to "Username" value
And I set "{credentials.telescopetswebqa.password}" to "Password" value
And I click on "TSAdmin - Login"
Then "TeleScope Administrator" page should be displayed
And "TSAdmin - Logout" should be displayed

Scenario: Navigate to Rules
When I click on "TSAdmin - Rules button"
Then "Rules Administration" page should be displayed

Scenario: Click Add
When I click on "Add Button (in Rules Page)"
Then "Rule Definition" page should be displayed
And "Rule Name Textbox" should be displayed
And "Test Function Textarea" should be displayed
And "Challenge Form Textarea" should be displayed
And "Response Function Textarea" should be displayed
And "Default Error Message Textarea" should be displayed
And "Cancel Button (in Rule Definition Page)" should be displayed
And "Save Button (in Rule Definition Page)" should be displayed

Scenario: Enter New Rule Details and Save
Given "NewRule" default value is "XMP_CONVERSION_TEST_{date('YYYYMMDDmmss')}"
When I set "Rule Name Textbox" value to "{NewRule}"
And I set "select count(*) from doc_renditions" to "Test Function Textarea" value
And I set "Hello mr <!user_name!> from <!user_group!>! XMP Error Message!" to "Default Error Message Textarea" value
Then I should see "select count(*) from doc_renditions" in "Test Function Textarea"
Then I should see "Hello mr <!user_name!> from <!user_group!>! XMP Error Message!" in "Default Error Message Textarea"

Scenario: Save Rule
When I click on "Save Button (in Rule Definition Page)"
Then "Rule with the name 'NewRule' in the Rule Table" should be displayed

Scenario: Logout
When I click on "TSAdmin - Logout"
Then "Username" should be displayed